object FPrefs: TFPrefs
  Left = 852
  Top = 278
  BorderStyle = bsDialog
  Caption = 'Pr'#233'f'#233'rences'
  ClientHeight = 163
  ClientWidth = 503
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
  object LLangue: TLabel
    Left = 269
    Top = 21
    Width = 36
    Height = 13
    Caption = 'Langue'
  end
  object BtnOK: TButton
    Left = 136
    Top = 120
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object BtnCancel: TButton
    Left = 304
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 1
  end
  object CBStartWin: TCheckBox
    Left = 24
    Top = 16
    Width = 217
    Height = 17
    Caption = 'Ex'#233'cuter au d'#233'marrage de Windows'
    TabOrder = 2
  end
  object CBSavSizePos: TCheckBox
    Left = 24
    Top = 48
    Width = 249
    Height = 17
    Caption = 'Sauvegarder la taille et la position de la fen'#234'tre'
    TabOrder = 3
  end
  object CBNoChkNewVer: TCheckBox
    Left = 24
    Top = 80
    Width = 313
    Height = 17
    Caption = 'Ne pas rechercher automatiquement les nouvelles versions'
    TabOrder = 4
  end
  object CBLangue: TComboBox
    Left = 344
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'CBLangue'
  end
end
