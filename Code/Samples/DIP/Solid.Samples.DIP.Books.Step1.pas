unit Solid.Samples.DIP.Books.Step1;

interface

uses
  System.IOUtils;

type

  { TPdfBook }

  TPdfBook = class
  private
    FPath: string;
  public
    constructor Create(const APath: string);
    function Read: TArray<Byte>;
  end;

  { TPdfBookReader }

  TPdfBookReader = class
  private
    FBook: TPdfBook;
  public
    constructor Create(ABook: TPdfBook);
    procedure Display;
  end;

implementation

{ TPdfBook }

constructor TPdfBook.Create(const APath: string);
begin
  inherited Create;
  FPath := APath;
end;

function TPdfBook.Read: TArray<Byte>;
begin
  Result := TFile.ReadAllBytes(FPath);
end;

{ TPdfBookReader }

constructor TPdfBookReader.Create(ABook: TPdfBook);
begin
  inherited Create;
  FBook := ABook;
end;

procedure TPdfBookReader.Display;
var
  LData: TArray<Byte>;
begin
  LData := FBook.Read;
  // TODO
end;

end.
