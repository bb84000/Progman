object Save2: TSave2
  Left = 539
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Enregistrement des modifications'
  ClientHeight = 194
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 10
    Width = 408
    Height = 13
    Caption = 
      'Le groupe de programmes a '#233't'#233' modifi'#233'.%sVoulez-vous enregistre r' +
      ' ces modifications ?'
  end
  object Label2: TLabel
    Left = 220
    Top = 110
    Width = 27
    Height = 13
    Caption = 'Icone'
  end
  object Image1: TImage
    Left = 265
    Top = 99
    Width = 32
    Height = 32
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 45
    Width = 113
    Height = 17
    Caption = 'Enregistrer'
    TabOrder = 0
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 76
    Width = 113
    Height = 17
    Caption = 'Enregistre sous'
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 19
    Top = 108
    Width = 185
    Height = 17
    Caption = 'Placer un racourci sur le bureau'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 79
    Top = 141
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 198
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Annuler'
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 187
    Top = 71
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
end
