unit Solid.Samples.OCP.Book.Ok;

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
    procedure SetAuthor(const AValue: string);
    procedure SetPageCount(const AValue: Integer);
    procedure SetTitle(const AValue: string);
  public
    property Author: string read FAuthor write SetAuthor;
    property PageCount: Integer read FPageCount write SetPageCount;
    property Title: string read FTitle write SetTitle;
  end;

  { IBookPrinter }

  IBookPrinter = interface
    ['{3F64DE79-C32C-4940-BD86-099A6A1A404E}']
    procedure Print(ABook: TBookEntity; APage: Integer = 0);
  end;

  { IBookPersistor }

  IBookPersistor = interface
    ['{41115130-5879-44A5-BA27-D87F338EE666}']
    procedure Save(ABook: TBookEntity; APage: Integer = 0);
  end;

  { TBookStand }

  TBookStand = class
  private
    FCurrentBook: TBookEntity;
    FCurrentPage: Integer;
    procedure SetCurrentBook(AValue: TBookEntity);
    procedure SetCurrentPage(AValue: Integer);
    function HasBook: Boolean;
  public
    property CurrentBook: TBookEntity read FCurrentBook write SetCurrentBook;
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage;
    procedure OpenNewBook(ABook: TBookEntity);
    procedure CloseBook;
    procedure NextPage();
    procedure PriorPage();
    procedure Print(APrinter: IBookPrinter; APage: Integer = 0);
    procedure Save(APersistor: IBookPersistor; APage: Integer = 0);
  end;

  { TBookPaperPrinter }

  TBookPaperPrinter = class(TInterfacedObject, IBookPrinter)
  public
    procedure Print(ABook: TBookEntity; APage: Integer = 0);
  end;

  { TBookHtmlPrinter }

  TBookHtmlPrinter = class(TInterfacedObject, IBookPrinter)
  public
    procedure Print(ABook: TBookEntity; APage: Integer = 0);
  end;

  { TBookDbPersistor }

  TBookDbPersistor = class(TInterfacedObject, IBookPersistor)
  private
    FConnectionString: string;
  public
    constructor Create(const AConnectionString: string);
    procedure Save(ABook: TBookEntity; APage: Integer = 0);
  end;

  { TBookRestPersistor }

  TBookRestPersistor = class(TInterfacedObject, IBookPersistor)
  private
    FEndpointUrl: string;
  public
    constructor Create(const AEndpointUrl: string);
    procedure Save(ABook: TBookEntity; APage: Integer = 0);
  end;

implementation

{ TBookEntity }

procedure TBookEntity.SetAuthor(const AValue: string);
begin
  FAuthor := Trim(AValue);
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

function TBookStand.HasBook: Boolean;
begin
  Result := FCurrentBook <> nil;
end;

procedure TBookStand.OpenNewBook(ABook: TBookEntity);
begin
  SetCurrentBook(ABook);
end;

procedure TBookStand.Print(APrinter: IBookPrinter; APage: Integer = 0);
begin
  if not HasBook then
    raise Exception.Create('Book not opened');
  if APrinter = nil then
    raise Exception.Create('Printer is null');
  APrinter.Print(FCurrentBook, APage);
end;

procedure TBookStand.PriorPage;
begin
  if not HasBook then
    Exit;
  if FCurrentPage <= 1 then
    Exit;
  Dec(FCurrentPage);
end;

procedure TBookStand.Save(APersistor: IBookPersistor; APage: Integer = 0);
begin
  if not HasBook then
    raise Exception.Create('Book not opened');
  if APersistor = nil then
    raise Exception.Create('Persistor is null');
  APersistor.Save(FCurrentBook, APage);
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

{ TBookHtmlPrinter }

procedure TBookHtmlPrinter.Print(ABook: TBookEntity; APage: Integer);
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

{ TBookRestPersistor }

constructor TBookRestPersistor.Create(const AEndpointUrl: string);
begin
  inherited Create;
  FEndpointUrl := AEndpointUrl;
end;

procedure TBookRestPersistor.Save(ABook: TBookEntity; APage: Integer);
begin
  // TODO
end;

end.
