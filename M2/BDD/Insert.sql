TRUNCATE TABLE dbo.Persoane;

INSERT INTO Persoane (Nume,Parinte,Stanga,Dreapta,HID)
VALUES  ('Ovidiu', null, 1, 6, hierarchyid::GetRoot()  
        );
INSERT INTO Persoane  (Nume,Parinte,Stanga,Dreapta,HID)
SELECT 
	'Adrian',1,2,3,CAST('/1/' AS HIERARCHYID)
UNION ALL
SELECT 
	'Vlad',1, 4, 5, CAST('/2/' AS HIERARCHYID) 

SELECT *, HID.ToString() AS HierarchyString
 FROM dbo.Persoane
 ORDER BY HID;
