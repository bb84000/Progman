unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TSave2 = class(TForm)
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Image1: TImage;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Save2: TSave2;

implementation

{$R *.dfm}

procedure TSave2.FormCreate(Sender: TObject);
begin
//
end;

end.
