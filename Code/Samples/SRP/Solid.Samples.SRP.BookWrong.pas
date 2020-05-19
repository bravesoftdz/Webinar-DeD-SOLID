unit Solid.Samples.SRP.BookWrong;

interface

uses
  System.SysUtils;

type

  TBook = class
  private
    FAuthor: string;
    FPage: Integer;
    FTitle: string;
    procedure SetAuthor(const AValue: string);
    procedure SetTitle(const AValue: string);
    procedure SetPage(const Value: Integer);
  public
    property Author: string read FAuthor write SetAuthor; // Entity/DTO
    property Page: Integer read FPage write SetPage; // Entity/DTO
    property Title: string read FTitle write SetTitle; // Entity/DTO
    procedure Print; // Printing
    procedure Save; // Persistence & IO
    procedure ShowPage; // UI
    procedure TurnPage; // Interaction
  end;

implementation

procedure TBook.Print;
begin
  // TODO: Send book contents to a printer.
end;

procedure TBook.SetAuthor(const AValue: string);
begin
  FAuthor := Trim(AValue);
end;

procedure TBook.SetPage(const Value: Integer);
begin
  FPage := Value;
end;

procedure TBook.SetTitle(const AValue: string);
begin
  FTitle := Trim(AValue);
end;

procedure TBook.ShowPage;
begin
  // TODO: Show current page to a device.
end;

procedure TBook.Save;
begin
  // TODO: Open database connection or output file.
  // TODO: Make some logic checks.
  // TODO: DB CRUD operations.
  // TODO: Close connection/file.
end;

procedure TBook.TurnPage;
begin
  // TODO: Fetch the next available page.
end;

end.
