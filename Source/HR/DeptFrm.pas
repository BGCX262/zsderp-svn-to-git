unit DeptFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms,
  Dialogs, ComCtrls, uDM, DB, uBPLMG, StrUtils,
  uBuff, ZSDDataSet, ExtCtrls, Grids, DBGrids, ZsdFrm, DBClient, Controls,
  ZSDDBGrid, ZSDTool;

type
  TNodeValue = class // 与当前节点相关地值地类
    PCode: String;
  end;

  TFrmDept = class(TZSDForm)
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    cdsView: TZSDDataSet;
    dsView: TDataSource;
    ZSDDBGrid1: TZSDDBGrid;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure ZSDTool1Save(Sender: TObject);
    procedure ZSDDBGrid1DblClick(Sender: TObject);
  private
    selFrom: String;
    procedure FillTreeView(TreeView: TTreeView);
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmMenu: TFrmDept;

implementation

{$R *.dfm}

procedure TFrmDept.cdsViewNewRecord(DataSet: TDataSet);
begin
  with cdsView do
  begin
    if Self.TreeView1.Items.Count <= 0 then
    begin
      FieldbyName('Code_').Asstring := '00';
      FieldbyName('PCode_').Asstring := '0'
    end
    else
      FieldbyName('PCode_').Asstring :=
        TNodeValue(TreeView1.Selected.Data).PCode;
  end;
end;

procedure TFrmDept.FillTreeView(TreeView: TTreeView);
  procedure CreateSubTree(FNodeName: string; Node: TTreeNode = nil);
  var
    mLocalName: string;
    TreeNode: TTreeNode;
    cdsTMP: TZSDDataSet;
    AValue: TNodeValue;
  begin
    cdsTMP := TZSDDataSet.Create(Self);
    DM.RemoteServer(cdsTMP);
    with cdsTMP do
      try
        Close;
        CommandText :=
          Format('Select * from Dept Where PCode_ =''%s'' Order By Code_',
          [FNodeName]);
        Open;
        First;
        while not Eof do
        begin
          mLocalName := FieldbyName('Code_').Asstring;
          TreeNode := TreeView.Items.AddChild(Node,
            FieldbyName('Name_').Asstring);
          if not FieldbyName('Code_').IsNull then
          begin
            AValue := TNodeValue.Create;
            AValue.PCode := FieldbyName('Code_').Asstring;
            TreeNode.Data := AValue;
          end
          else
          begin
            TreeNode.Data := nil;
          end;
          CreateSubTree(mLocalName, TreeNode); // 此处循环递归
          Next;
        end;
      finally
        DM.FreeRemoteServer(cdsTMP);
      end;
  end;

begin
  TreeView.Items.BeginUpdate;
  TreeView.Items.Clear;
  CreateSubTree('0', nil);
  TreeView.Items.EndUpdate;
end;

procedure TFrmDept.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From Dept';
    Open;
  end;
  FillTreeView(TreeView1);
end;

procedure TFrmDept.TreeView1Click(Sender: TObject);
begin
  with cdsView do
  begin
    Close;
    CommandText := Format('Select * From Dept where PCode_=''%s''',
      [TNodeValue(TreeView1.Selected.Data).PCode]);
    Open;
  end;
end;

procedure TFrmDept.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  inherited;
  case DM.ZSDMsgType of
    COST_ZSD_SELCODE:
      begin
        selFrom := DM.ZSDargs[0];
        Self.TreeView1.Visible := False;
        Self.ZSDDBGrid1.ReadOnly := True;
        with cdsView do
        begin
          Close;
          CommandText := 'Select * From Dept';
          Open;
        end;
      end;
  end;
end;

procedure TFrmDept.ZSDDBGrid1DblClick(Sender: TObject);
begin
  if selFrom <> '' then
  begin
    DM.ZSDSendMsg(selFrom, COST_ZSD_SAVCODE,
      [Self.Name, cdsView.FieldbyName('Code_').Asstring]);
  end;
end;

procedure TFrmDept.ZSDTool1Save(Sender: TObject);
begin
  FillTreeView(TreeView1);
end;

initialization

RegisterClass(TFrmDept);

finalization

UnRegisterClass(TFrmDept);

end.
