unit UserTestFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZSDFrm;

type
  TFrmZSDTest = class(TZSDForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}


initialization

RegisterClass(TFrmZSDTest);

finalization

UnRegisterClass(TFrmZSDTest);
end.
