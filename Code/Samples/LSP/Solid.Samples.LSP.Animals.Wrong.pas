unit Solid.Samples.LSP.Animals.Wrong;

interface

uses
  System.SysUtils;

type

  { TAnimal }

  TAnimal = class abstract
  public
    procedure MakeNoise; virtual; abstract;
  end;

  { TCat }

  TCat = class(TAnimal)
  public
    procedure MakeNoise; override;
  end;

  { TDog }

  TDog = class(TAnimal)
  public
    procedure MakeNoise; override;
  end;

  { TFish }

  TFish = class(TAnimal)
  public
    procedure MakeNoise; override;
  end;

implementation

{ TCat }

procedure TCat.MakeNoise;
begin
  Writeln('Meeeeeaaaaaoooooow!');
end;

{ TDog }

procedure TDog.MakeNoise;
begin
  Writeln('Bow wow bow wow!');
end;

{ TFish }

procedure TFish.MakeNoise;
begin
  raise Exception.Create('Cannot make any noise... :(');
end;

end.
