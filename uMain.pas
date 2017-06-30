unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uClassDef, ComCtrls;

type
  TfrmMain = class(TForm)
    btnLoadIntoMemory: TButton;
    btnSaveToDatabase: TButton;
    btnLoadFromdatabase: TButton;
    btnCleanDBTables: TButton;
    btnDisplayQtyRange: TButton;
    btnDisplayQtyRangeElement: TButton;
    tvw: TTreeView;
    btnLoadTreeView: TButton;
    procedure btnLoadTreeViewClick(Sender: TObject);
    procedure btnLoadIntoMemoryClick(Sender: TObject);
    procedure btnSaveToDatabaseClick(Sender: TObject);
    procedure btnCleanDBTablesClick(Sender: TObject);
    procedure btnDisplayQtyRangeClick(Sender: TObject);
    procedure btnDisplayQtyRangeElementClick(Sender: TObject);
    procedure btnLoadFromdatabaseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRangeList:TRangeList;
    procedure DestroyRanges(ARangeList:TRangeList);
    procedure LoadRangesTreeView(ARangeList: TRangeList);
    procedure LoadRangeElementsToTreeView(RangeNode: TTreeNode;
      ARange: TRange);
    procedure LoadRangeSubElementsToTreeView(RangeElementNode: TTreeNode;
      ARangeElement: TRangeElement);
    procedure LoadDataIntoMemory(ARangeList:TRangeList);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uDM;
{$R *.dfm}

//Destroys Memory Object
procedure TfrmMain.DestroyRanges(ARangeList:TRangeList);
var
  ObjRange:TRange;
  ObjRangleElement:TRangeElement;
  ObjRangeSubElement:TRangeElement;
  iRange, iRangleElement, iRangeSubElement:Integer;
begin
  for iRange := ARangeList.Count-1 downto 0 do begin
    ObjRange := ARangeList[iRange];
    for iRangleElement := ObjRange.Elements.Count-1 downto 0 do begin
      ObjRangleElement := ObjRange.Elements[iRangleElement];
      for iRangeSubElement := ObjRangleElement.SubElements.Count-1 downto 0 do begin
        ObjRangeSubElement := ObjRangleElement.SubElements[iRangeSubElement];
        ObjRangeSubElement.Free;
      end;
      ObjRangleElement.Free;
    end;
    ObjRange.Free;
  end;
  ARangeList.Free;
end;

//Loads default data into memory
procedure TfrmMain.LoadDataIntoMemory(ARangeList:TRangeList);
var
  Index:Integer;
  Range:TRange;
  Element:TRangeElement;
begin
  if (ARangeList=Nil) then
  begin
    raise Exception.Create('Invalid Range List Object!');
    Exit;
  end;

  ARangeList.Clear();
  //Create and Add Range to Range List Object
  Index := ARangeList.Add(TRange.Create(1, 'First Dummy Range'));
  Range:= ARangeList.ItemById[1];

  //Add Elements to Range
  Range.Elements.Add(TRangeElement.Create(10000, 10));
  Range.Elements.Add(TRangeElement.Create(10001, 11));
  Range.Elements.Add(TRangeElement.Create(10002, 12));
  Range.Elements.Add(TRangeElement.Create(20000, 20));
  Range.Elements.Add(TRangeElement.Create(30000, 30));

  //Add Sub Elements to Element 10000
  Element := Range.Elements.ItemById[10000];
  Element.SubElements.Add(ARangeList[Index].Elements.ItemById[10001]);
  Element.SubElements.Add(ARangeList[Index].Elements.ItemById[10002]);

  //Add Sub Elements to Element 30000
  Element := Range.Elements.ItemById[30000];
  Element.SubElements.Add(ARangeList[Index].Elements.ItemById[10000]);
  Element.SubElements.Add(ARangeList[Index].Elements.ItemById[20000]);
end;

procedure TfrmMain.btnLoadIntoMemoryClick(Sender: TObject);
begin
  LoadDataIntoMemory(FRangeList);
  ShowMessage('Data Successfully loaded into Memroy!');
