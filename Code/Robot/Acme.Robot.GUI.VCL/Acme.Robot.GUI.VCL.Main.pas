unit Acme.Robot.GUI.VCL.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.Imaging.pngimage,
  Acme.Robot.Core.Bot, Acme.Robot.Core.CleanBot, Acme.Robot.Core.Communications,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm, IEnhancedCommunicator)
    CommandPanel: TPanel;
    BotActionList: TActionList;
    ArenaBox: TScrollBox;
    BotImage: TImage;
    BotStatusBar: TStatusBar;
    BotTurnOnButton: TButton;
    BotTurnOnAction: TAction;
    BotTurnOffAction: TAction;
    BotOrientationNorthAction: TAction;
    BotOrientationSouthAction: TAction;
    BotOrientationEastAction: TAction;
    BotOrientationWestAction: TAction;
    BotHelloAction: TAction;
    BotMoveSlowAction: TAction;
    BotMoveFastAction: TAction;
    MessagePanel: TPanel;
    BotGoHomeAction: TAction;
    MoodGrumpyImage: TImage;
    MoodHappyImage: TImage;
    procedure BotActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure BotTurnOnActionExecute(Sender: TObject);
    procedure BotTurnOffActionExecute(Sender: TObject);
    procedure BotOrientationNorthActionExecute(Sender: TObject);
    procedure BotOrientationSouthActionExecute(Sender: TObject);
    procedure BotOrientationEastActionExecute(Sender: TObject);
    procedure BotOrientationWestActionExecute(Sender: TObject);
    procedure BotHelloActionExecute(Sender: TObject);
    procedure BotMoveSlowActionExecute(Sender: TObject);
    procedure BotMoveFastActionExecute(Sender: TObject);
    procedure BotGoHomeActionExecute(Sender: TObject);
  private
    FBot: ITalkingBot;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ShowMood(AMood: TBotMood);
    procedure SayMessage(const AText: string);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ TMainForm }

procedure TMainForm.BotActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  BotImage.Visible := FBot.Active;
  BotImage.Left := FBot.Location.X;
  BotImage.Top := FBot.Location.Y;
  BotStatusBar.SimpleText := FBot.ToString;
  Handled := True;
end;

procedure TMainForm.BotGoHomeActionExecute(Sender: TObject);
begin
  FBot.GoHome;
end;

procedure TMainForm.BotHelloActionExecute(Sender: TObject);
begin
  FBot.Say('Hello everybody!');
end;

procedure TMainForm.BotMoveFastActionExecute(Sender: TObject);
begin
  FBot.Move(20);
end;

procedure TMainForm.BotMoveSlowActionExecute(Sender: TObject);
begin
  FBot.Move(5);
end;

procedure TMainForm.BotOrientationEastActionExecute(Sender: TObject);
begin
  FBot.Rotate(TBotOrientation.East);
end;

procedure TMainForm.BotOrientationNorthActionExecute(Sender: TObject);
begin
  FBot.Rotate(TBotOrientation.North);
end;

procedure TMainForm.BotOrientationSouthActionExecute(Sender: TObject);
begin
  FBot.Rotate(TBotOrientation.South);
end;

procedure TMainForm.BotOrientationWestActionExecute(Sender: TObject);
begin
  FBot.Rotate(TBotOrientation.West);
end;

procedure TMainForm.BotTurnOffActionExecute(Sender: TObject);
begin
  FBot.TurnOff;
end;

procedure TMainForm.BotTurnOnActionExecute(Sender: TObject);
begin
  FBot.TurnOn;
end;

constructor TMainForm.Create(AOwner: TComponent);
var
  LCommunicator: IEnhancedCommunicator;
begin
  inherited Create(AOwner);
  if not Supports(Self, IEnhancedCommunicator, LCommunicator) then
    LCommunicator := nil;
  FBot := NewCleanBot('SveltoBot', LCommunicator);
end;

procedure TMainForm.SayMessage(const AText: string);
begin
  MessagePanel.Caption := AText;
  MessagePanel.Visible := Length(AText) > 0;
end;

procedure TMainForm.ShowMood(AMood: TBotMood);
begin
  MoodHappyImage.Visible := AMood = TBotMood.Happy;
  MoodGrumpyImage.Visible := AMood = TBotMood.Grumpy;
end;

end.
