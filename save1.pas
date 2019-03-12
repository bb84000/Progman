unit save1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, BBUtils, ShellAPI;

type
  TFSaveCfg = class(TForm)
    Label1: TLabel;
    RBtnSave: TRadioButton;
    RBtnSaveAs: TRadioButton;
    EGrpName: TEdit;
    BtnOK: TButton;
    BtnCancel: TButton;
    CBXShortCut: TCheckBox;
    Image1: TImage;
    Label2: TLabel;
    Timer1: TTimer;
    procedure RadioButtonClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    IconDefFile: String;
    IconFile: String;
    IconIndex: Integer;

  end;

var
  FSaveCfg: TFSaveCfg;

implementation

{$R *.dfm}

uses programmgr1;


procedure TFSaveCfg.RadioButtonClick(Sender: TObject);
begin
  EGrpName.Enabled:= RbtnSaveAs.Checked; 
end;

procedure TFSaveCfg.Image1DblClick(Sender: TObject);
begin
  Timer1.Enabled:= True;
  IconFile:= IconDefFile;
  if PickIcon(0, IconFile, IconIndex) then
  Image1.Picture.Icon.Handle:= ExtractIcon(Handle, PChar(IconFile), IconIndex);
  Timer1.Enabled:= False;
end;

procedure TFSaveCfg.FormCreate(Sender: TObject);
begin
  Inherited;
  // Image1.Picture.Icon:= Application.Icon;
   //IconDefFile:=
   IconFile:= '';
   IconIndex:= -1;
  
end;

procedure TFSaveCfg.Timer1Timer(Sender: TObject);
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

end.
