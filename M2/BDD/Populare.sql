TRUNCATE TABLE dbo.Persoane;
GO
INSERT INTO dbo.Persoane
        (Nume,
         parinte,
         Stanga,
         Dreapta,
         HID
        )
 SELECT TOP 2000
    'Individul ' + RIGHT('0000' + CAST(Number AS VARCHAR(4)), 4),
    NULL, NULL, NULL, NULL
  FROM dbo.Numbers;
GO
UPDATE dbo.Persoane
 SET parinte = ID / 10 + ID % 10
 WHERE ID > 10;
GO
;
WITH    Hierarchy(ID, PID, Lvl, Pth)
          AS (SELECT    ID,
                        NULL,
                        0,
                        '/' + CAST(ID AS VARCHAR(MAX)) + '/'
              FROM      dbo.Persoane
              WHERE     parinte IS NULL
              UNION ALL
              SELECT    HSub.ID,
                        HSub.parinte,
                        Hierarchy.Lvl + 1,
                        Hierarchy.Pth + CAST(HSub.ID AS VARCHAR(MAX)) + '/'
              FROM      dbo.Persoane AS HSub
                        INNER JOIN Hierarchy
                            ON HSub.parinte = Hierarchy.ID),
        Bottom
          AS (SELECT    ID,
                        Pth,
                        ROW_NUMBER() OVER (ORDER BY Pth) * 10 AS RS
              FROM      Hierarchy
              WHERE     ID NOT IN (SELECT   parinte
                                   FROM     dbo.Persoane
                                   WHERE    parinte IS NOT NULL))
    MERGE dbo.Persoane AS H
        USING
            (SELECT Hierarchy.ID AS RangeID,
                    CAST(Hierarchy.Pth AS HIERARCHYID) AS HID,
                    MIN(RS) AS RS,
                    MAX(RS) AS RE
             FROM   Bottom
                    INNER JOIN Hierarchy
                        ON Bottom.Pth LIKE Hierarchy.Pth + '%'
             GROUP BY Hierarchy.ID, Hierarchy.Pth) AS Ranges
        ON H.ID = Ranges.RangeID
        WHEN MATCHED
            THEN UPDATE
               SET      H.Stanga = Ranges.RS,
                        H.Dreapta = Ranges.RE + 9,
                        H.HID = Ranges.HID ;
GO
;
WITH    CTE
          AS (SELECT    ID,
                        ROW_NUMBER() OVER (ORDER BY HT1.HID) AS R
              FROM      dbo.Persoane AS HT1
              WHERE     Stanga IS NULL
                        AND Dreapta IS NULL
                        AND NOT EXISTS ( SELECT *
                                         FROM   dbo.Persoane AS HT2
                                         WHERE  HT2.parinte = HT1.ID ))
    UPDATE  Tgt
    SET     Stanga = R,
            Dreapta = R
    FROM    dbo.Persoane AS Tgt
            INNER JOIN CTE
                ON CTE.ID = Tgt.ID ;

WHILE @@ROWCOUNT > 0
    BEGIN
        WITH CTE
          AS (SELECT    
		         HT1.ID,
                 MIN(HT2.Stanga) AS RS,
                 MAX(HT2.Dreapta) AS RE
               FROM dbo.Persoane AS HT1
                INNER JOIN dbo.Persoane AS HT2
                  ON HT1.ID = HT2.parinte
               WHERE HT1.Stanga IS NULL
                 AND HT1.Dreapta IS NULL
                 AND HT2.Stanga IS NOT NULL
                 AND HT2.Dreapta IS NOT NULL
               GROUP BY  HT1.ID)
      UPDATE  Tgt
       SET    Stanga = CTE.RS,
              Dreapta = CTE.RE
      FROM    dbo.Persoane AS Tgt
       INNER JOIN CTE
        ON Tgt.ID = CTE.ID ;
    END ;