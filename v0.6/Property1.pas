unit Property1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, BBUtils, ShellAPI, Buttons;

type
  TFProperty = class(TForm)
    PC1: TPageControl;
    TSGeneral: TTabSheet;
    Image1: TImage;
    EDisplayName: TEdit;
    LFileType: TLabel;
    LTypeName: TLabel;
    LDescription: TLabel;
    Memo1: TMemo;
    PButtons: TPanel;
    BtnOK: TButton;
    BtnCancel: TButton;
    Timer1: TTimer;
    ECible: TEdit;
    LCible: TLabel;
    SBCible: TSpeedButton;
    OD1: TOpenDialog;
    LParams: TLabel;
    EParams: TEdit;
    LPath: TLabel;
    EPath: TEdit;

    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SBCibleClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    IconDefFile: String;
    IconFile: String;
    IconIndex: Integer;
    dlgTitle: String;
  end;

var
  FProperty: TFProperty;

implementation

uses programmgr1;

{$R *.dfm}

procedure TFProperty.Image1Click(Sender: TObject);
begin
  Timer1.Enabled:= True;
  //IconFile:= IconDefFile;
  PickIcon(0, IconFile, IconIndex);
  Image1.Picture.Icon.Handle:= ExtractIcon(Handle, PChar(IconFile), IconIndex);
  Timer1.Enabled:= False;
end;

procedure TFProperty.Timer1Timer(Sender: TObject);
var
  dlgWnd  : HWND;
  dlgX,
  dlgY    : Integer;
  dlgRect : TRect;
begin

 dlgWnd := FindWindow('#32770', nil); //PChar(dlgTitle));     {Find the dialog window}
 if dlgWnd <> 0 then
   begin
     GetWindowRect(dlgWnd, dlgRect);
     dlgX:= Left+(Width div 2)-(dlgRect.Right-DlgRect.Left) div 2;
     dlgY := Top+(ClientHeight div 2)- (dlgRect.Bottom - dlgRect.Top) div 2;
     SetWindowPos(dlgWnd, 0, dlgX, dlgY, 0, 0, SWP_NOSIZE);
     Timer1.Enabled := False;
  end;

end;

procedure TFProperty.SBCibleClick(Sender: TObject);
var
  FileInfo: SHFILEINFO;
  LinkInfo: TShellLinkInfoStruct;
  s, s1: string;
begin
Invalidate;
OD1.FileName:= ECible.Text;
Timer1.Enabled:= True;
if OD1.Execute then
begin
  ECible.Text:= OD1.FileName;
  SHGetFileInfo(PChar(OD1.FileName), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);
  EDisplayName.Text:= FileInfo.szDisplayName;
  Memo1.Text:= FileInfo.szDisplayName;
  SHGetFileInfo(PChar(OD1.FileName), 0, FileInfo, SizeOf(FileInfo), SHGFI_TYPENAME);
  LTypeName.Caption:= FileInfo.szTypeName;
  ZeroMemory(@LinkInfo, SizeOf(LinkInfo));
  s:= OD1.FileName ;
  StrPCopy (LinkInfo.FullPathAndNameOfLinkFile, s);
  GetLinkInfo(@LinkInfo);
  If StrLen (LinkInfo.Description) > 0 then Memo1.Text:=  LinkInfo.Description ;
  if StrLen(LinkInfo.FullPathAndNameOfFileContiningIcon) > 0
  then s1:= LinkInfo.FullPathAndNameOfFileContiningIcon else s1:= LinkInfo.FullPathAndNameOfFileToExecute;
  if length(s1) > 0 then
  begin
    IconIndex:= LinkInfo.IconIndex;
    if FileExists(s1) then s:=  s1 else
      begin
        s:= StringReplace(s1, 'Program Files (x86)', 'Program Files', [rfIgnoreCase]);
        s:= StringReplace(s, '%SystemRoot%', FPrgMgr.SystemRoot,[rfIgnoreCase]);
        s:= StringReplace(s, '%UserProfile%', FPrgMgr.UserProfile,[rfIgnoreCase]);
      end;

  end;
  IconFile:= s;
  Image1.Picture.Icon.Handle:= ExtractIcon(Handle, PChar(s), 0);
end;
Timer1.Enabled:= False;
end;

end.
