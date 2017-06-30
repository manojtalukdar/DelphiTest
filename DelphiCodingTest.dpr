program DelphiCodingTest;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uClassDef in 'uClassDef.pas',
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
