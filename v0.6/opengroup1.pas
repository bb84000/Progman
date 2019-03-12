unit opengroup1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList;

type
  TFLoadGroup = class(TForm)
    BtnNew: TButton;
    BtnOK: TButton;
    BtnCancel: TButton;
    LV1: TListView;
    IL1: TImageList;
    BtnDelete: TButton;
    procedure LV1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FLoadGroup: TFLoadGroup;

implementation

{$R *.dfm}

procedure TFLoadGroup.LV1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  BtnOK.Enabled:= True;
  BtnDelete.Enabled:= True;
end;

end.
