program Acme.Robot.GUI.Console;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Acme.Robot.Core.Bot,
  Acme.Robot.Core.CleanBot,
  Acme.Robot.Core.Communications,
  Acme.Robot.GUI.Console.Controller in 'Acme.Robot.GUI.Console.Controller.pas',
  Acme.Robot.GUI.Console.Communicator
    in 'Acme.Robot.GUI.Console.Communicator.pas';

var
  Bot: IBot;
  Communicator: IEnhancedCommunicator;
  Controller: TConsoleBotController;

begin

  try
    Communicator := NewConsoleCommunicator;
    Bot := NewCleanBot('LindoBot', Communicator);

    Controller := TConsoleBotController.Create(Bot);
    try
      while Controller.HandleNextCommand do
      begin
        // idle
      end;
    finally
      Controller.Free;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
