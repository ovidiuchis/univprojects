/** Citire HID **/
DECLARE @HID HIERARCHYID 
SELECT
	@HID = HID FROM dbo.Persoane WHERE ID = 2

SET STATISTICS IO, TIME ON;
SELECT  HID, Nume
 FROM    Persoane
 WHERE   HID.IsDescendantOf(@HID) = 1 ;

SET STATISTICS IO, TIME OFF;


/** Update HID **/
DECLARE 
	@HID2 VARCHAR(MAX), @HID3 VARCHAR(MAX), @IDString VARCHAR(10), @ID INT = 12, @NOU int


SELECT  
	@HID = HID, @HID2 = HID.ToString(), @IDString = ID, @NOU=30
FROM    dbo.Persoane
WHERE   ID = @ID ;

SELECT  
	@HID3 = HID.ToString() + @IDString + '/'
FROM dbo.Persoane
WHERE   ID = @NOU ;

begin tran
SET NOCOUNT ON
SET STATISTICS IO, TIME ON;

UPDATE  dbo.Persoane
SET     HID = CAST(REPLACE(HID.ToString(), @HID2, @HID3) AS HIERARCHYID)
WHERE   HID.IsDescendantOf(@HID) = 1 ;

ROLLBACK tran
SET STATISTICS IO, TIME OFF;

