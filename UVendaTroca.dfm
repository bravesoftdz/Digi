object FVendaTroca: TFVendaTroca
  Left = 0
  Top = 0
  Caption = 'Vendas & Trocas'
  ClientHeight = 324
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 180
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label2: TLabel
      Left = 65
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label11: TLabel
      Left = 6
      Top = 11
      Width = 10
      Height = 13
      Caption = 'Id'
    end
    object txtClienteId: TDBEdit
      Left = 219
      Top = 7
      Width = 55
      Height = 21
      DataField = 'CLIENTES_ID'
      DataSource = Dm.DSVenda
      TabOrder = 1
    end
    object txtDataVenda: TDBEdit
      Left = 91
      Top = 7
      Width = 81
      Height = 21
      DataField = 'DATAVENDA'
      DataSource = Dm.DSVenda
      TabOrder = 0
    end
    object DBNav: TDBNavigator
      Left = 467
      Top = 0
      Width = 183
      Height = 33
      DataSource = Dm.DSVenda
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alRight
      Flat = True
      Ctl3D = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo'
        ''
        ''
        ''
        ''
        ''
        'Fechar')
      Kind = dbnHorizontal
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = DBNavClick
    end
    object txtCliente: TDBLookupComboBox
      Left = 277
      Top = 7
      Width = 182
      Height = 21
      DataField = 'LKPCliente'
      DataSource = Dm.DSVenda
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 7
      Width = 41
      Height = 21
      DataField = 'ID'
      DataSource = Dm.DSVenda
      Enabled = False
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 412
    Top = 55
    Width = 238
    Height = 247
    Align = alRight
    BevelOuter = bvNone
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 418
    ExplicitTop = 49
    object Label5: TLabel
      Left = 6
      Top = 4
      Width = 129
      Height = 16
      Caption = 'Adicionar Produto:'
      FocusControl = txtId
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 6
      Top = 107
      Width = 38
      Height = 16
      Caption = 'Qtde:'
      FocusControl = txtQuant
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 92
      Top = 107
      Width = 46
      Height = 16
      Caption = 'Pre'#231'o:'
      FocusControl = txtPreco
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 46
      Top = 109
      Width = 40
      Height = 13
      Caption = '(insert)'
      FocusControl = txtQuant
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 138
      Top = 109
      Width = 39
      Height = 13
      Caption = '(home)'
      FocusControl = txtQuant
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 190
      Top = 64
      Width = 18
      Height = 16
      Caption = 'Id:'
      FocusControl = txtId
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 6
      Top = 64
      Width = 151
      Height = 16
      Caption = 'Produto Selecionado:'
      FocusControl = txtId
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtId: TDBEdit
      Left = 190
      Top = 81
      Width = 43
      Height = 21
      DataField = 'PRODUTOS_ID'
      DataSource = DSItem
      TabOrder = 0
    end
    object txtQuant: TDBEdit
      Left = 6
      Top = 122
      Width = 82
      Height = 21
      DataField = 'QUANTIDADE'
      DataSource = DSItem
      TabOrder = 1
    end
    object txtPreco: TDBEdit
      Left = 92
      Top = 123
      Width = 82
      Height = 21
      DataField = 'PRECO'
      DataSource = DSItem
      TabOrder = 2
    end
    object txtBarra: TEdit
      Left = 5
      Top = 19
      Width = 171
      Height = 21
      TabOrder = 3
      OnKeyDown = txtBarraKeyDown
      OnKeyPress = txtBarraKeyPress
    end
    object txtProduto: TDBLookupComboBox
      Left = 6
      Top = 81
      Width = 178
      Height = 21
      DataField = 'LKPProduto'
      DataSource = DSItem
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 0
      Top = 149
      Width = 238
      Height = 98
      Align = alBottom
      TabOrder = 5
      ExplicitTop = 148
      object Label9: TLabel
        Left = 6
        Top = 47
        Width = 37
        Height = 16
        Caption = 'Total'
        FocusControl = txtQuant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 6
        Width = 58
        Height = 16
        Caption = 'Vendas:'
        FocusControl = txtQuant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 92
        Top = 7
        Width = 54
        Height = 16
        Caption = 'Trocas:'
        FocusControl = txtQuant
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtTotalVenda: TDBEdit
        Left = 7
        Top = 23
        Width = 81
        Height = 21
        Color = clMoneyGreen
        DataField = 'TOTALVENDIDO'
        DataSource = Dm.DSVenda
        Enabled = False
        TabOrder = 0
      end
      object txtTotalTroca: TDBEdit
        Left = 93
        Top = 24
        Width = 81
        Height = 21
        Color = clMoneyGreen
        DataField = 'TOTALTROCADO'
        DataSource = Dm.DSTroca
        Enabled = False
        TabOrder = 1
      end
      object txtTotal: TEdit
        Left = 6
        Top = 66
        Width = 171
        Height = 21
        Color = clMoneyGreen
        Enabled = False
        TabOrder = 2
      end
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 33
    Width = 650
    Height = 22
    AutoSize = True
    ButtonWidth = 94
    Caption = 'ToolBar1'
    DrawingStyle = dsGradient
    GradientEndColor = clMoneyGreen
    Images = Dm.ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 1
    object btnVenda: TToolButton
      Left = 0
      Top = 0
      Caption = 'Venda F12'
      Down = True
      ImageIndex = 11
      OnClick = btnVendaClick
    end
    object btnTroca: TToolButton
      Left = 94
      Top = 0
      Caption = 'Troca F5'
      ImageIndex = 9
      OnClick = btnTrocaClick
    end
    object ToolButton1: TToolButton
      Left = 188
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnProduto: TToolButton
      Left = 196
      Top = 0
      AutoSize = True
      Caption = 'Produtos F9'
      ImageIndex = 12
      OnClick = btnProdutoClick
    end
    object btnCliente: TToolButton
      Left = 285
      Top = 0
      Caption = 'Clientes F10'
      ImageIndex = 13
      OnClick = btnClienteClick
    end
    object ToolButton4: TToolButton
      Left = 379
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object btnConsulta: TToolButton
      Left = 387
      Top = 0
      Caption = 'Consultar F11'
      ImageIndex = 10
      OnClick = btnConsultaClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 55
    Width = 412
    Height = 247
    Align = alClient
    Color = clWhite
    DataSource = DSItem
    FixedColor = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Caption = 'Item'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LKPProduto'
        Title.Caption = 'Produto'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quant'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Pre'#231'o'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Title.Alignment = taRightJustify
        Width = 50
        Visible = True
      end>
  end
  object DBNavAcao: TDBNavigator
    Left = 0
    Top = 302
    Width = 650
    Height = 22
    DataSource = Dm.DSVenda
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Align = alBottom
    Flat = True
    Hints.Strings = (
      'Primeiro'
      'Anterior'
      'Pr'#243'ximo'
      #218'ltimo'
      'Novo Registro'
      'Deletar'
      'Importar'
      'Salvar'
      'Cancelar'
      'Atualizar'
      'Apply updates'
      'Cancel updates')
    Kind = dbnHorizontal
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object DSItem: TDataSource
    DataSet = Dm.CDSItemVenda
    Left = 40
    Top = 120
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 80
    Top = 120
  end
end