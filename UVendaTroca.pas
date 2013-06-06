unit UVendaTroca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBLookup, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Math;

type
  TFVendaTroca = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    txtClienteId: TDBEdit;
    Label2: TLabel;
    txtDataVenda: TDBEdit;
    ToolBar2: TToolBar;
    btnVenda: TToolButton;
    btnTroca: TToolButton;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    txtId: TDBEdit;
    Label4: TLabel;
    txtQuant: TDBEdit;
    Label6: TLabel;
    txtPreco: TDBEdit;
    Label8: TLabel;
    Label7: TLabel;
    DBNav: TDBNavigator;
    DSItem: TDataSource;
    DBNavAcao: TDBNavigator;
    ToolButton1: TToolButton;
    btnProduto: TToolButton;
    btnCliente: TToolButton;
    ToolButton4: TToolButton;
    btnConsulta: TToolButton;
    txtBarra: TEdit;
    txtCliente: TDBLookupComboBox;
    txtProduto: TDBLookupComboBox;
    Timer1: TTimer;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    txtTotalVenda: TDBEdit;
    txtTotalTroca: TDBEdit;
    txtTotal: TEdit;
    Label13: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnVendaClick(Sender: TObject);
    procedure btnTrocaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure txtBarraKeyPress(Sender: TObject; var Key: Char);
    procedure txtBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure _KeyDown(var Key: Word);
  public
    { Public declarations }
    procedure Imprimir;
  end;

var
  FVendaTroca: TFVendaTroca;
  lPreco: Double = 0.00;
  lQuant: Double = 1.00;

implementation

{$R *.dfm}

uses UDataMod, UProduto, UCliente, UVenda, UFuncoes;

procedure TFVendaTroca.btnClienteClick(Sender: TObject);
begin
  try
    FCliente := TFCliente.Create(Self);
    FCliente.FormStyle := fsNormal;
    FCliente.Visible := False;
    FCliente.ShowModal;
    StatusCDS(dm.CDSVenda);
    dm.CDSVendaCLIENTES_ID.AsInteger := dm.CDSClienteID.AsInteger;
    txtClienteId.SetFocus;
  finally
    FCliente.Release;
    FreeAndNil(FCliente);
  end;
end;

procedure TFVendaTroca.btnConsultaClick(Sender: TObject);
begin
  try
    FVenda := TFVenda.Create(Self);
    FVenda.FormStyle := fsNormal;
    FVenda.Visible := False;
    FVenda.ShowModal;
    txtDataVenda.SetFocus;
  finally
    FVenda.Release;
    FreeAndNil(FVenda);
  end;
end;

procedure TFVendaTroca.btnProdutoClick(Sender: TObject);
begin
  try
    FProduto := TFProduto.Create(Self);
    FProduto.FormStyle := fsNormal;
    FProduto.Visible := False;
    FProduto.ShowModal;
    txtBarra.Text := dm.CDSProdutoBARRAS.AsString;
    txtBarra.SetFocus;
  finally
    FProduto.Release;
    FreeAndNil(FProduto);
  end;
end;

procedure TFVendaTroca.btnTrocaClick(Sender: TObject);
begin
  btnTroca.Down := True;
  btnVenda.Down := False;
  DSItem.DataSet := Dm.CDSItemTroca;
end;

procedure TFVendaTroca.btnVendaClick(Sender: TObject);
begin
  btnVenda.Down := True;
  btnTroca.Down := False;
  DSItem.DataSet := Dm.CDSItemVenda;
end;

procedure TFVendaTroca.DBNavClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    Close;
    Abort;
  end;
end;

procedure TFVendaTroca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.CDSTroca.MasterSource := nil;
  Dm.CDSTroca.MasterFields := '';
  Dm.CDSTroca.IndexFieldNames := '';

  RelacionaVendaTroca(vtTroca);

  Action := Cafree;
end;

procedure TFVendaTroca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ActiveControl <> DBGrid1 then
  begin
    if (key = 13) or (key = 40) then
      Perform(WM_nextDlgCtl, 0, 0);
    if key = 38 then
      Perform(WM_nextDlgCtl, 1, 0);
  end;
  if key = 27 then
    Close;
  _KeyDown(Key);
