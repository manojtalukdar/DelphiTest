Use Pratik
CREATE TABLE Range(Range_ID	INTEGER, Description VARCHAR(30))
CREATE TABLE RangeElement (Range_ID INTEGER, Element_ID	INTEGER, Description VARCHAR(30), SizeDesc VARCHAR(10), ColourDesc	VARCHAR(10), Quantity INTEGER)
CREATE TABLE RangeSubElement (Range_ID INTEGER, Element_ID INTEGER, SubElement_ID INTEGER)

INSERT INTO RANGE(Range_ID,Description) VALUES (1, 'ONE')
INSERT INTO RangeElement(Range_ID, Element_ID, Quantity) VALUES (1, 1, 100)
INSERT INTO RangeSubElement(Range_ID, Element_ID, SubElement_ID) VALUES (1, 10, 100)

TRUNCATE TABLE [Range]
TRUNCATE TABLE [RangeElement]
TRUNCATE TABLE [RangeSubElement]


SELECT * FROM Range
SELECT * FROM RangeElement
SELECT * FROM RangeSubElement
