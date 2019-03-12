object FPrefs: TFPrefs
  Left = 543
  Top = 204
  BorderStyle = bsDialog
  Caption = 'Pr'#233'f'#233'rences'
  ClientHeight = 190
  ClientWidth = 604
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
  object BtnOK: TButton
    Left = 179
    Top = 147
    Width = 75
    Height = 26
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object BtnCancel: TButton
    Left = 350
    Top = 146
    Width = 75
    Height = 26
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 1
  end
  object GBPrefs1: TGroupBox
    Left = 10
    Top = 10
    Width = 326
    Height = 122
    TabOrder = 2
    object CBStartWin: TCheckBox
      Left = 10
      Top = 15
      Width = 217
      Height = 17
      Caption = 'Ex'#233'cuter au d'#233'marrage de Windows'
      TabOrder = 0
    end
    object CBNoChkNewVer: TCheckBox
      Left = 10
      Top = 40
      Width = 313
      Height = 17
      Caption = 'Ne pas rechercher automatiquement les nouvelles versions'
      TabOrder = 1
    end
    object CBSavSizePos: TCheckBox
      Left = 10
      Top = 65
      Width = 249
      Height = 17
      Caption = 'Sauvegarder la taille et la position de la fen'#234'tre'
      TabOrder = 2
    end
    object CBHideInTaskBar: TCheckBox
      Left = 10
      Top = 90
      Width = 302
      Height = 17
      Hint = 'L'#39'application reste visible dans la zone de notification'
      Caption = 'Ne pas afficher cete application dans la barre des t'#226'ches'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object GBPrefs2: TGroupBox
    Left = 347
    Top = 11
    Width = 216
    Height = 121
    TabOrder = 3
    object LLangue: TLabel
      Left = 10
      Top = 61
      Width = 36
      Height = 13
      Caption = 'Langue'
    end
    object LIcone: TLabel
      Left = 10
      Top = 22
      Width = 78
      Height = 13
      Caption = 'Icone du groupe'
    end
    object CBLangue: TComboBox
      Left = 61
      Top = 57
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'CBLangue'
    end
    object Panel1: TPanel
      Left = 169
      Top = 15
      Width = 34
      Height = 34
      Caption = 'Icon'
      TabOrder = 1
      object ImgPrefs: TImage
        Left = 1
        Top = 1
        Width = 32
        Height = 32
        OnDblClick = ImgPrefsDblClick
      end
    end
    object CBXShortCut: TCheckBox
      Left = 10
      Top = 90
      Width = 185
      Height = 17
      Caption = 'Placer un raccourci sur le bureau'
      TabOrder = 2
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 17
    Top = 142
  end
end
