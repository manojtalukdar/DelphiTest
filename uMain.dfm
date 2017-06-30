object frmMain: TfrmMain
  Left = 192
  Top = 125
  Width = 492
  Height = 561
  Caption = 'Delphi Coding Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoadIntoMemory: TButton
    Left = 24
    Top = 24
    Width = 145
    Height = 25
    Caption = 'Load Data Into Memory'
    TabOrder = 0
    OnClick = btnLoadIntoMemoryClick
  end
  object btnSaveToDatabase: TButton
    Left = 24
    Top = 104
    Width = 145
    Height = 25
    Caption = 'Save Data Into Database'
    TabOrder = 2
    OnClick = btnSaveToDatabaseClick
  end
  object btnLoadFromdatabase: TButton
    Left = 24
    Top = 144
    Width = 145
    Height = 25
    Caption = 'Load Data From Database'
    TabOrder = 3
    OnClick = btnLoadFromdatabaseClick
  end
  object btnCleanDBTables: TButton
    Left = 24
    Top = 64
    Width = 145
    Height = 25
    Caption = 'Clean Database Tables'
    TabOrder = 1
    OnClick = btnCleanDBTablesClick
  end
  object btnDisplayQtyRange: TButton
    Left = 184
    Top = 24
    Width = 266
    Height = 25
    Caption = 'Display Total Planned Quantity - Range'
    TabOrder = 4
    OnClick = btnDisplayQtyRangeClick
  end
  object btnDisplayQtyRangeElement: TButton
    Left = 184
    Top = 64
    Width = 266
    Height = 25
    Caption = 'Display Total Planned Quantity - Range Element'
    TabOrder = 5
    OnClick = btnDisplayQtyRangeElementClick
  end
  object tvw: TTreeView
    Left = 24
    Top = 240
    Width = 425
    Height = 273
    Indent = 19
    TabOrder = 6
  end
  object btnLoadTreeView: TButton
    Left = 24
    Top = 208
    Width = 145
    Height = 25
    Caption = 'Display Data In TreeView'
    TabOrder = 7
    OnClick = btnLoadTreeViewClick
  end
end
