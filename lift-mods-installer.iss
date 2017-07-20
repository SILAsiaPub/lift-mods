; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
OutputBaseFilename=lift-mods-installer
AppName=Lift-mods-for-DAB
AppVersion=0.2
DefaultDirName=C:\programs\lift-mods
DisableDirPage=true
DefaultGroupName=Publishing
UninstallDisplayIcon={app}\u.ico
Compression=lzma2
SolidCompression=yes


[Files]
Source: "transform.hta"; DestDir: "{app}"
Source: "run.cmd"; DestDir: "{app}"
Source: "*.ico"; DestDir: "{app}"
Source: "Readme.md"; DestDir: "{app}"
Source: "*.txt"; DestDir: "{app}"
Source: "*.xslt"; DestDir: "{app}"
Source: "LICENSE"; DestDir: "{app}"
;Source: "jre-8u11-windows-x64.exe"; DestDir: "{tmp}"; DestName: "JREInstall.exe"; Check: IsWin64 AND InstallJava(); Flags: deleteafterinstall
;Source: "jre-8u11-windows-i586.exe"; DestDir: "{tmp}"; DestName: "JREInstall.exe"; Check: (NOT IsWin64) AND InstallJava(); Flags: deleteafterinstall
Source: "tools\UNZIP.EXE"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: "tools\SaxonHE9-8-0-3J.zip"; DestDir: "{tmp}"; Flags: deleteafterinstall

[Icons]
Name: "{group}\Lift-mods for DAB"; Filename: "{app}\transform.hta"; IconFilename: "{app}\transform.ico"
Name: "{group}\Uninstall Lift-mods for DAB"; Filename: "{uninstallexe}" ; IconFilename: "{app}\u.ico"


[Run]
Filename: "{tmp}\UNZIP.EXE"; Parameters: "{tmp}\SaxonHE9-8-0-3J.zip -d {app}\saxon"

[script]
function InstallJava() : Boolean;
var
  ErrCode: Integer;
  JVer: String;
  InstallJ: Boolean;
begin
  RegQueryStringValue(
    HKLM, 'SOFTWARE\JavaSoft\Java Runtime Environment', 'CurrentVersion', JVer);
  InstallJ := true;
  if Length( JVer ) > 0 then
  begin
    if CompareVersion(JVer, '1.8') >= 0 then
    begin
      InstallJ := false;
    end;
  end;
  Result := InstallJ;
end;