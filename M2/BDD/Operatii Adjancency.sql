/** Citire Adjancency **/

;WITH    ArborePers(ID, Parinte)
AS (
	SELECT    2, NULL
    UNION ALL
    SELECT    H.ID,H.Parinte
    FROM      Persoane  H
    INNER JOIN ArborePers ON H.Parinte= ArborePers.ID
)
SELECT  HT.ID, HT.Parinte, HT.Nume

FROM    Persoane AS HT
INNER JOIN ArborePers  ON HT.ID = ArborePers.ID 

/** Update adjancency **/
DECLARE 
	@ID INT = 12, @NOU int=30
begin tran

SET STATISTICS IO, TIME ON;

UPDATE  dbo.Persoane
 SET    Parinte = @nou
 WHERE  ID = @ID ;

SET STATISTICS IO, TIME OFF;

ROLLBACK tran