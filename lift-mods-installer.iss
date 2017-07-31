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
Source: "*.hta"; DestDir: "{app}"
Source: "*.cmd"; DestDir: "{app}"
Source: "*.ico"; DestDir: "{app}"
Source: "*.md"; DestDir: "{app}"
Source: "*.txt"; DestDir: "{app}" ; Flags: onlyifdoesntexist;
Source: "*.xslt"; DestDir: "{app}"
Source: "LICENSE"; DestDir: "{app}"
;Source: "jre-8u11-windows-x64.exe"; DestDir: "{tmp}"; DestName: "JREInstall.exe"; Check: IsWin64 AND InstallJava(); Flags: deleteafterinstall
;Source: "jre-8u11-windows-i586.exe"; DestDir: "{tmp}"; DestName: "JREInstall.exe"; Check: (NOT IsWin64) AND InstallJava(); Flags: deleteafterinstall
Source: "tools\UNZIP.EXE"; DestDir: "{tmp}"; Flags: deleteafterinstall ;  Check: FileDoesNotExist('{app}\saxon\saxon9he.jar');
Source: "tools\SaxonHE9-8-0-3J.zip"; DestDir: "{tmp}"; Flags: deleteafterinstall ;  Check: FileDoesNotExist('{app}\saxon\saxon9he.jar');

[Icons]
Name: "{group}\Lift-mods for DAB"; Filename: "{app}\transform.hta"; IconFilename: "{app}\transform.ico"
Name: "{group}\Uninstall Lift-mods for DAB"; Filename: "{uninstallexe}" ; IconFilename: "{app}\u.ico"

 [Run]
Filename: "{tmp}\UNZIP.EXE"; Parameters: "{tmp}\SaxonHE9-8-0-3J.zip -d {app}\saxon";  Check: FileDoesNotExist('{app}\saxon\saxon9he.jar');

[Code]
function FileDoesNotExist(file: string): Boolean;
begin
  if (FileExists(ExpandConstant(file))) then
    begin
      Result := False;
    end
  else
    begin
      Result := True;
    end;
end;