end;

procedure TfrmMain.btnSaveToDatabaseClick(Sender: TObject);
begin
  if (FRangeList=nil) then
  begin
    ShowMessage('No Data Available to save!');
    Exit;
  end;
  if not (DM.ConnectToDB) then
    Exit;
  DM.SaveToDB(FRangeList);
end;

procedure TfrmMain.btnCleanDBTablesClick(Sender: TObject);
begin
  if not (DM.ConnectToDB) then
    Exit;
  DM.CleanDB();
end;

procedure TfrmMain.btnDisplayQtyRangeClick(Sender: TObject);
var
  I:Integer;
  Msg:string;
begin
  if (FRangeList=nil) then
  begin
    ShowMessage('No Data Available to Display!');
    Exit;
  end;
  for I:=0 to FRangeList.Count-1 do begin
    Msg := 'RangeID:' + IntTOStr(FRangeList[I].Id) + ', Total Planned Quantity=' + IntToStr(FRangeList[I].GetTotalPlannedQuantity);
    ShowMessage(Msg);
  end;
end;

procedure TfrmMain.btnDisplayQtyRangeElementClick(Sender: TObject);
var
  I:Integer;
  Msg:string;
begin
  if (FRangeList=nil) then
  begin
    ShowMessage('No Data Available to Display!');
    Exit;
  end;
  for I:=0 to FRangeList[0].Elements.Count-1 do begin
    Msg := 'Element ID:' + IntTOStr(FRangeList[0].Elements[I].Id) + ', Total Planned Quantity=' + IntToStr(FRangeList[0].Elements[I].GetTotalPlannedQuantity);
    ShowMessage(Msg);
  end;
end;

procedure TfrmMain.btnLoadFromdatabaseClick(Sender: TObject);
begin
  if not (DM.ConnectToDB) then
    Exit;
  FRangeList := DM.LoadFromDB();
  LoadRangesTreeView(FRangeList);
  ShowMessage('Data Loaded Successfully!');
end;

procedure TfrmMain.LoadRangeSubElementsToTreeView(RangeElementNode:TTreeNode; ARangeElement:TRangeElement);
var
  Node:TTreeNode;
  I:Integer;
begin
  for I:=0 to ARangeElement.SubElements.Count-1 do begin
    Node := tvw.Items.AddChild(RangeElementNode, 'Sub-Element:' + IntToStr(ARangeElement.SubElements[I].Id));
  end;
end;

procedure TfrmMain.LoadRangeElementsToTreeView(RangeNode:TTreeNode; ARange:TRange);
var
  Node:TTreeNode;
  Element:TRangeElement;
  I:Integer;
begin
  for I:=0 to ARange.Elements.Count-1 do begin
    Element := ARange.Elements[I];
    Node := tvw.Items.AddChild(RangeNode, 'Element:' + IntToStr(Element.Id));
    LoadRangeSubElementsToTreeView(Node, Element);
  end;
end;

procedure TfrmMain.LoadRangesTreeView(ARangeList:TRangeList);
var
  RootNode, Node:TTreeNode;
  Range:TRange;
  I:Integer;
begin
  tvw.Items.Clear();
  RootNode := tvw.Items.AddChildFirst(Nil, 'Root-Ranges');
  for I:=0 to ARangeList.Count-1 do begin
    Range := ARangeList[I];
    Node := tvw.Items.AddChild(RootNode, 'Range:' + IntToStr(Range.Id));
    LoadRangeElementsToTreeView(Node, Range);
  end;
  tvw.FullExpand();
end;

procedure TfrmMain.btnLoadTreeViewClick(Sender: TObject);
begin
  if (FRangeList=nil) then
  begin
    ShowMessage('No Data Available to Display!');
    Exit;
  end;
  LoadRangesTreeView(FRangeList);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  FRangeList := TRangeList.Create();
  LoadDataIntoMemory(FRangeList);
  LoadRangesTreeView(FRangeList);
end;

end.
