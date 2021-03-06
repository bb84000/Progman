unit prefs1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, BBUtils, ShellAPI;

type
  TFPrefs = class(TForm)
    BtnOK: TButton;
    BtnCancel: TButton;
    GBPrefs1: TGroupBox;
    CBStartWin: TCheckBox;
    CBNoChkNewVer: TCheckBox;
    CBSavSizePos: TCheckBox;
    CBMiniInTray: TCheckBox;
    GBPrefs2: TGroupBox;
    LLangue: TLabel;
    CBLangue: TComboBox;
    LIcone: TLabel;
    Panel1: TPanel;
    ImgPrefs: TImage;
    Timer1: TTimer;
    CBXShortCut: TCheckBox;
    CBHideInTaskbar: TCheckBox;
    PnlWinVer: TPanel;
    LWinVer: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ImgPrefsDblClick(Sender: TObject);
    procedure CBMiniInTrayClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    IconDefFile: String;
    IconFile: String;
    IconIndex: Integer;
    ImgChanged: Bool;
  end;

var
  FPrefs: TFPrefs;

implementation

{$R *.dfm}

procedure TFPrefs.FormCreate(Sender: TObject);
begin
Inherited;
  // Image1.Picture.Icon:= Application.Icon;
   //IconDefFile:=
   IconFile:= '';
   IconIndex:= -1;
   ImgChanged:= False;
end;


procedure TFPrefs.Timer1Timer(Sender: TObject);
var
  dlgWnd  : HWND;
  dlgX,
  dlgY    : Integer;
  dlgRect : TRect;
begin
 //Beep;
 dlgWnd := FindWindow('#32770', nil);     {Find the dialog window}
 if dlgWnd <> 0 then
 begin
    GetWindowRect(dlgWnd, dlgRect);
    dlgX:= Left+(Width div 2)-(dlgRect.Right-DlgRect.Left) div 2;
    dlgY := Top+(ClientHeight div 2)- (dlgRect.Bottom - dlgRect.Top) div 2;
    SetWindowPos(dlgWnd, 0, dlgX, dlgY, 0, 0, SWP_NOSIZE);
    Timer1.Enabled := False;
  end;

end;

procedure TFPrefs.ImgPrefsDblClick(Sender: TObject);
begin
  Timer1.Enabled:= True;
  IconFile:= IconDefFile;
  if PickIcon(0, IconFile, IconIndex) then
  begin
     ImgPrefs.Picture.Icon.Handle:= ExtractIcon(Handle, PChar(IconFile), IconIndex);
     ImgChanged:= True;
  end;
  Timer1.Enabled:= False;

end;

procedure TFPrefs.CBMiniInTrayClick(Sender: TObject);
begin
  CBHideInTaskbar.Enabled:= CBMiniInTray.Checked;
end;

end.
