object FSaveCfg: TFSaveCfg
  Left = 785
  Top = 367
  BorderStyle = bsDialog
  Caption = 'Enregistrement des modifications'
  ClientHeight = 176
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
    Left = 16
    Top = 9
    Width = 408
    Height = 13
    Caption = 
      'Le groupe de programmes a '#233't'#233' modifi'#233'.%sVoulez-vous enregistre r' +
      ' ces modifications ?'
  end
  object Label2: TLabel
    Left = 232
    Top = 104
    Width = 27
    Height = 13
    Caption = 'Icone'
    Visible = False
  end
  object Image1: TImage
    Left = 296
    Top = 96
    Width = 32
    Height = 32
    Hint = 'Double clic pour changer l'#39'icone'
    ParentShowHint = False
    ShowHint = True
    Visible = False
    OnDblClick = Image1DblClick
  end
  object RBtnSave: TRadioButton
    Left = 16
    Top = 48
    Width = 113
    Height = 17
    Caption = 'Enregistrer'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButtonClick
  end
  object RBtnSaveAs: TRadioButton
    Left = 16
    Top = 76
    Width = 113
    Height = 17
    Caption = 'Enregistrer sous'
    TabOrder = 1
    OnClick = RadioButtonClick
  end
  object CBXShortCut: TCheckBox
    Left = 16
    Top = 102
    Width = 185
    Height = 17
    Caption = 'Placer un racourci sur le bureau'
    TabOrder = 2
    Visible = False
  end
  object BtnOK: TButton
    Left = 63
    Top = 135
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object BtnCancel: TButton
    Left = 197
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 4
  end
  object EGrpName: TEdit
    Left = 156
    Top = 72
    Width = 173
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 19
    Top = 144
  end
end
