object FSaveCfgold: TFSaveCfgold
  Left = 1075
  Top = 129
  BorderStyle = bsDialog
  Caption = 'Enregistrement des modifications'
  ClientHeight = 167
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 402
    Height = 13
    Caption = 
      'Le groupe de programmes a '#233't'#233' mofifi'#233'.%sVoulez-vous enregistrer ' +
      'ces modifications ?'
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
    Top = 72
    Width = 113
    Height = 17
    Caption = 'Enregistrer sous :'
    TabOrder = 1
    OnClick = RadioButtonClick
  end
  object EGrpName: TEdit
    Left = 156
    Top = 72
    Width = 173
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object BtnOK: TButton
    Left = 83
    Top = 111
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object BtnCancel: TButton
    Left = 197
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 4
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 19
    Top = 109
  end
end
