unit Acme.Robot.Core.CleanBot;

interface

uses
  System.Rtti,
  System.SysUtils,
  Acme.Robot.Core.Bot,
  Acme.Robot.Core.Communications;

function NewCleanBot(const AName: string; ACommunicator: ICommunicator): ITalkingBot;

implementation

resourcestring
  StrDone = 'Done.';
  StrTurningOff = 'I am turning off.';
  StrTurnedOn = 'Ready for new jobs!';
  StrMoving = 'Moving %d steps going %s.';

type

  TCleanBot = class(TBot, ITalkingBot)
  private
    FCommunicator: ICommunicator;
    function HasCommunicator: Boolean;
  protected
    procedure AfterMoving(ASteps: Integer); override;
    procedure AfterTurningOn; override;
    procedure BeforeMoving(ASteps: Integer); override;
    procedure BeforeTurningOff; override;
  public
    procedure Express(AMood: TBotMood);
    procedure Say(const AText: string);
    property Communicator: ICommunicator read FCommunicator write FCommunicator;
  end;

procedure TCleanBot.AfterMoving(ASteps: Integer);
begin
  inherited;
  Say(StrDone);
end;

procedure TCleanBot.AfterTurningOn;
begin
  inherited;
  Express(TBotMood.Happy);
  Say(StrTurnedOn);
end;

procedure TCleanBot.BeforeMoving(ASteps: Integer);
begin
  inherited;
  Say(Format(StrMoving, [ASteps, TRttiEnumerationType.GetName(GetOrientation)]));
end;

procedure TCleanBot.BeforeTurningOff;
begin
  inherited;
  Express(TBotMood.Grumpy);
  Say(StrTurningOff);
end;

procedure TCleanBot.Express(AMood: TBotMood);
var
  LEnhancedCommunicator: IEnhancedCommunicator;
begin
  if not HasCommunicator then
    Exit;
  if Supports(FCommunicator, IEnhancedCommunicator, LEnhancedCommunicator) then
    LEnhancedCommunicator.ShowMood(AMood);
end;

function TCleanBot.HasCommunicator: Boolean;
begin
  Result := FCommunicator <> nil;
end;

procedure TCleanBot.Say(const AText: string);
begin
  if not HasCommunicator then
    Exit;
  FCommunicator.SayMessage(AText);
end;

function NewCleanBot(const AName: string; ACommunicator: ICommunicator): ITalkingBot;
var
  LBot: TCleanBot;
begin
  LBot := TCleanBot.Create(AName);
  LBot.Communicator := ACommunicator;
  Result := LBot;
end;

end.
