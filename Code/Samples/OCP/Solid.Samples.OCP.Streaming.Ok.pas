unit Solid.Samples.OCP.Streaming.Ok;

interface

uses
  System.SysUtils;

type

  { IMeasurable }

  IMeasurable = interface
    ['{D47A7A76-F058-4E36-89F5-F49F10926DAE}']
    function GetLength: Integer;
    function GetSent: Integer;
  end;

  { TStreamingMusic }

  TStreamingMusic = class(TInterfacedObject, IMeasurable)
  private
    FAlbum: string;
    FArtist: string;
    FBytesLength: Integer;
    FBytesSent: Integer;
    FReleaseDate: TDateTime;
    FTitle: string;
    procedure SetAlbum(const AValue: string);
    procedure SetArtist(const AValue: string);
    procedure SetBytesSent(const AValue: Integer);
    procedure SetReleaseDate(const AValue: TDateTime);
    procedure SetTitle(const AValue: string);
  public
    constructor Create(const ABytesLength: Integer);
    function GetLength: Integer;
    function GetSent: Integer;
    property Album: string read FAlbum write SetAlbum;
    property Artist: string read FArtist write SetArtist;
    property BytesLength: Integer read FBytesLength;
    property BytesSent: Integer read FBytesSent write SetBytesSent;
    property ReleaseDate: TDateTime read FReleaseDate write SetReleaseDate;
    property Title: string read FTitle write SetTitle;
  end;

  { TStreamingFile }

  TStreamingFile = class(TInterfacedObject, IMeasurable)
  private
    FAttachmentName: string;
    FContentType: string;
    FLength: Integer;
    FSent: Integer;
  public
    constructor Create(const ALength: Integer);
    function GetLength: Integer;
    function GetSent: Integer;
    property AttachmentName: string read FAttachmentName write FAttachmentName;
    property ContentType: string read FContentType write FContentType;
    property Length: Integer read FLength;
    property Sent: Integer read FSent write FSent;
  end;

  { TProgressViewer }

  TProgressViewer = class
  private
    FMedia: IMeasurable;
  public
    constructor Create(AMedia: IMeasurable);
    function GetAsPercent: Double;
  end;

implementation

{ TStreamingMusic }

constructor TStreamingMusic.Create(const ABytesLength: Integer);
begin
  inherited Create;
  FBytesLength := ABytesLength;
end;

function TStreamingMusic.GetLength: Integer;
begin
  Result := FBytesLength;
end;

function TStreamingMusic.GetSent: Integer;
begin
  Result := FBytesSent;
end;

procedure TStreamingMusic.SetAlbum(const AValue: string);
begin
  FAlbum := Trim(AValue);
end;

procedure TStreamingMusic.SetArtist(const AValue: string);
begin
  FArtist := Trim(AValue);
end;

procedure TStreamingMusic.SetBytesSent(const AValue: Integer);
begin
  FBytesSent := AValue;
end;

procedure TStreamingMusic.SetReleaseDate(const AValue: TDateTime);
begin
  FReleaseDate := AValue;
end;

procedure TStreamingMusic.SetTitle(const AValue: string);
begin
  FTitle := Trim(AValue);
end;

{ TStreamingFile }

constructor TStreamingFile.Create(const ALength: Integer);
begin
  inherited Create;
  FLength := ALength;
end;

function TStreamingFile.GetLength: Integer;
begin
  Result := FLength;
end;

function TStreamingFile.GetSent: Integer;
begin
  Result := FSent;
end;

{ TProgressViewer }

constructor TProgressViewer.Create(AMedia: IMeasurable);
begin
  inherited Create;
  FMedia := AMedia;
end;

function TProgressViewer.GetAsPercent: Double;
begin
  Result := FMedia.GetSent / FMedia.GetLength * 100;
end;

end.
