unit Acme.Robot.GUI.Console.Communicator;

interface

uses
  System.Rtti,
  System.SysUtils,
  Acme.Robot.Core.Bot,
  Acme.Robot.Core.Communications;

function NewConsoleCommunicator: IEnhancedCommunicator;

implementation

type

  TConsoleBotCommunicator = class (TInterfacedObject, IEnhancedCommunicator)
  public
    procedure SayMessage(const AText: string);
    procedure ShowMood(AMood: TBotMood);
  end;

{ TConsoleBotCommunicator }

procedure TConsoleBotCommunicator.SayMessage(const AText: string);
begin
  Writeln(Format('[Message] %s', [AText]));
end;

procedure TConsoleBotCommunicator.ShowMood(AMood: TBotMood);
begin
  Writeln(Format('[Mood] %s', [TRttiEnumerationType.GetName(AMood)]));
end;

function NewConsoleCommunicator: IEnhancedCommunicator;
begin
  Result := TConsoleBotCommunicator.Create;
end;

end.
