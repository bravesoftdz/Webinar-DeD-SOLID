unit Solid.Samples.ISP.Office.Wrong;

interface

uses
  System.SysUtils;

type

  { IMultifunctionalDevice }

  IMultifunctionalDevice = interface
    ['{BE447EF9-57CE-4BB1-8600-796204503774}']
    procedure Fax(Document: TObject; const ANumber: string);
    procedure Print(Document: TObject; APages: TArray<Integer>);
    procedure Scan(Document: TObject; MultiplePages: Boolean);
  end;

  { TMultifunctionalPrinter }

  TMultifunctionalPrinter = class(TInterfacedObject, IMultifunctionalDevice)
  public
    procedure Fax(Document: TObject; const ANumber: string);
    procedure Print(Document: TObject; APages: System.TArray<System.Integer>);
    procedure Scan(Document: TObject; MultiplePages: Boolean);
  end;

  { TSimplePrinter }

  TSimplePrinter = class(TInterfacedObject, IMultifunctionalDevice)
  public
    procedure Fax(Document: TObject; const ANumber: string);
    procedure Print(Document: TObject; APages: System.TArray<System.Integer>);
    procedure Scan(Document: TObject; MultiplePages: Boolean);
  end;

implementation

{ TMultifunctionalPrinter }

procedure TMultifunctionalPrinter.Fax(Document: TObject; const ANumber: string);
begin
  // TODO
end;

procedure TMultifunctionalPrinter.Print(Document: TObject;
  APages: System.TArray<System.Integer>);
begin
  // TODO
end;

procedure TMultifunctionalPrinter.Scan(Document: TObject;
  MultiplePages: Boolean);
begin
  // TODO
end;

{ TSimplePrinter }

procedure TSimplePrinter.Fax(Document: TObject; const ANumber: string);
begin
  raise ENotImplemented.Create('Not implemented');
end;

procedure TSimplePrinter.Print(Document: TObject;
  APages: System.TArray<System.Integer>);
begin
  // TODO
end;

procedure TSimplePrinter.Scan(Document: TObject; MultiplePages: Boolean);
begin
  raise ENotImplemented.Create('Not implemented');
end;

end.
