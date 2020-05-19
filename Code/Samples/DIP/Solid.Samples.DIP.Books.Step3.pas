unit Solid.Samples.DIP.Books.Step3;

interface

uses
  System.IOUtils;

type

  { IBook }

  IBook = interface
    ['{59A3B142-73C3-4BF5-AC7D-CEB422591DA2}']
    function Read: TArray<Byte>;
  end;

  { TPdfBook }

  TPdfBook = class(TInterfacedObject, IBook)
  private
    FPath: string;
  public
    constructor Create(const APath: string);
    function Read: TArray<Byte>;
  end;

  { TKoboBook  }

  TKoboBook = class(TInterfacedObject, IBook)
  private
    FPath: string;
  public
    constructor Create(const APath: string);
    function Read: TArray<Byte>;
  end;

  { TMobiBook }

  TMobiBook = class(TInterfacedObject, IBook)
  private
    FPath: string;
  public
    constructor Create(const APath: string);
    function Read: TArray<Byte>;
  end;

  { TBookReader }

  TBookReader = class
  private
    FBook: IBook;
  public
    constructor Create(ABook: IBook);
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

{ TKoboBook }

constructor TKoboBook.Create(const APath: string);
begin
  inherited Create;
  FPath := APath;
end;

function TKoboBook.Read: TArray<Byte>;
begin
  Result := TFile.ReadAllBytes(FPath);
end;

{ TMobiBook }

constructor TMobiBook.Create(const APath: string);
begin
  inherited Create;
  FPath := APath;
end;

function TMobiBook.Read: TArray<Byte>;
begin
  Result := TFile.ReadAllBytes(FPath);
end;

{ TBookReader }

constructor TBookReader.Create(ABook: IBook);
begin
  inherited Create;
  FBook := ABook;
end;

procedure TBookReader.Display;
var
  LData: TArray<Byte>;
begin
  LData := FBook.Read;
  // TODO
end;

end.
