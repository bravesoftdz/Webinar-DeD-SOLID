unit Acme.Robot.GUI.Console.Controller;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  Acme.Robot.Core.Bot;

type

  TConsoleBotController = class
  private
    FBot: IBot;
    FMacros: TDictionary<string, TProc<IBot>>;
  public
    constructor Create(ABot: IBot);
    function HandleNextCommand: Boolean;
  end;

implementation

resourcestring
  StrCommandNotFound = 'Command not found';

  { TConsoleBotController }

constructor TConsoleBotController.Create(ABot: IBot);
begin
  inherited Create;
  FBot := ABot;

  FMacros := TDictionary < string, TProc < IBot >>.Create;
  FMacros.Add('T1',
    procedure(ABot: IBot)
    begin
      ABot.TurnOn;
    end);
  FMacros.Add('T0',
    procedure(ABot: IBot)
    begin
      ABot.TurnOff;
    end);
  FMacros.Add('NAME',
    procedure(ABot: IBot)
    begin
      Writeln(Format('[Name] %s', [ABot.Name]))
    end);
  FMacros.Add('ON',
    procedure(ABot: IBot)
    begin
      ABot.Rotate(TBotOrientation.North);
    end);
  FMacros.Add('OS',
    procedure(ABot: IBot)
    begin
      ABot.Rotate(TBotOrientation.South);
    end);
  FMacros.Add('OE',
    procedure(ABot: IBot)
    begin
      ABot.Rotate(TBotOrientation.East);
    end);
  FMacros.Add('OW',
    procedure(ABot: IBot)
    begin
      ABot.Rotate(TBotOrientation.West);
    end);
  FMacros.Add('M1',
    procedure(ABot: IBot)
    begin
      ABot.Move(1);
    end);
  FMacros.Add('M5',
    procedure(ABot: IBot)
    begin
      ABot.Move(5);
    end);
  FMacros.Add('HELLO',
    procedure(ABot: IBot)
    var
      LTalkingBot: ITalkingBot;
    begin
      if Supports(ABot, ITalkingBot, LTalkingBot) then
        LTalkingBot.Say('Hello to you!');
    end);
end;

function TConsoleBotController.HandleNextCommand: Boolean;
var
  LCommand: string;
  LMacro: TProc<IBot>;
begin
  Readln(LCommand);

  LCommand := UpperCase(Trim(LCommand));

  if Length(LCommand) <= 0 then
  begin
    Result := False;
    Exit;
  end;

  Result := True;

  if not FMacros.TryGetValue(LCommand, LMacro) or not Assigned(LMacro) then
  begin
    Writeln(StrCommandNotFound);
    Writeln;
    Exit;
  end;

  LMacro(FBot);

  Writeln(Format('[Status] %s', [FBot.ToString]));
  Writeln;

end;

end.
