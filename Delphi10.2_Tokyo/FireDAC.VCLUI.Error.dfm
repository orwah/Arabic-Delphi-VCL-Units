inherited frmFDGUIxFormsError: TfrmFDGUIxFormsError
  Left = 374
  Top = 372
  Caption = 'FireDAC Error'
  ClientHeight = 424
  ClientWidth = 445
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 451
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    Width = 445
    ExplicitWidth = 445
    inherited Bevel2: TBevel
      Width = 434
      ExplicitWidth = 434
    end
    inherited Image2: TImage
      Left = 405
      ExplicitLeft = 405
    end
    inherited lblPrompt: TLabel
      Left = 175
      Width = 226
      Caption = #1602#1575#1605' '#1575#1604#1576#1585#1606#1575#1605#1580' '#1576#1593#1605#1604#1610#1577' '#1594#1610#1585' '#1589#1575#1604#1581#1577' '#1601#1610' '#1602#1575#1593#1583#1577' '#1575#1604#1576#1610#1575#1606#1575#1578' :'
      ExplicitLeft = 175
      ExplicitWidth = 226
    end
  end
  inherited pnlButtons: TPanel
    Top = 123
    Width = 445
    Height = 35
    TabOrder = 2
    ExplicitTop = 123
    ExplicitWidth = 445
    ExplicitHeight = 35
    inherited Bevel3: TBevel
      Top = 0
      Width = 434
      Height = 31
      ExplicitTop = 0
      ExplicitWidth = 434
      ExplicitHeight = 31
    end
    inherited btnOk: TButton
      Left = 364
      Top = 6
      TabOrder = 1
      ExplicitLeft = 364
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 86
      Top = 6
      Cancel = False
      Caption = #1578#1601#1575#1589#1610#1604
      ModalResult = 0
      TabOrder = 2
      OnClick = DetailsBtnClick
      ExplicitLeft = 86
      ExplicitTop = 6
    end
    object btnCopy: TButton
      Left = 5
      Top = 6
      Width = 75
      Height = 23
      Caption = '&'#1606#1587#1582
      TabOrder = 0
      OnClick = btnCopyClick
    end
  end
  object pnlAdvanced: TPanel
    Left = 0
    Top = 158
    Width = 445
    Height = 266
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      445
      266)
    object pcAdvanced: TPageControl
      Left = 5
      Top = 0
      Width = 436
      Height = 261
      ActivePage = tsAdvanced
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tsAdvanced: TTabSheet
        Caption = '   '#1575#1604#1582#1591#1571'   '
        DesignSize = (
          428
          233)
        object Bevel1: TBevel
          Left = 5
          Top = 200
          Width = 418
          Height = 32
          Anchors = [akLeft, akRight, akBottom]
          Shape = bsTopLine
        end
        object NativeLabel: TLabel
          Left = 362
          Top = 30
          Width = 51
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1585#1602#1605' '#1575#1604#1582#1591#1571' :'
        end
        object Label1: TLabel
          Left = 355
          Top = 147
          Width = 68
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = #1594#1585#1590' '#1575#1604#1605#1582#1583#1605' :'
        end
        object Label2: TLabel
          Left = 217
          Top = 30
          Width = 49
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1606#1608#1593' '#1575#1604#1582#1591#1571' :'
        end
        object Label3: TLabel
          Left = 334
          Top = 173
          Width = 89
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = #1573#1586#1575#1581#1577' '#1606#1589' '#1575#1604#1578#1593#1604#1610#1605#1577' :'
        end
        object Label4: TLabel
          Left = 362
          Top = 52
          Width = 61
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1585#1587#1575#1604#1577' '#1575#1604#1582#1591#1571' :'
        end
        object Label8: TLabel
          Left = 320
          Top = 5
          Width = 103
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1605#1593#1604#1608#1605#1575#1578' '#1575#1604#1582#1591#1600#1571' '#1575#1604#1606#1575#1578#1580' :'
        end
        object edtErrorCode: TEdit
          Left = 285
          Top = 27
          Width = 72
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 0
          Text = '00000'
        end
        object edtServerObject: TEdit
          Left = 5
          Top = 144
          Width = 316
          Height = 21
          TabStop = False
          Anchors = [akLeft, akRight, akBottom]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 2
          Text = 'QWE'
        end
        object edtMessage: TMemo
          Left = 7
          Top = 71
          Width = 418
          Height = 66
          TabStop = False
          Anchors = [akLeft, akTop, akRight, akBottom]
          BiDiMode = bdLeftToRight
          Lines.Strings = (
            'DbMessageText')
          ParentBiDiMode = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object edtErrorKind: TEdit
          Left = 93
          Top = 27
          Width = 117
          Height = 21
          TabStop = False
          Anchors = [akTop, akRight]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 6
          Text = 'RecordLocked'
        end
        object edtCommandTextOffset: TEdit
          Left = 263
          Top = 170
          Width = 58
          Height = 21
          TabStop = False
          Anchors = [akRight, akBottom]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 3
          Text = '00000'
        end
        object btnPrior: TButton
          Left = 81
          Top = 207
          Width = 75
          Height = 23
          Hint = #1575#1604#1587#1575#1576#1602
          Anchors = [akRight, akBottom]
          Caption = '&<<'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = BackClick
        end
        object btnNext: TButton
          Left = 0
          Top = 207
          Width = 75
          Height = 23
          Hint = #1575#1604#1578#1575#1604#1610
          Anchors = [akLeft, akBottom]
          Caption = '>&>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = NextClick
        end
      end
      object tsQuery: TTabSheet
        Caption = '  '#1575#1604#1575#1587#1578#1593#1604#1575#1605'   '
        ImageIndex = 1
        DesignSize = (
          428
          233)
        object Label9: TLabel
          Left = 360
          Top = 26
          Width = 63
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1606#1589' '#1575#1604#1578#1593#1604#1610#1605#1577' :'
        end
        object Label5: TLabel
          Left = 336
          Top = 131
          Width = 87
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = #1576#1575#1585#1575#1605#1578#1585#1575#1578' '#1575#1604#1578#1593#1604#1610#1605#1577' :'
        end
        object Label10: TLabel
          Left = 283
          Top = 5
          Width = 140
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1605#1593#1604#1608#1605#1575#1578' '#1575#1604#1593#1605#1604#1610#1577' '#1575#1604#1578#1610' '#1601#1588#1604#1578' :'
        end
        object lvCommandParams: TListView
          Left = 5
          Top = 150
          Width = 418
          Height = 78
          Anchors = [akLeft, akRight, akBottom]
          BiDiMode = bdLeftToRight
          Columns = <
            item
              Caption = #1575#1604#1575#1587#1605
              Width = 150
            end
            item
              Caption = #1575#1604#1602#1610#1605#1577
              Width = 250
            end>
          ParentBiDiMode = False
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object tsOther: TTabSheet
        Caption = '   '#1575#1604#1605#1586#1610#1583'   '
        ImageIndex = 2
        DesignSize = (
          428
          233)
        object Label6: TLabel
          Left = 5
          Top = 29
          Width = 106
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = 'Exception class name:'
          ParentBiDiMode = False
        end
        object Label7: TLabel
          Left = 5
          Top = 56
          Width = 96
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = 'FireDAC error code:'
          ParentBiDiMode = False
        end
        object Label11: TLabel
          Left = 5
          Top = 5
          Width = 141
          Height = 13
          Caption = 'Exception Object Information'
        end
        object Label12: TLabel
          Left = 5
          Top = 83
          Width = 105
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = 'FireDAC object name:'
          ParentBiDiMode = False
        end
        object edtClassName: TEdit
          Left = 191
          Top = 26
          Width = 160
          Height = 21
          TabStop = False
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 0
          Text = 'EODBCNativeException'
        end
        object edtADCode: TEdit
          Left = 191
          Top = 53
          Width = 160
          Height = 21
          TabStop = False
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 1
          Text = '12345'
        end
        object edtADObjName: TEdit
          Left = 191
          Top = 80
          Width = 234
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 2
          Text = 'FDQuery1'
        end
      end
    end
  end
  object pnlMsg: TPanel
    Left = 0
    Top = 39
    Width = 445
    Height = 84
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object memMsg: TMemo
      Left = 5
      Top = 2
      Width = 434
      Height = 72
      BiDiMode = bdLeftToRight
      Lines.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6')
      ParentBiDiMode = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
