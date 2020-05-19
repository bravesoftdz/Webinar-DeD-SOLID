unit Solid.Samples.ISP.Office.Ok;

interface

type

  { IFaxDevice }

  IFaxDevice = interface
    ['{344C94E0-8962-409C-AC88-FCE9B4068073}']
    procedure Fax(Document: TObject; const ANumber: string);
  end;

  { IPrinterDevice }

  IPrinterDevice = interface
    ['{FE0FC77A-1A22-452B-9813-3C5D7F01485D}']
    procedure Print(Document: TObject; APages: TArray<Integer>);
  end;

  { IScannerDevice }

  IScannerDevice = interface
    ['{8FA35D73-9FED-4F83-B27C-4F133427B905}']
    procedure Scan(Document: TObject; MultiplePages: Boolean);
  end;

  { TModemFax }

  TModemFax = class(TInterfacedObject, IFaxDevice)
  public
    procedure Fax(Document: TObject; const ANumber: string);
  end;

  { TSimplePrinter }

  TSimplePrinter = class(TInterfacedObject, IPrinterDevice)
  public
    procedure Print(Document: TObject; APages: System.TArray<System.Integer>);
  end;

  { THighDpiScanner }

  THighDpiScanner = class(TInterfacedObject, IScannerDevice)
  public
    procedure Scan(Document: TObject; MultiplePages: Boolean);
  end;

  { TMultifunctionalPrinter }

  TMultifunctionalPrinter = class(TInterfacedObject,
    IFaxDevice, IPrinterDevice, IScannerDevice)
  public
    procedure Fax(Document: TObject; const ANumber: string);
    procedure Print(Document: TObject; APages: System.TArray<System.Integer>);
    procedure Scan(Document: TObject; MultiplePages: Boolean);
  end;

implementation

{ TModemFax }

procedure TModemFax.Fax(Document: TObject; const ANumber: string);
begin
  // TODO
end;

{ TSimplePrinter }

procedure TSimplePrinter.Print(Document: TObject;
  APages: System.TArray<System.Integer>);
begin
  // TODO
end;

{ THighDpiScanner }

procedure THighDpiScanner.Scan(Document: TObject; MultiplePages: Boolean);
begin
  // TODO
end;

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

end.
