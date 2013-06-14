unit UMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus, Vcl.Grids,
  Vcl.ExtCtrls, Vcl.ButtonGroup, Vcl.CategoryButtons, VCLTee.TeEngine, VCLTee.TeeEdiGene,
  VCLTee.Series, VCLTee.DBChart, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.EditChar;

type
  TFMenu = class(TForm)
    ToolBarMenu: TToolBar;
    btnCliente: TToolButton;
    btnProduto: TToolButton;
    btnVenda: TToolButton;
    ToolButton9: TToolButton;
    btnTroca: TToolButton;
    ToolButton2: TToolButton;
    btnBalcao: TToolButton;
    ToolButton4: TToolButton;
    MainMenu: TMainMenu;
    miSair: TMenuItem;
    Cadastros1: TMenuItem;
    miClientes: TMenuItem;
    miProdutos: TMenuItem;
    Movimentaes1: TMenuItem;
    miVendas: TMenuItem;
    miTrocas: TMenuItem;
    N1: TMenuItem;
    miBalcao: TMenuItem;
    btnImprimir: TToolButton;
    miImprimir: TMenuItem;
    Splitter1: TSplitter;
    PanGraf: TPanel;
    ToolBar1: TToolBar;
    PageControlChart: TPageControl;
    TabSheet1: TTabSheet;
    GridPanel1: TGridPanel;
    DBChart3: TDBChart;
    HorizBarSeries2: THorizBarSeries;
    DBChart4: TDBChart;
    HorizBarSeries3: THorizBarSeries;
    TabSheet2: TTabSheet;
    GridPanel2: TGridPanel;
    DBChart1: TDBChart;
    Series1: THorizBarSeries;
    DBChart2: TDBChart;
    HorizBarSeries1: THorizBarSeries;
    TabSheet3: TTabSheet;
    DBChart5: TDBChart;
    Series2: TLineSeries;
    Series3: TLineSeries;
    btnGrafFecha: TToolButton;
    btnGrafPrint: TToolButton;
    btnGrafExport: TToolButton;
    btnGrafAtu: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnBalcaoClick(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnTrocaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnGrafFechaClick(Sender: TObject);
    procedure btnGrafPrintClick(Sender: TObject);
    procedure btnGrafExportClick(Sender: TObject);
    procedure btnGrafAtuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetChart(APrimeiro: boolean = True): TDBChart;
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

{$R *.dfm}

uses UDataMod, UFuncoes, UProduto, UCliente, UVendaTroca, UVenda, UTroca,
  UPadrao;

procedure TFMenu.btnBalcaoClick(Sender: TObject);
begin
  if Application.FindComponent('FVenda') <> nil then
    FVenda.Close;
  if Application.FindComponent('FTroca') <> nil then
    FTroca.Close;

  RelacionaVendaTroca(vtVenda);

  Dm.CDSTroca.MasterSource := Dm.DSVendaTroca;
  Dm.CDSTroca.MasterFields := 'TROCA_ID';
  Dm.CDSTroca.IndexFieldNames := 'ID';

  if Application.FindComponent('FVendaTroca') = nil then
    Application.CreateForm(TFVendaTroca, FVendaTroca)
  else
    FVendaTroca.BringToFront;
end;

procedure TFMenu.btnClienteClick(Sender: TObject);
begin
  if Application.FindComponent('FCliente') = nil then
    Application.CreateForm(TFCliente, FCliente)
  else
    FCliente.BringToFront;
end;

procedure TFMenu.btnGrafAtuClick(Sender: TObject);
begin
  DM.QGrafVenda1.Close;
  DM.QGrafProduto1.Close;
  DM.QGrafProduto2.Close;
  DM.QGrafCliente1.Close;
  DM.QGrafCliente2.Close;
  ThreadExecSql(nil, '', nil, DM.QGrafVenda1);
  ThreadExecSql(nil, '', nil, DM.QGrafProduto1);
  ThreadExecSql(nil, '', nil, DM.QGrafProduto2);
  ThreadExecSql(nil, '', nil, DM.QGrafCliente1);
  ThreadExecSql(nil, '', nil, DM.QGrafCliente2);
end;

procedure TFMenu.btnGrafExportClick(Sender: TObject);
begin
  if Dm.SavePictureDialog.Execute then
  begin
    GetChart.SaveToBitmapFile(Dm.SavePictureDialog.FileName);
    if PageControlChart.ActivePageIndex < 2 then
      GetChart(False).SaveToBitmapFile(Dm.SavePictureDialog.FileName);
  end;
end;

procedure TFMenu.btnGrafFechaClick(Sender: TObject);
begin
  PanGraf.Visible := False;
end;

procedure TFMenu.btnGrafPrintClick(Sender: TObject);
begin
  ChartPreview(nil, GetChart);
  if PageControlChart.ActivePageIndex < 2 then
    ChartPreview(nil, GetChart(False));
end;

procedure TFMenu.btnImprimirClick(Sender: TObject);
begin
  try
    if ActiveMDIChild <> nil then
    begin
      if ActiveMDIChild = FVendaTroca then
        FVendaTroca.Imprimir
      else
        TFPadrao(ActiveMDIChild).Imprimir;
    end;
  except
    on EAbstractError do
      showmessage('Impress�o ainda n�o implementada!');
  end;
end;

procedure TFMenu.btnProdutoClick(Sender: TObject);
begin
  if Application.FindComponent('FProduto') = nil then
    Application.CreateForm(TFProduto, FProduto)
  else
    FProduto.BringToFront;
end;

procedure TFMenu.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMenu.btnTrocaClick(Sender: TObject);
begin
  if Application.FindComponent('FVendaTroca') <> nil then
  begin
    showmessage('Finalize a tela do balc�o para continuar!');
    exit;
  end;
  if Application.FindComponent('FTroca') = nil then
    Application.CreateForm(TFTroca, FTroca)
  else
    FTroca.BringToFront;
end;

procedure TFMenu.btnVendaClick(Sender: TObject);
begin
  if Application.FindComponent('FVendaTroca') <> nil then
  begin
    showmessage('Finalize a tela do balc�o para continuar!');
    exit;
  end;
  if Application.FindComponent('FVenda') = nil then
    Application.CreateForm(TFVenda, FVenda)
  else
    FVenda.BringToFront;
end;

procedure TFMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
  btnGrafAtu.Click;
end;

procedure TFMenu.FormShow(Sender: TObject);
begin
  Self.Caption := CAPTIONINPUTBOX;
  dm.CDSVendaTroca.Open;
end;

function TFMenu.GetChart(APrimeiro: boolean = True): TDBChart;
begin
  case PageControlChart.ActivePageIndex of
    0: if APrimeiro then Result := DBChart3 else Result := DBChart4;
    1: if APrimeiro then Result := DBChart1 else Result := DBChart2;
    2: Result := DBChart5;
  end;
end;

end.
