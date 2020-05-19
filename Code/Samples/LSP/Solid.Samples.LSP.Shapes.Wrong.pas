unit Solid.Samples.LSP.Shapes.Wrong;

interface

type

  TRectangle = class
  private
    FHeight: Integer;
    FWidth: Integer;
    FLeft: Integer;
    FTop: Integer;
  public
    property Height: Integer read FHeight write FHeight;
    property Width: Integer read FWidth write FWidth;
    property Left: Integer read FLeft write FLeft;
    property Top: Integer read FTop write FTop;
  end;

  TSquare = class (TRectangle)
  public
    // ?
  end;

implementation

end.
