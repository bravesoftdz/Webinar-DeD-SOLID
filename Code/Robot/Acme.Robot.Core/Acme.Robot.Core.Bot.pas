unit Acme.Robot.Core.Bot;

interface

uses
  System.Rtti,
  System.SysUtils,
  System.Types;

type

  TBotMood = (Happy, Grumpy);

  TBotOrientation = (North, South, West, East);

  IBot = interface
    ['{0E047C05-FEB2-4817-9AF3-56CA008FE927}']
    function ToString: string;
    procedure GoHome();
    procedure Move(ASteps: Integer = 1);
    procedure Rotate(AOrientation: TBotOrientation);
    procedure TurnOn();
    procedure TurnOff();
    function GetActive: Boolean;
    function GetName: string;
    function GetLocation: TPoint;
    function GetOrientation: TBotOrientation;
    property Active: Boolean read GetActive;
    property Name: string read GetName;
    property Location: TPoint read GetLocation;
    property Orientation: TBotOrientation read GetOrientation;
  end;

  ITalkingBot = interface(IBot)
    ['{695FC06F-241C-4178-B816-6CAFC93E5197}']
    procedure Say(const AText: string);
  end;

  IHumanBot = interface(IBot)
    ['{312EFB25-B649-4E6D-B0D2-43A85634DF3A}']
    procedure Express(AMood: TBotMood);
  end;

  TBot = class abstract(TInterfacedObject, IBot)
  private
    FActive: Boolean;
    FName: string;
    FLocation: TPoint;
    FOrientation: TBotOrientation;
  protected
    procedure AfterMoving(ASteps: Integer); dynamic;
    procedure BeforeMoving(ASteps: Integer); dynamic;
    procedure AfterTurningOn; dynamic;
    procedure BeforeTurningOff; dynamic;
  public
    constructor Create(const AName: string); virtual;
    function ToString: string; override;
    function GetActive: Boolean;
    function GetLocation: TPoint;
    function GetName: string;
    function GetOrientation: TBotOrientation;
    procedure GoHome();
    procedure Move(ASteps: Integer = 1);
    procedure Rotate(AOrientation: TBotOrientation);
    procedure TurnOn();
    procedure TurnOff();
  end;

implementation

{ TBot }

constructor TBot.Create(const AName: string);
begin
  inherited Create;
  FLocation := TPoint.Zero;
  FName := AName;
  FOrientation := TBotOrientation.North;
end;

procedure TBot.AfterMoving(ASteps: Integer);
begin
end;

procedure TBot.AfterTurningOn;
begin
end;

procedure TBot.BeforeMoving(ASteps: Integer);
begin
end;

procedure TBot.BeforeTurningOff;
begin
end;

function TBot.GetActive: Boolean;
begin
  Result := FActive;
end;

function TBot.GetLocation: TPoint;
begin
  Result := FLocation;
end;

function TBot.GetName: string;
begin
  Result := FName;
end;

function TBot.GetOrientation: TBotOrientation;
begin
  Result := FOrientation;
end;

procedure TBot.GoHome;
begin
  if not FActive then
    Exit;
  FLocation := TPoint.Zero;
end;

procedure TBot.Move(ASteps: Integer);
begin
  if not FActive then
    Exit;
  BeforeMoving(ASteps);
  case FOrientation of
    North:
      FLocation.Offset(0, -ASteps);
    South:
      FLocation.Offset(0, +ASteps);
    West:
      FLocation.Offset(-ASteps, 0);
    East:
      FLocation.Offset(+ASteps, 0);
  end;
  AfterMoving(ASteps);
end;

procedure TBot.Rotate(AOrientation: TBotOrientation);
begin
  if not FActive then
    Exit;
  FOrientation := AOrientation;
end;

function TBot.ToString: string;
begin
  Result := Format('%s: A=%d, X=%d, Y=%d, O=%s', [FName, FActive.ToInteger,
    FLocation.X, FLocation.Y, TRttiEnumerationType.GetName(FOrientation)]);
end;

procedure TBot.TurnOff;
begin
  if not FActive then
    Exit;
  BeforeTurningOff;
  FActive := False;
end;

procedure TBot.TurnOn;
begin
  if FActive then
    Exit;
  FActive := True;
  AfterTurningOn;
end;

end.
