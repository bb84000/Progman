object FLoadConf: TFLoadConf
  Left = 823
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Charge une liste ant'#233'rieure'
  ClientHeight = 102
  ClientWidth = 204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LB2: TListBox
    Left = 0
    Top = 0
    Width = 100
    Height = 102
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    OnClick = LB2Click
  end
  object Panel1: TPanel
    Left = 100
    Top = 0
    Width = 104
    Height = 102
    Align = alRight
    TabOrder = 1
    object BtnApply: TButton
      Left = 14
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Appliquer'
      ModalResult = 1
      TabOrder = 0
    end
    object BtnCancel: TButton
      Left = 14
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Annuler'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
