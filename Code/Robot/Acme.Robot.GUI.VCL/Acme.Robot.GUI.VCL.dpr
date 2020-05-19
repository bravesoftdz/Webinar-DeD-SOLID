program Acme.Robot.GUI.VCL;

uses
  Vcl.Forms,
  Acme.Robot.GUI.VCL.Main in 'Acme.Robot.GUI.VCL.Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
