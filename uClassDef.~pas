unit uClassDef;

interface

uses
  Variants, Classes;

type

TRangeElementList=class;

//Class to hold the information of individual Range Element
TRangeElement=class(TObject)
private
  FId:Integer;
  FDescription:string;
  FSizeDescription:string;
  FColorDescription:string;
  FQuantity:Integer;
  function CalcTotalPlannedQuantity(const ARangeElement:TRangeElement; var TotalQuantity:Integer):Integer;
protected
public
  SubElements:TRangeElementList;
  function HasSubElements():Boolean;
  function GetTotalPlannedQuantity():Integer;
  constructor Create;overload;
  constructor Create(const aId: Integer);overload;
  constructor Create(const aId:Integer; aQuantity:Integer);overload;
  destructor Destroy;override;
published
  property Id:Integer read FId write FId;
  property Description:string read FDescription write FDescription;
  property SizeDescription:string read FSizeDescription write FSizeDescription;
  property ColorDescription:string read FColorDescription write FColorDescription;
  property Quantity:Integer read FQuantity write FQuantity;
end;

//Class to hold the information of List of Range Elements
TRangeElementList=class(TList)
private
protected
  function Get(Index:Integer):TRangeElement;
  function GetById(aId:Integer):TRangeElement;
public
  property Items[Index:Integer]:TRangeElement read Get; default;
  property ItemById[Id:Integer]:TRangeElement read GetById;
  function Add(ARangeElement:TRangeElement):Integer;
  procedure Insert(Index:Integer; ARangeElement:TRangeElement);
  constructor Create;overload;
  destructor Destroy;override;
published
end;

//Class to hold the information of individual Range
TRange=class(TObject)
private
  FId:Integer;
  FDescription:string;
protected
public
  Elements:TRangeElementList;
  function HasElements():Boolean;
  function GetTotalPlannedQuantity():Integer;overload;
  function GetTotalPlannedQuantity(ARangeElement:TRangeElement):Integer;overload;
  constructor Create;overload;
  constructor Create(aID:Integer; aDescription:string);overload;
  destructor Destroy;override;
published
  property Id:Integer read FId write FId;
  property Description:string read FDescription write FDescription;
end;

//Class to hold the information of List of Ranges
TRangeList=class(TList)
private
protected
  function Get(Index:Integer):TRange;
  function GetById(aId:Integer):TRange;
public
  property Items[Index:Integer]:TRange read Get; default;
  property ItemById[Id:Integer]:TRange read GetById;
  function Add(ARange:TRange):Integer;
  procedure Insert(Index:Integer; ARange:TRange);
  constructor Create;overload;
  destructor Destroy;override;
published
end;

implementation

uses MaskUtils, SysUtils;

{ TRangeElement }
constructor TRangeElement.Create;
begin
  Create(0);
end;

constructor TRangeElement.Create(const aId: Integer);
begin
  Create(0, 0);
end;

constructor TRangeElement.Create(const aId: Integer; aQuantity: Integer);
begin
  FId := aId;
  FQuantity := aQuantity;
  SubElements := TRangeElementList.Create();
end;

destructor TRangeElement.Destroy;
var
  I:Integer;
begin
  for I:=SubElements.Count-1 downto 0 do begin
    SubElements[I].Free;
  end;
  inherited;
end;

function TRangeElement.CalcTotalPlannedQuantity(const ARangeElement: TRangeElement; var TotalQuantity:Integer): Integer;
var
  I:Integer;
begin
  TotalQuantity := TotalQuantity + ARangeElement.Quantity;
  for I:=0 to ARangeElement.SubElements.Count-1 do begin
    CalcTotalPlannedQuantity(ARangeElement.SubElements[I], TotalQuantity)
  end;
end;

function TRangeElement.GetTotalPlannedQuantity: Integer;
var
  TotalQuantity:Integer;
begin
  TotalQuantity:=0;
  CalcTotalPlannedQuantity(Self, TotalQuantity);
  Result := TotalQuantity;
end;

function TRangeElement.HasSubElements: Boolean;
begin
  Result := (SubElements.Count>0);
end;

{ TRangeElementList }
constructor TRangeElementList.Create;
begin
  //
end;

function TRangeElementList.Add(ARangeElement: TRangeElement): Integer;
begin
  Result := inherited Add(ARangeElement);
end;

destructor TRangeElementList.Destroy;
begin
  //
  inherited;
end;

function TRangeElementList.Get(Index: Integer): TRangeElement;
begin
  Result := TRangeElement(inherited Get(Index));
end;

procedure TRangeElementList.Insert(Index: Integer; ARangeElement: TRangeElement);
begin
  inherited Insert(Index, ARangeElement);
end;

function TRangeElementList.GetById(aId: Integer): TRangeElement;
var
  I:Integer;
begin
  Result := nil;
  for I:=0 to Self.Count-1 do begin
    if (Self[I].Id = aId) then
    begin
      Result := Self[I];
      Break;
    end;
  end;
end;

{ TRange }
constructor TRange.Create;
begin
  Create(0,'');
end;

constructor TRange.Create(aID: Integer; aDescription: string);
begin
  FId := aID;
  FDescription := aDescription;
  Elements := TRangeElementList.Create();
end;

destructor TRange.Destroy;
var
  I:Integer;
begin
  for I:=Elements.Count-1 downto 0 do begin
    Elements[I].Free;
  end;
  inherited;
end;

function TRange.GetTotalPlannedQuantity: Integer;
var
  I:Integer;
begin
  Result := 0;
  for I:=0 to Elements.Count -1 do begin
    Result := Result + Elements[I].GetTotalPlannedQuantity();
  end;
end;

function TRange.GetTotalPlannedQuantity(ARangeElement: TRangeElement): Integer;
begin
  Result := ARangeElement.GetTotalPlannedQuantity();
end;

function TRange.HasElements: Boolean;
begin
  Result := (Elements.Count>0);
end;

{ TRangeList }
constructor TRangeList.Create;
begin
  //
end;

destructor TRangeList.Destroy;
begin
  //
  inherited;
end;

function TRangeList.Get(Index: Integer): TRange;
begin
  Result := TRange(inherited Get(Index));
end;

function TRangeList.Add(ARange: TRange): Integer;
begin
  Result := inherited Add(ARange);
end;

procedure TRangeList.Insert(Index: Integer; ARange: TRange);
begin
  inherited Insert(Index, ARange);
end;

function TRangeList.GetById(aId: Integer): TRange;
var
  I:Integer;
begin
  Result := nil;
  for I:=0 to Self.Count -1 do begin
    if (Self[I].Id = aId) then
    begin
      Result := Self[I];
      Break;
    end;
  end;
end;

end.
