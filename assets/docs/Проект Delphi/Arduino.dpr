program Arduino;

uses
  Vcl.Forms,
  uVCLMain in 'uVCLMain.pas' {frmMain},
  uEngine in 'uEngine.pas',
  udtmdData in 'udtmdData.pas' {dtmdData: TDataModule},
  uVCLInputForm in 'uVCLInputForm.pas' {frmInput},
  uVCLSettings in 'uVCLSettings.pas' {frmSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdtmdData, dtmdData);
  Application.Run;
end.
