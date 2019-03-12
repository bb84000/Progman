unit LoadConf1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFLoadConf = class(TForm)
    LB2: TListBox;
    Panel1: TPanel;
    BtnApply: TButton;
    BtnCancel: TButton;
    procedure LB2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    FileList : array [0..5 ] of array [0..1] of String;

  end;

var
  FLoadConf: TFLoadConf;

implementation
uses programmgr1;
{$R *.dfm}

procedure TFLoadConf.LB2Click(Sender: TObject);
begin
  //FPrgMgr.LoadCfgFile(FPrgMgr.PrgMgrAppsData+LB2.Items.Strings[LB2.ItemIndex]);
  FPrgMgr.LoadCfgFile(FPrgMgr.PrgMgrAppsData+FileList[LB2.ItemIndex,0]);
  FPrgMgr.LVDisplayFiles;
 //ShowMessage(LB2.Items.Strings[LB2.ItemIndex]);
end;

end.
