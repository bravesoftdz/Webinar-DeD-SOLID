unit Acme.Robot.Core.Communications;

interface

uses
  Acme.Robot.Core.Bot;

type

  ICommunicator = interface
    ['{D82E5456-7E6D-4B5A-91CB-C791402A29AA}']
    procedure SayMessage(const AText: string);
  end;

  IEnhancedCommunicator = interface(ICommunicator)
    ['{E3B43144-622A-4327-B5D8-78322C7DADC4}']
    procedure ShowMood(AMood: TBotMood);
  end;

implementation

end.
