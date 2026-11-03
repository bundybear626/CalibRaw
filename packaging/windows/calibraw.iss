#preproc ispp

#ifndef AppVersion
  #error AppVersion must be supplied by the build workflow
#endif

#ifndef ArtifactArch
  #error ArtifactArch must be supplied by the build workflow
#endif

#define PackageDir "..\..\dist\CalibRaw-windows-" + ArtifactArch

[Setup]
AppId={{BC6F251A-F9D8-47A4-B1D4-912C13082DD0}
AppName=CalibRaw
AppVersion={#AppVersion}
AppVerName=CalibRaw {#AppVersion}
AppPublisher=Duecki and CalibRaw contributors
AppPublisherURL=https://calibraw.dueckis.de
AppSupportURL=https://github.com/Duecki1/CalibRaw/issues
AppUpdatesURL=https://github.com/bundybear626/CalibRaw/releases
AppReadmeFile={app}\README.md
DefaultDirName={autopf}\CalibRaw
DefaultGroupName=CalibRaw
DisableProgramGroupPage=yes
LicenseFile={#PackageDir}\COPYING
OutputDir=..\..\dist
OutputBaseFilename=CalibRaw-windows-{#ArtifactArch}-setup
SetupIconFile=..\icons\calibraw.ico
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
Uninstallable=yes
CreateUninstallRegKey=yes
UninstallDisplayName=CalibRaw
UninstallDisplayIcon={app}\calibraw.exe
#if ArtifactArch == "x86_64"
ArchitecturesAllowed=x64compatible and not arm64
ArchitecturesInstallIn64BitMode=x64compatible
#elif ArtifactArch == "arm64"
ArchitecturesAllowed=arm64
ArchitecturesInstallIn64BitMode=arm64
#else
  #error Unsupported ArtifactArch
#endif

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#PackageDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Registry]
; Lets photo managers and Explorer's "Open with" start CalibRaw on a photo.
Root: HKA; Subkey: "Software\Classes\CalibRaw.Image"; ValueType: string; ValueName: ""; ValueData: "CalibRaw image"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\CalibRaw.Image\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\calibraw.exe,0"
Root: HKA; Subkey: "Software\Classes\CalibRaw.Image\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\calibraw.exe"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe"; ValueType: string; ValueName: "FriendlyAppName"; ValueData: "CalibRaw"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\calibraw.exe"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".3fr"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".ari"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".arw"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".bay"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".bmq"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".cap"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".cine"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".cr2"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".cr3"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".crw"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".cs1"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".dc2"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".dcr"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".dcs"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".dng"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".drf"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".eip"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".erf"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".fff"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".gpr"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".iiq"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".k25"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".kc2"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".kdc"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".mdc"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".mef"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".mos"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".mrw"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".nef"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".nefx"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".nrw"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".obm"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".orf"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".pef"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".ptx"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".pxn"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".qtk"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".raf"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".raw"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".rdc"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".rw2"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".rwl"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".rwz"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".sr2"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".srf"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".srw"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".sti"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".tif"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".tiff"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".jpg"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".jpeg"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".jpe"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".png"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".heic"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".heif"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\calibraw.exe\SupportedTypes"; ValueType: string; ValueName: ".hif"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\.3fr\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.ari\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.arw\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.bay\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.bmq\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.cap\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.cine\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.cr2\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.cr3\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.crw\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.cs1\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.dc2\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.dcr\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.dcs\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.dng\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.drf\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.eip\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.erf\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.fff\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.gpr\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.iiq\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.k25\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.kc2\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.kdc\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.mdc\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.mef\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.mos\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.mrw\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.nef\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.nefx\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.nrw\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.obm\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.orf\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.pef\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.ptx\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.pxn\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.qtk\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.raf\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.raw\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.rdc\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.rw2\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.rwl\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.rwz\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.sr2\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.srf\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.srw\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.sti\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.tif\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.tiff\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.jpg\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.jpeg\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.jpe\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.png\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.heic\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.heif\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.hif\OpenWithProgids"; ValueType: string; ValueName: "CalibRaw.Image"; ValueData: ""; Flags: uninsdeletevalue

[Icons]
Name: "{group}\CalibRaw"; Filename: "{app}\calibraw.exe"; WorkingDir: "{app}"
Name: "{group}\{cm:UninstallProgram,CalibRaw}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\CalibRaw"; Filename: "{app}\calibraw.exe"; WorkingDir: "{app}"; Tasks: desktopicon

[Run]
Filename: "{app}\calibraw.exe"; Description: "{cm:LaunchProgram,CalibRaw}"; WorkingDir: "{app}"; Flags: nowait postinstall skipifsilent
