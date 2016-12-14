object CustomizeFrm: TCustomizeFrm
  Left = 8
  Top = 8
  BiDiMode = bdRightToLeft
  BorderIcons = [biSystemMenu]
  Caption = '   '#1578#1582#1589#1610#1589' .'
  ClientHeight = 334
  ClientWidth = 371
  Color = clBtnFace
  Constraints.MinHeight = 361
  Constraints.MinWidth = 379
  ParentFont = True
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ParentBiDiMode = False
  PopupMenu = CloseMenu
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    371
    334)
  PixelsPerInch = 96
  TextHeight = 13
  object CloseBtn: TButton
    Left = 288
    Top = 304
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1573#1594#1604#1575#1602
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = CloseBtnClick
  end
  object Tabs: TPageControl
    Left = 6
    Top = 7
    Width = 358
    Height = 291
    ActivePage = ActionsTab
    Anchors = [akLeft, akTop, akRight, akBottom]
    MultiLine = True
    TabOrder = 1
    object ToolbarsTab: TTabSheet
      Caption = #1571#1588#1585#1591#1577' '#1575#1604#1571#1583#1608#1575#1578
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        350
        263)
      object ToolbarsLbl: TLabel
        Left = 230
        Top = 1
        Width = 85
        Height = 13
        HelpType = htKeyword
        AutoSize = False
        Caption = #1571#1588#1585#1591#1577' '#1575#1604#1571#1583#1608#1575#1578' :'
        FocusControl = ActionBarList
      end
      object Label2: TLabel
        Left = -101
        Top = 0
        Width = 257
        Height = 13
        HelpType = htKeyword
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = #1576#1573#1605#1603#1575#1606#1603' '#1573#1586#1575#1604#1577' '#1575#1604#1575#1582#1578#1610#1575#1585' '#1604#1573#1604#1594#1575#1569' '#1575#1604#1573#1592#1607#1575#1585
      end
      object ActionBarList: TCheckListBox
        Left = 4
        Top = 19
        Width = 237
        Height = 150
        OnClickCheck = ActionBarListClickCheck
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 0
        OnClick = ActionBarListClick
      end
      object ResetBtn: TButton
        Left = 249
        Top = 19
        Width = 97
        Height = 21
        Action = ResetActn
        Anchors = [akTop, akRight]
        Caption = #1573#1593#1575#1583#1577' '#1575#1604#1573#1601#1578#1585#1575#1590#1610#1575#1578
        TabOrder = 2
      end
      object CaptionOptionsGrp: TGroupBox
        Left = 4
        Top = 174
        Width = 333
        Height = 82
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1582#1610#1575#1585#1575#1578' '#1593#1606#1575#1608#1610#1606' '#1575#1604#1571#1586#1585#1575#1585'  '
        TabOrder = 1
        DesignSize = (
          333
          82)
        object ApplyToAllChk: TCheckBox
          Left = 20
          Top = 58
          Width = 279
          Height = 16
          Action = ApplyToAllActn
          Anchors = [akLeft, akTop, akRight]
          Caption = #1578#1591#1576#1610#1602' '#1575#1604#1582#1610#1575#1585#1575#1578' '#1604#1580#1605#1610#1593' '#1571#1588#1585#1591#1577' '#1575#1604#1571#1583#1608#1575#1578
          TabOrder = 0
        end
        object CaptionOptionsCombo: TComboBox
          Left = 154
          Top = 28
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnChange = CaptionOptionsComboChange
          Items.Strings = (
            #1573#1582#1601#1575#1569' '#1575#1604#1593#1606#1575#1608#1610#1606
            #1575#1582#1578#1610#1575#1585#1610
            #1573#1592#1607#1575#1585' '#1575#1604#1603#1604)
        end
      end
    end
    object ActionsTab: TTabSheet
      Caption = #1575#1604#1571#1581#1583#1575#1579' '
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        350
        263)
      object InfoLbl: TLabel
        Left = 7
        Top = 226
        Width = 339
        Height = 38
        HelpType = htKeyword
        Anchors = [akLeft, akRight, akBottom]
        AutoSize = False
        Caption = 
          #1604#1573#1590#1575#1601#1577' '#1575#1604#1571#1581#1583#1575#1579' '#1573#1604#1609' '#1578#1591#1576#1610#1602#1603' '#1602#1605' '#1576#1576#1587#1575#1591#1577' '#1576#1587#1581#1576' '#1608#1575#1601#1604#1575#1578' '#1607#1584#1607' '#1575#1604#1571#1581#1583#1575#1579' '#1571#1608' '#1575 +
          #1604#1578#1589#1606#1610#1601#1575#1578' '#1573#1604#1609' '#1575#1604#1578#1591#1576#1610#1602' , '#1608#1585#1578#1576#1607#1575' '#1581#1587#1576' '#1575#1604#1585#1594#1576#1577' .'
        WordWrap = True
      end
      object ListPanel: TPanel
        Left = 0
        Top = 32
        Width = 350
        Height = 135
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          350
          135)
        object ActionsCatLbl: TLabel
          Left = 225
          Top = 1
          Width = 116
          Height = 13
          HelpType = htKeyword
          AutoSize = False
          Caption = #1575#1604#1578#1589#1606#1610#1601#1575#1578' :'
          FocusControl = CatList
        end
        object ActionsActionsLbl: TLabel
          Left = 4
          Top = 1
          Width = 209
          Height = 13
          HelpType = htKeyword
          AutoSize = False
          Caption = #1575#1604#1571#1581#1583#1575#1579' :'
          FocusControl = ActionsList
        end
        object CatList: TListBox
          Left = 223
          Top = 18
          Width = 119
          Height = 117
          Anchors = [akTop, akRight, akBottom]
          DragMode = dmAutomatic
          ItemHeight = 13
          TabOrder = 0
          OnClick = CatListClick
          OnMeasureItem = ActionsListMeasureItem
          OnStartDrag = CatListStartDrag
        end
        object ActionsList: TListBox
          Left = 1
          Top = 18
          Width = 215
          Height = 117
          Style = lbOwnerDrawVariable
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clBtnFace
          DragMode = dmAutomatic
          ItemHeight = 13
          MultiSelect = True
          TabOrder = 1
          OnClick = ActionsListClick
          OnData = ActionsListData
          OnDrawItem = ActionsListDrawItem
          OnMeasureItem = ActionsListMeasureItem
          OnStartDrag = ActionsListStartDrag
        end
      end
      object DescGroupBox: TGroupBox
        Left = 3
        Top = 171
        Width = 342
        Height = 48
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1575#1604#1608#1589#1601
        TabOrder = 2
        DesignSize = (
          342
          48)
        object HintLbl: TLabel
          Left = 8
          Top = 14
          Width = 326
          Height = 29
          HelpType = htKeyword
          Anchors = [akLeft, akRight, akBottom]
          AutoSize = False
          Caption = 'HintLbl'
          WordWrap = True
        end
      end
      object ComboPanel: TPanel
        Left = 0
        Top = 0
        Width = 350
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object ListCombo: TComboBox
          Left = 3
          Top = 4
          Width = 170
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnSelect = ListComboSelect
        end
      end
    end
    object OptionsTab: TTabSheet
      Caption = #1575#1604#1582#1610#1575#1585#1575#1578
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        350
        263)
      object PersonalizeLbl: TLabel
        Left = 183
        Top = 4
        Width = 145
        Height = 13
        HelpType = htKeyword
        Caption = #1578#1582#1589#1610#1589' '#1575#1604#1602#1608#1575#1574#1605' '#1608#1571#1588#1585#1591#1577' '#1575#1604#1571#1583#1608#1575#1578
      end
      object OptionsBevel2: TBevel
        Left = 16
        Top = 10
        Width = 158
        Height = 2
        HelpType = htKeyword
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object OptionsBevel1: TBevel
        Left = 16
        Top = 117
        Width = 312
        Height = 4
        HelpType = htKeyword
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 249
        Top = 215
        Width = 64
        Height = 13
        HelpType = htKeyword
        Caption = #1581#1585#1603#1577' '#1575#1604#1602#1608#1575#1574#1605' :'
        FocusControl = MenuAnimationStyles
      end
      object RecentlyUsedChk: TCheckBox
        Left = 86
        Top = 33
        Width = 242
        Height = 17
        Action = RecentlyUsedActn
        Caption = #1575#1604#1602#1608#1575#1574#1605' '#1578#1592#1607#1585' '#1575#1604#1593#1606#1575#1589#1585' '#1575#1604#1605#1587#1578#1582#1583#1605' '#1605#1572#1582#1585#1575#1611' '#1601#1610' '#1575#1604#1576#1583#1575#1610#1577
        TabOrder = 0
      end
      object ResetUsageBtn: TButton
        Left = 24
        Top = 67
        Width = 145
        Height = 21
        Action = ResetUsageDataActn
        TabOrder = 1
      end
      object LargeIconsChk: TCheckBox
        Left = 231
        Top = 142
        Width = 97
        Height = 17
        Action = LargeIconsActn
        Caption = #1571#1610#1602#1608#1606#1575#1578' '#1603#1576#1610#1585#1577
        TabOrder = 2
      end
      object ShowTipsChk: TCheckBox
        Left = 20
        Top = 164
        Width = 308
        Height = 17
        Action = ShowHintsActn
        Caption = #1570#1592#1607#1585' '#1575#1604#1578#1604#1605#1610#1581#1575#1578' '#1601#1610' '#1571#1588#1585#1591#1577' '#1575#1604#1571#1583#1608#1575#1578' '
        TabOrder = 3
      end
      object ShortCutTipsChk: TCheckBox
        Left = 45
        Top = 185
        Width = 284
        Height = 17
        Action = ShowShortCutsInTipsActn
        Caption = #1571#1592#1607#1585' '#1605#1601#1575#1578#1610#1581' '#1575#1604#1573#1582#1578#1589#1575#1585' '#1601#1610' '#1575#1604#1578#1604#1605#1610#1581#1575#1578
        TabOrder = 4
      end
      object MenuAnimationStyles: TComboBox
        Left = 126
        Top = 212
        Width = 112
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 5
        Text = #1575#1601#1578#1585#1575#1590#1610
        OnChange = MenuAnimationStylesChange
        Items.Strings = (
          #1604#1575#1588#1610#1569
          #1575#1601#1578#1585#1575#1590#1610
          #1594#1610#1585' '#1605#1591#1608#1610
          #1573#1606#1586#1604#1575#1602
          #1578#1604#1575#1588#1610)
      end
    end
  end
  object SeparatorBtn: TButton
    Left = 7
    Top = 304
    Width = 147
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1575#1587#1581#1576' '#1604#1573#1606#1588#1575#1569' '#1601#1575#1589#1604
    DragMode = dmAutomatic
    TabOrder = 2
    OnStartDrag = SeparatorBtnStartDrag
  end
  object CloseMenu: TPopupMenu
    Left = 286
    Top = 4
    object CloseItem: TMenuItem
      Caption = '&Close'
      ShortCut = 27
      Visible = False
      OnClick = CloseBtnClick
    end
  end
  object ActionImages: TImageList
    Left = 314
    Top = 4
  end
  object ActionList1: TActionList
    Left = 258
    Top = 4
    object ResetActn: TAction
      Category = 'Toolbars'
      Caption = '&Reset...'
      OnExecute = ResetActnExecute
      OnUpdate = ResetActnUpdate
    end
    object CloseActn: TAction
      Category = 'Dialog'
      Caption = #1573#1594#1604#1575#1602
    end
    object ResetUsageDataActn: TAction
      Category = 'Options'
      Caption = #1573#1593#1575#1583#1577' '#1590#1576#1591' '#1576#1610#1575#1606#1575#1578' '#1575#1604#1575#1587#1578#1582#1583#1575#1605
      OnExecute = ResetUsageDataActnExecute
    end
    object RecentlyUsedActn: TAction
      Category = 'Options'
      Caption = 'Me&nu show recently used items first'
      OnExecute = RecentlyUsedActnExecute
      OnUpdate = RecentlyUsedActnUpdate
    end
    object FullMenusActn: TAction
      Category = 'Options'
      AutoCheck = True
      Caption = 'Show f&ull menus after a short delay'
      Enabled = False
    end
    object ShowHintsActn: TAction
      Category = 'Options'
      AutoCheck = True
      Caption = 'Show &tips on toolbars'
      OnExecute = ShowHintsActnExecute
      OnUpdate = ShowHintsActnUpdate
    end
    object ShowShortCutsInTipsActn: TAction
      Category = 'Options'
      AutoCheck = True
      Caption = 'Show shortcut keys in tips'
      OnExecute = ShowShortCutsInTipsActnExecute
    end
    object ApplyToAllActn: TAction
      Category = 'Toolbars'
      AutoCheck = True
      Caption = 'Apply caption &options to all toolbars'
      OnUpdate = ApplyToAllActnUpdate
    end
    object LargeIconsActn: TAction
      Category = 'Options'
      AutoCheck = True
      Caption = '&Large icons'
      OnExecute = LargeIconsActnExecute
      OnUpdate = LargeIconsActnUpdate
    end
  end
end
