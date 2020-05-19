unit Solid.Samples.SRP.BookRight;

interface

uses
  System.SysUtils;

type

  { TBookEntity }

  TBookEntity = class
  private
    FAuthor: string;
    FPageCount: Integer;
    FTitle: string;
    function GetLocation: string;
    procedure SetAuthor(const AValue: string);
    procedure SetLocation(const AValue: string);
    procedure SetPageCount(const AValue: Integer);
    procedure SetTitle(const AValue: string);
  public
    property Author: string read FAuthor write SetAuthor;
    property Location: string read GetLocation write SetLocation; // WARNING!
    property PageCount: Integer read FPageCount write SetPageCount;
    property Title: string read FTitle write SetTitle;
  end;

  { TBookPaperPrinter }

  TBookPaperPrinter = class
  public
    procedure Print(ABook: TBookEntity; APage: Integer = 0);
  end;

  { TBookDbPersistor }

  TBookDbPersistor = class
  private
    FConnectionString: string;
  public
    constructor Create(const AConnectionString: string);
    procedure Save(ABook: TBookEntity; APage: Integer = 0);
  end;

  { TBookStand }

  TBookStand = class
  private
    FCurrentBook: TBookEntity;
    FCurrentPage: Integer;
    FPersistor: TBookDbPersistor;
    FPrinter: TBookPaperPrinter;
    procedure SetCurrentBook(AValue: TBookEntity);
    procedure SetCurrentPage(AValue: Integer);
    function HasBook: Boolean;
  public
    constructor Create(APersistor: TBookDbPersistor;
      APrinter: TBookPaperPrinter);
    property CurrentBook: TBookEntity read FCurrentBook write SetCurrentBook;
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage;
    procedure OpenNewBook(ABook: TBookEntity);
    procedure CloseBook;
    procedure NextPage();
    procedure PriorPage();
    procedure Print(APage: Integer = 0);
    procedure Save(APage: Integer = 0);
  end;

implementation

{ TBookEntity }

function TBookEntity.GetLocation: string;
begin
  Result := EmptyStr; // TODO
end;

procedure TBookEntity.SetAuthor(const AValue: string);
begin
  FAuthor := Trim(AValue);
end;

procedure TBookEntity.SetLocation(const AValue: string);
begin
  // TODO
end;

procedure TBookEntity.SetPageCount(const AValue: Integer);
begin
  if FPageCount < 0 then
    Exit;
  FPageCount := AValue;
end;

procedure TBookEntity.SetTitle(const AValue: string);
begin
  FTitle := Trim(AValue);
end;

{ TBookStand }

procedure TBookStand.CloseBook;
begin
  SetCurrentBook(nil);
end;

constructor TBookStand.Create(APersistor: TBookDbPersistor;
  APrinter: TBookPaperPrinter);
begin
  inherited Create;
  FPersistor := APersistor;
  FPrinter := APrinter;
end;

function TBookStand.HasBook: Boolean;
begin
  Result := FCurrentBook <> nil;
end;

procedure TBookStand.OpenNewBook(ABook: TBookEntity);
begin
  SetCurrentBook(ABook);
end;

procedure TBookStand.Print(APage: Integer = 0);
begin
  if not HasBook then
    raise Exception.Create('Book not opened');
  FPrinter.Print(FCurrentBook, APage);
end;

procedure TBookStand.PriorPage;
begin
  if not HasBook then
    Exit;
  if FCurrentPage <= 1 then
    Exit;
  Dec(FCurrentPage);
end;

procedure TBookStand.Save(APage: Integer = 0);
begin
  if not HasBook then
    raise Exception.Create('Book not opened');
  FPersistor.Save(FCurrentBook, APage);
end;

procedure TBookStand.SetCurrentBook(AValue: TBookEntity);
begin
  FCurrentBook := AValue;
  if HasBook then
    FCurrentPage := 1
  else
    FCurrentPage := 0;
end;

procedure TBookStand.SetCurrentPage(AValue: Integer);
begin
  if AValue < 0 then
    Exit;

  if FCurrentBook = nil then
    Exit;

  if AValue > FCurrentBook.PageCount then
    Exit;

  FCurrentPage := AValue;
end;

procedure TBookStand.NextPage;
begin
  if not HasBook then
    Exit;
  if FCurrentPage >= FCurrentBook.PageCount then
    Exit;
  Inc(FCurrentPage);
end;

{ TBookPaperPrinter }

procedure TBookPaperPrinter.Print(ABook: TBookEntity; APage: Integer);
begin
  // TODO
end;

{ TBookDbPersistor }

constructor TBookDbPersistor.Create(const AConnectionString: string);
begin
  inherited Create;
  FConnectionString := AConnectionString;
end;

procedure TBookDbPersistor.Save(ABook: TBookEntity; APage: Integer);
begin
  // TODO
end;

end.
