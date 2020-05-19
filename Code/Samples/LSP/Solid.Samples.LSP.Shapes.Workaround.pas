unit Solid.Samples.LSP.Shapes.Workaround;

interface

type

  { TRectangle }

  TRectangle = class
  private
    FHeight: Integer;
    FWidth: Integer;
    FLeft: Integer;
    FTop: Integer;
  protected
    procedure SetHeight(AValue: Integer); virtual;
    procedure SetWidth(AValue: Integer); virtual;
  public
    property Height: Integer read FHeight write SetHeight;
    property Width: Integer read FWidth write SetWidth;
    property Left: Integer read FLeft write FLeft;
    property Top: Integer read FTop write FTop;
  end;

  { TSquare }

  TSquare = class(TRectangle)
  protected
    procedure SetHeight(AValue: Integer); override;
    procedure SetWidth(AValue: Integer); override;
  end;

implementation

{ TRectangle }

procedure TRectangle.SetHeight(AValue: Integer);
begin
  FHeight := AValue;
end;

procedure TRectangle.SetWidth(AValue: Integer);
begin
  FWidth := AValue;
end;

{ TSquare }

procedure TSquare.SetHeight(AValue: Integer);
begin
  inherited SetHeight(AValue);
  inherited SetWidth(AValue);
end;

procedure TSquare.SetWidth(AValue: Integer);
begin
  inherited SetWidth(AValue);
  inherited SetHeight(AValue);
end;

end.
