unit Solid.Samples.OCP.Streaming.Wrong;

interface

type

  { TDownloadingFile }

  TDownloadingFile = class
  private
    FLength: Longint;
    FSent: Longint;
  public
    constructor Create(const ALength: Longint);
    property Length: Longint read FLength;
    property Sent: Longint read FSent write FSent;
  end;

  { TDownloadingProgress }

  TDownloadingProgress = class
  private
    FFile: TDownloadingFile;
  public
    constructor Create(AFile: TDownloadingFile);
    function GetAsPercent: Double;
  end;

implementation

{ TDownloadingFile }

constructor TDownloadingFile.Create(const ALength: Longint);
begin
  inherited Create;
  FLength := ALength;
end;

{ TDownloadingProgress }

constructor TDownloadingProgress.Create(AFile: TDownloadingFile);
begin
  inherited Create;
  FFile := AFile;
end;

function TDownloadingProgress.GetAsPercent: Double;
begin
  Result := FFile.Sent / FFile.Length * 100;
end;

end.
