unit prefs1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFPrefs = class(TForm)
    BtnOK: TButton;
    BtnCancel: TButton;
    CBStartWin: TCheckBox;
    CBSavSizePos: TCheckBox;
    CBNoChkNewVer: TCheckBox;
    CBLangue: TComboBox;
    LLangue: TLabel;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FPrefs: TFPrefs;

implementation

{$R *.dfm}

end.
