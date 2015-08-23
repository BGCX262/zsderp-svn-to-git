unit FINANCIALMFrm;

interface

uses
  ZSDFrm,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZSDTool, Datasnap.DBClient,
  ZSDDataSet, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid;

type
  TFrmFINANCIALM = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    dsView: TDataSource;
    cdsViewDATE_: TSQLTimeStampField;
    cdsViewOUTPRO_: TStringField;
    cdsViewINTOPRO_: TStringField;
    cdsViewREMARKS_: TStringField;
    cdsViewAPPUSER_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUPDATEUSER_: TStringField;
    cdsViewUPDATEDATE_: TSQLTimeStampField;
    cdsViewBALANCE_: TSingleField;
    cdsViewOUTAMOUNT_: TSingleField;
    cdsViewINTOAMOUNT_: TSingleField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFINANCIALM: TFrmFINANCIALM;

implementation

{$R *.dfm}



procedure TFrmFINANCIALM.FormCreate(Sender: TObject);
begin
 inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  OA_FINANCIALM';
    Open;
  end;
end;

initialization

RegisterClass(TFrmFINANCIALM);

finalization

UnRegisterClass(TFrmFINANCIALM);
end.
