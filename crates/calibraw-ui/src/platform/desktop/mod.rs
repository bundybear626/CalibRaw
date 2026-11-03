//! The desktop backend (Linux, Windows, macOS).

pub(super) mod discord;
mod entry;
pub(super) mod files;
#[cfg(target_os = "macos")]
mod macos_menu;
#[cfg(target_os = "windows")]
mod nvidia_vrr;
mod portal;

pub(crate) use entry::main;

use super::service::Platform;
use super::PlatformCaps;
use std::ffi::OsString;
use std::path::PathBuf;
use std::sync::{Arc, Mutex};

/// Set in a process started by `restart_after_gpu_loss_command`, so a GPU
/// that fails again right away does not restart CalibRaw in a loop.
const RESTARTED_AFTER_GPU_LOSS: &str = "CALIBRAW_RESTARTED_AFTER_GPU_LOSS";

pub(crate) struct DesktopPlatform {
    launch_path: Mutex<Option<PathBuf>>,
}

impl DesktopPlatform {
    pub(crate) fn new() -> Arc<Self> {
        Arc::new(Self {
            launch_path: Mutex::new(launch_path_from_args(std::env::args_os().skip(1))),
        })
    }
}

/// The first argument that names an existing file; options starting with
/// `--` are skipped.
fn launch_path_from_args(args: impl IntoIterator<Item = OsString>) -> Option<PathBuf> {
    args.into_iter()
        .filter(|arg| !arg.to_string_lossy().starts_with("--"))
        .map(PathBuf::from)
        .find(|path| path.is_file())
}

impl Platform for DesktopPlatform {
    fn caps(&self) -> PlatformCaps {
        PlatformCaps::DESKTOP
    }

    #[cfg(target_os = "macos")]
    fn attach_ui(&self, request_repaint: Box<dyn Fn() + Send + Sync>) {
        macos_menu::set_wake_ui(Some(request_repaint));
    }

    #[cfg(target_os = "macos")]
    fn detach_ui(&self) {
        macos_menu::set_wake_ui(None);
    }

    #[cfg(target_os = "macos")]
    fn take_settings_request(&self) -> bool {
        macos_menu::take_settings_request()
    }

    fn take_launch_path(&self) -> Option<PathBuf> {
        self.launch_path
            .lock()
            .unwrap_or_else(std::sync::PoisonError::into_inner)
            .take()
    }

    fn performance_settings_path(&self) -> Result<Option<PathBuf>, String> {
        Ok(performance_settings_path())
    }

    fn model_root(&self) -> PathBuf {
        calibraw_ai::desktop_model_root()
    }

    fn reveal_file(&self, path: &std::path::Path) -> Result<(), String> {
        #[cfg(target_os = "windows")]
        let mut command = {
            let mut command = std::process::Command::new("explorer.exe");
            let mut argument = std::ffi::OsString::from("/select,");
            argument.push(path);
            command.arg(argument);
            command
        };
        #[cfg(target_os = "macos")]
        let mut command = {
            let mut command = std::process::Command::new("open");
            command.arg("-R").arg(path);
            command
        };
        #[cfg(all(unix, not(target_os = "macos")))]
        let mut command = {
            let mut command = std::process::Command::new("xdg-open");
            command.arg(path.parent().unwrap_or(path));
            command
        };
        command
            .spawn()
            .map(|_| ())
            .map_err(|error| format!("Could not open the file manager: {error}"))
    }

    fn gpu_pipeline_cache_dir(&self) -> Result<Option<PathBuf>, String> {
        Ok(Some(
            calibraw_core::thumbnail_cache::desktop_app_cache_root(),
        ))
    }

    fn gpu_ai_job_record_path(&self) -> Option<PathBuf> {
        Some(calibraw_core::thumbnail_cache::desktop_app_cache_root().join("gpu-ai-job.txt"))
    }

    /// This program with its arguments, or `None` after a restart that
    /// already followed a GPU loss, and inside Flatpak, whose sandbox ends
    /// with this process.
    fn restart_after_gpu_loss_command(&self) -> Option<std::process::Command> {
        if std::env::var_os(RESTARTED_AFTER_GPU_LOSS).is_some()
            || std::env::var_os("FLATPAK_ID").is_some()
        {
            return None;
        }
        // An AppImage runs from a temporary mount; restart the image itself.
        let program = match std::env::var_os("APPIMAGE") {
            Some(image) => PathBuf::from(image),
            None => std::env::current_exe().ok()?,
        };
        let mut command = std::process::Command::new(program);
        command
            .args(std::env::args_os().skip(1))
            .env(RESTARTED_AFTER_GPU_LOSS, "1");
        Some(command)
    }

    fn clear_thumbnail_cache(&self) -> Result<(), String> {
        calibraw_core::thumbnail_cache::clear_desktop_thumbnail_cache()
    }

    fn thumbnail_cache_size_bytes(&self) -> Result<u64, String> {
        calibraw_core::thumbnail_cache::desktop_thumbnail_cache_size_bytes()
    }
}

pub(in crate::platform) fn performance_settings_path() -> Option<PathBuf> {
    #[cfg(target_os = "windows")]
    let base = std::env::var_os("APPDATA").map(PathBuf::from);

    #[cfg(target_os = "macos")]
    let base = std::env::var_os("HOME")
        .map(PathBuf::from)
        .map(|home| home.join("Library/Application Support"));

    #[cfg(all(unix, not(target_os = "macos"), not(target_os = "android")))]
    let base = std::env::var_os("XDG_CONFIG_HOME")
        .map(PathBuf::from)
        .or_else(|| {
            std::env::var_os("HOME")
                .map(PathBuf::from)
                .map(|home| home.join(".config"))
        });

    #[cfg(not(any(windows, unix, target_os = "macos")))]
    let base: Option<PathBuf> = None;

    base.map(|base| base.join("calibraw").join("performance.json"))
}

#[cfg(test)]
mod tests {
    use super::launch_path_from_args;
    use std::ffi::OsString;

    #[test]
    fn launch_path_is_the_first_existing_file_that_is_not_an_option() {
        let photo = tempfile::NamedTempFile::new().unwrap();
        let folder = tempfile::tempdir().unwrap();
        let args = [
            OsString::from("--some-option"),
            folder.path().as_os_str().to_owned(),
            OsString::from("missing-photo.orf"),
            photo.path().as_os_str().to_owned(),
        ];
        assert_eq!(launch_path_from_args(args).as_deref(), Some(photo.path()));
    }

    #[test]
    fn no_launch_path_without_a_file_argument() {
        assert_eq!(launch_path_from_args([OsString::from("--flag")]), None);
        assert_eq!(launch_path_from_args(Vec::<OsString>::new()), None);
    }
}
