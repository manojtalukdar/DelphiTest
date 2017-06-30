object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 266
  Top = 125
  Height = 312
  Width = 658
  object Con: TADOConnection
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object qryInsertRange: TADOQuery
    Connection = Con
    Parameters = <
      item
        Name = 'RangeID'
        Size = -1
        Value = Null
      end
      item
        Name = 'Description'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO RANGE'
      '(Range_ID,Description)'
      'VALUES'
      '(:RangeID, :Description)')
    Left = 176
    Top = 24
  end
  object qryInsertRangeElement: TADOQuery
    Connection = Con
    Parameters = <
      item
        Name = 'RangeID'
        Size = -1
        Value = Null
      end
      item
        Name = 'ElementID'
        Size = -1
        Value = Null
      end
      item
        Name = 'Quantity'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO RangeElement'
      '(Range_ID, Element_ID, Quantity) '
      'VALUES '
      '(:RangeID, :ElementID, :Quantity)')
    Left = 344
    Top = 24
  end
  object qryInsertRangeSubElement: TADOQuery
    Connection = Con
    Parameters = <
      item
        Name = 'RangeID'
        Size = -1
        Value = Null
      end
      item
        Name = 'ElementID'
        Size = -1
        Value = Null
      end
      item
        Name = 'SubElementID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO RangeSubElement'
      '(Range_ID, Element_ID, SubElement_ID) '
      'VALUES '
      '(:RangeID, :ElementID, :SubElementID)')
    Left = 504
    Top = 24
  end
  object qryDeleteRange: TADOQuery
    Connection = Con
    Parameters = <>
    SQL.Strings = (
      'TRUNCATE TABLE [Range]')
    Left = 176
    Top = 96
  end
  object qryDeleteRangeElement: TADOQuery
    Connection = Con
    Parameters = <>
    SQL.Strings = (
      'TRUNCATE TABLE [RangeElement]')
    Left = 344
    Top = 96
  end
  object qryDeleteRangeSubElement: TADOQuery
    Connection = Con
    Parameters = <>
    SQL.Strings = (
      'TRUNCATE TABLE [RangeSubElement]'
      '')
    Left = 504
    Top = 96
  end
  object qryGetRange: TADOQuery
    Connection = Con
    Parameters = <>
    SQL.Strings = (
      'SELECT * '
      'FROM RANGE '
      'ORDER BY RANGE_ID')
    Left = 176
    Top = 176
  end
  object qryGetRangeElement: TADOQuery
    Connection = Con
    Parameters = <
      item
        Name = 'RangeID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM RangeElement '
      'WHERE Range_ID =:RangeID'
      'ORDER BY Range_ID, Element_ID')
    Left = 344
    Top = 176
  end
  object qryGetRangeSubElement: TADOQuery
    Connection = Con
    Parameters = <
      item
        Name = 'RangeID'
        Size = -1
        Value = Null
      end
      item
        Name = 'ElementID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM RangeSubElement '
      'WHERE Range_ID =:RangeID AND Element_ID =:ElementID'
      'ORDER BY Range_ID, Element_ID, SubElement_ID')
    Left = 504
    Top = 176
  end
end
