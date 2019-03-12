object FProperty: TFProperty
  Left = 609
  Top = 81
  BorderStyle = bsDialog
  Caption = 'Propri'#233't'#233's'
  ClientHeight = 347
  ClientWidth = 470
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
  object PC1: TPageControl
    Left = 0
    Top = 0
    Width = 470
    Height = 306
    ActivePage = TSGeneral
    Align = alClient
    TabOrder = 0
    object TSGeneral: TTabSheet
      Caption = 'General'
      object Image1: TImage
        Left = 16
        Top = 8
        Width = 32
        Height = 32
        ParentShowHint = False
        ShowHint = True
        OnDblClick = Image1Click
      end
      object LFileType: TLabel
        Left = 16
        Top = 48
        Width = 73
        Height = 13
        Caption = 'Type de fichier '
      end
      object LTypeName: TLabel
        Left = 104
        Top = 48
        Width = 58
        Height = 13
        Caption = 'LTypeName'
      end
      object LDescription: TLabel
        Left = 16
        Top = 176
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object LCible: TLabel
        Left = 16
        Top = 80
        Width = 23
        Height = 13
        Caption = 'Cible'
      end
      object SBCible: TSpeedButton
        Left = 416
        Top = 72
        Width = 23
        Height = 22
        Hint = 'Changer le fichier cible'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SBCibleClick
      end
      object LParams: TLabel
        Left = 16
        Top = 112
        Width = 53
        Height = 13
        Caption = 'Param'#232'tres'
      end
      object LPath: TLabel
        Left = 16
        Top = 144
        Width = 35
        Height = 13
        Caption = 'Chemin'
      end
      object EDisplayName: TEdit
        Left = 88
        Top = 16
        Width = 353
        Height = 21
        TabOrder = 0
      end
      object Memo1: TMemo
        Left = 88
        Top = 168
        Width = 353
        Height = 65
        Lines.Strings = (
          'Memo1')
        TabOrder = 1
      end
      object ECible: TEdit
        Left = 88
        Top = 72
        Width = 321
        Height = 21
        TabOrder = 2
      end
      object EParams: TEdit
        Left = 88
        Top = 104
        Width = 353
        Height = 21
        TabOrder = 3
      end
      object EPath: TEdit
        Left = 88
        Top = 136
        Width = 353
        Height = 21
        TabOrder = 4
      end
    end
  end
  object PButtons: TPanel
    Left = 0
    Top = 306
    Width = 470
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BtnOK: TButton
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object BtnCancel: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Annuler'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 44
    Top = 272
  end
  object OD1: TOpenDialog
    Options = [ofHideReadOnly, ofNoDereferenceLinks, ofEnableSizing]
    Left = 12
    Top = 272
  end
end
