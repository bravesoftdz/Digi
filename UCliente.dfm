inherited FCliente: TFCliente
  Caption = 'Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid: TDBGrid
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    object Label1: TLabel [1]
      Left = 57
      Top = 28
      Width = 42
      Height = 16
      Caption = 'Nome'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel [2]
      Left = 317
      Top = 28
      Width = 51
      Height = 16
      Caption = 'Cidade'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [3]
      Left = 519
      Top = 28
      Width = 63
      Height = 16
      Caption = 'Telefone'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 56
      Top = 44
      Width = 257
      Height = 21
      DataField = 'NOME'
      DataSource = DataSource
      TabOrder = 2
      OnKeyDown = txtPesquisaKeyDown
    end
    object DBEdit2: TDBEdit
      Left = 317
      Top = 44
      Width = 197
      Height = 21
      DataField = 'CIDADE'
      DataSource = DataSource
      TabOrder = 3
      OnKeyDown = txtPesquisaKeyDown
    end
    object DBEdit3: TDBEdit
      Left = 520
      Top = 44
      Width = 115
      Height = 21
      DataField = 'TELEFONE'
      DataSource = DataSource
      TabOrder = 4
      OnKeyDown = txtPesquisaKeyDown
    end
  end
  inherited DataSource: TDataSource
    DataSet = Dm.CDSCliente
  end
end
