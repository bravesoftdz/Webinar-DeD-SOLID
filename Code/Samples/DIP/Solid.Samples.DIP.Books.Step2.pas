unit Solid.Samples.DIP.Books.Step2;

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

  { TBookReader }

  TBookReader = class // Simple refactoring
  private
    FEBook: TPdfBook;
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

{ TBookReader }

constructor TBookReader.Create(ABook: TPdfBook);
begin
  inherited Create;
  FEBook := ABook;
end;

procedure TBookReader.Display;
var
  LData: TArray<Byte>;
begin
  LData := FEBook.Read;
  // TODO
end;

end.