end;

procedure TFVendaTroca.FormShow(Sender: TObject);
begin
  if not dm.cdstroca.Active then
    dm.cdstroca.open;
end;

procedure TFVendaTroca.Imprimir;
begin
  with dm.CDSVenda do
  begin
    Filter := 'ID = ' + Dm.CDSVendaID.AsString;
    Filtered := True;
    dm.frxVendaTroca.ShowReport;
    Filtered := False;
  end;
end;

procedure TFVendaTroca.Timer1Timer(Sender: TObject);
begin
  txtTotal.Text := FormatFloat('R$ #,###,###0.00', dm.CDSVendaTOTALVENDIDO.AsFloat - dm.CDSTrocaTOTALTROCADO.AsFloat);
end;

procedure TFVendaTroca.txtBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_INSERT then
    lQuant := StrToFloatDef(InputBox(CAPTIONINPUTBOX, 'Digite a quantidade a ser inserida:', FloatToStr(lQuant)), lQuant);
  if key = VK_HOME then
    lPreco := StrToFloatDef(InputBox(CAPTIONINPUTBOX, 'Digite o pre�o a ser inserido:', FloatToStr(lPreco)), lPreco);
end;

procedure TFVendaTroca.txtBarraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if not Dm.CDSProduto.Locate('BARRAS', txtBarra.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      txtBarra.Text := 'Produto n�o localizado.';
      txtBarra.SetFocus;
      Exit;
    end;
    if btnVenda.Down then
    begin
      dm.CDSItemVenda.Append;
      dm.CDSItemVendaPRODUTOS_ID.AsInteger := dm.CDSProdutoID.AsInteger;
      dm.CDSItemVendaQUANTIDADE.AsFloat := lQuant;
      dm.CDSItemVendaPRECO.AsFloat := ifThen(lPreco > 0, lPreco, dm.CDSProdutoPRECO.AsFloat);
      dm.CDSItemVenda.Post;
    end
    else
    begin
      if dm.CDSVendaTroca.RecordCount = 0 then
      begin
        RelacionaVendaTroca(vtLivre);
        Dm.CDSVendaTroca.AfterPost := nil;
        dm.CDSVendaTroca.OnNewRecord := nil;
        dm.CDSVendaTroca.AppendRecord([dm.CDSVendaID.AsInteger, dm.CDSTrocaTMax.Value + 1]);
        RelacionaVendaTroca(vtVenda);
        dm.CDSVendaTroca.AfterPost := dm.CDSVendaTrocaAfterPost;
        dm.CDSVendaTroca.OnNewRecord := dm.CDSVendaTrocaNewRecord;
      end;
      if dm.CDSTroca.RecordCount = 0 then
      begin
        dm.CDSTroca.Append;
        dm.CDSTrocaDATATROCA.AsDateTime := dm.CDSVendaDATAVENDA.AsDateTime;
        dm.CDSTroca.post;
        if dm.CDSVendaTroca.ChangeCount > 0 then
          Dm.CDSVendaTroca.ApplyUpdates(0);
      end;
      dm.CDSItemTroca.Append;
      dm.CDSItemTrocaPRODUTOS_ID.AsInteger := dm.CDSProdutoID.AsInteger;
      dm.CDSItemTrocaQUANTIDADE.AsFloat := lQuant;
      dm.CDSItemTrocaPRECO.AsFloat := ifThen(lPreco > 0, lPreco, dm.CDSProdutoPRECO.AsFloat);
      dm.CDSItemTroca.Post;
    end;
    lPreco := 0;
    lQuant := 1;
    txtBarra.clear;
    txtbarra.setFocus;
  end;
end;

procedure TFVendaTroca._KeyDown(var Key: Word);
begin
  if key = vk_f12 then
    btnVenda.Click;
  if key = vk_f5 then
    btnTroca.Click;
  if key = VK_F10 then
    btnCliente.Click;
  if key = VK_F11 then
    btnConsulta.Click;
  if key = vk_f9 then
    btnProduto.Click;
  if ActiveControl <> txtBarra then
  begin
    if key = VK_INSERT then
      txtQuant.SetFocus;
    if key = VK_HOME then
      txtPreco.SetFocus;
  end;
end;

end.