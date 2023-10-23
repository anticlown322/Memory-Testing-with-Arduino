object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #1043#1083#1072#1074#1085#1072#1103
  ClientHeight = 782
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object grpBackground: TGridPanel
    Left = 0
    Top = 0
    Width = 902
    Height = 782
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 150.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 150.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 50.000000000000000000
      end
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 48.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 10.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = lbIsOpen
        Row = 2
      end
      item
        Column = 0
        Control = lbPortName
        Row = 1
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = lbGeneralPortInfo
        Row = 0
      end
      item
        Column = 0
        Control = lbIsAvaliable
        Row = 3
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = lbPortConfigs
        Row = 4
      end
      item
        Column = 0
        Control = lbBaudrate
        Row = 5
      end
      item
        Column = 0
        Control = lbStopBits
        Row = 8
      end
      item
        Column = 0
        Control = lbParityBit
        Row = 6
      end
      item
        Column = 0
        Control = lbByteSize
        Row = 7
      end
      item
        Column = 1
        Control = lbPortNameValue
        Row = 1
      end
      item
        Column = 1
        Control = lbIsOpenValue
        Row = 2
      end
      item
        Column = 1
        Control = lbIsAvaliableValue
        Row = 3
      end
      item
        Column = 1
        Control = lbBaudrateValue
        Row = 5
      end
      item
        Column = 1
        Control = lbParityBitValue
        Row = 6
      end
      item
        Column = 1
        Control = lbByteSizeValue
        Row = 7
      end
      item
        Column = 1
        Control = lbStopBitsValue
        Row = 8
      end
      item
        Column = 4
        Control = sdbtExit
        Row = 0
      end
      item
        Column = 2
        Control = pButtons
        Row = 0
        RowSpan = 9
      end
      item
        Column = 3
        Control = pMessages
        Row = 5
        RowSpan = 4
      end
      item
        Column = 3
        Control = btMessages
        Row = 4
      end>
    ExpandStyle = emFixedSize
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    RowCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 60.000000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end
      item
        Value = 12.500000000000000000
      end>
    TabOrder = 0
    OnMouseDown = grpBackgroundMouseDown
    DesignSize = (
      902
      782)
    object lbIsOpen: TLabel
      Left = 28
      Top = 184
      Width = 94
      Height = 21
      Anchors = []
      Caption = #1055#1086#1088#1090' '#1086#1090#1082#1088#1099#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 23
      ExplicitTop = 175
    end
    object lbPortName: TLabel
      Left = 35
      Top = 94
      Width = 80
      Height = 21
      Anchors = []
      Caption = #1048#1084#1103' '#1087#1086#1088#1090#1072':'
      ExplicitLeft = 36
      ExplicitTop = 101
    end
    object lbGeneralPortInfo: TLabel
      Left = 0
      Top = 30
      Width = 300
      Height = 30
      Align = alBottom
      Alignment = taCenter
      Caption = #1054#1073#1097#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 211
    end
    object lbIsAvaliable: TLabel
      Left = 19
      Top = 275
      Width = 112
      Height = 21
      Anchors = []
      Caption = #1044#1086#1089#1090#1091#1087' '#1082' '#1087#1086#1088#1090#1091':'
      ExplicitLeft = 20
      ExplicitTop = 250
    end
    object lbPortConfigs: TLabel
      Left = 61
      Top = 361
      Width = 177
      Height = 30
      Anchors = []
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1088#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 88
      ExplicitTop = 324
    end
    object lbBaudrate: TLabel
      Left = 0
      Top = 421
      Width = 129
      Height = 61
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1074' '#1073#1086#1076#1072#1093':'
      WordWrap = True
    end
    object lbStopBits: TLabel
      Left = 35
      Top = 726
      Width = 80
      Height = 21
      Anchors = []
      Caption = #1057#1090#1086#1087'-'#1073#1080#1090#1099':'
      ExplicitLeft = 36
      ExplicitTop = 622
    end
    object lbParityBit: TLabel
      Left = 26
      Top = 545
      Width = 97
      Height = 21
      Anchors = []
      Caption = #1041#1080#1090' '#1095#1077#1090#1085#1086#1089#1090#1080':'
      ExplicitLeft = 8
      ExplicitTop = 457
    end
    object lbByteSize: TLabel
      Left = 25
      Top = 636
      Width = 100
      Height = 21
      Anchors = []
      Caption = #1056#1072#1079#1084#1077#1088' '#1073#1072#1081#1090#1072':'
      ExplicitLeft = 26
      ExplicitTop = 547
    end
    object lbPortNameValue: TLabel
      Left = 223
      Top = 94
      Width = 4
      Height = 21
      Anchors = []
      ExplicitLeft = 202
      ExplicitTop = 101
    end
    object lbIsOpenValue: TLabel
      Left = 223
      Top = 184
      Width = 4
      Height = 21
      Anchors = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 175
      ExplicitTop = 175
    end
    object lbIsAvaliableValue: TLabel
      Left = 223
      Top = 275
      Width = 4
      Height = 21
      Anchors = []
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 202
      ExplicitTop = 250
    end
    object lbBaudrateValue: TLabel
      Left = 223
      Top = 455
      Width = 4
      Height = 21
      Anchors = []
      ExplicitLeft = 202
      ExplicitTop = 398
    end
    object lbParityBitValue: TLabel
      Left = 223
      Top = 545
      Width = 4
      Height = 21
      Anchors = []
      ExplicitLeft = 202
      ExplicitTop = 473
    end
    object lbByteSizeValue: TLabel
      Left = 223
      Top = 636
      Width = 4
      Height = 21
      Anchors = []
      ExplicitLeft = 202
      ExplicitTop = 547
    end
    object lbStopBitsValue: TLabel
      Left = 223
      Top = 726
      Width = 4
      Height = 21
      Anchors = []
      ExplicitLeft = 202
      ExplicitTop = 622
    end
    object sdbtExit: TSpeedButton
      Left = 844
      Top = 12
      Width = 48
      Height = 48
      Action = actCloseForm
      Align = alBottom
      ImageIndex = 6
      ImageName = 'circle-close'
      Images = vilImages48
      Flat = True
      ExplicitLeft = 850
    end
    object pButtons: TPanel
      Left = 300
      Top = 0
      Width = 50
      Height = 782
      Align = alClient
      BevelOuter = bvNone
      Color = clBtnShadow
      ParentBackground = False
      TabOrder = 0
      OnMouseDown = pButtonsMouseDown
      object sdbtChangePort: TSpeedButton
        Tag = 1
        Left = 1
        Top = 8
        Width = 48
        Height = 48
        Action = actInput
        ImageIndex = 2
        ImageName = 'port'
        Images = vilImages48
        Flat = True
      end
      object sdbtChangeBaudrate: TSpeedButton
        Tag = 2
        Left = 0
        Top = 358
        Width = 48
        Height = 48
        Action = actSettings
        ImageIndex = 5
        ImageName = 'settings'
        Images = vilImages48
        Flat = True
      end
    end
    object pMessages: TPanel
      Left = 350
      Top = 421
      Width = 494
      Height = 361
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      OnMouseDown = pMessagesMouseDown
      object lbMessages: TLabel
        Left = 0
        Top = 0
        Width = 494
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = #1055#1086#1083#1091#1095#1072#1077#1084#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 302
      end
      object mmMessages: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 35
        Width = 488
        Height = 323
        Align = alClient
        Lines.Strings = (
          '')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 38
      end
    end
    object btMessages: TButton
      Left = 559
      Top = 363
      Width = 75
      Height = 25
      Action = actGetMessages
      Anchors = []
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100
      TabOrder = 2
    end
  end
  object vilImages48: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'black'
        Name = 'black'
      end
      item
        CollectionIndex = 1
        CollectionName = 'console'
        Name = 'console'
      end
      item
        CollectionIndex = 2
        CollectionName = 'port'
        Name = 'port'
      end
      item
        CollectionIndex = 3
        CollectionName = 'text-input'
        Name = 'text-input'
      end
      item
        CollectionIndex = 4
        CollectionName = 'close'
        Name = 'close'
      end
      item
        CollectionIndex = 5
        CollectionName = 'settings'
        Name = 'settings'
      end
      item
        CollectionIndex = 6
        CollectionName = 'circle-close'
        Name = 'circle-close'
      end>
    ImageCollection = dtmdData.imgcIcons
    Width = 48
    Height = 48
    Left = 800
    Top = 8
  end
  object actmngActions: TActionManager
    Left = 760
    Top = 8
    StyleName = 'Platform Default'
    object actCloseForm: TAction
      Category = 'Form'
      ShortCut = 32883
      OnExecute = actCloseFormExecute
    end
    object actInput: TAction
      Category = 'Interactions'
      OnExecute = actInputExecute
    end
    object actGetMessages: TAction
      Category = 'Interactions'
      OnExecute = actGetMessagesExecute
    end
    object actSettings: TAction
      Category = 'Interactions'
    end
  end
end
