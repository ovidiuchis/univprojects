/** Citire nested sets **/

SET STATISTICS TIME, IO ON;
DECLARE @stanga INT, @dreapta INT ;

SELECT  
	@stanga = stanga, @dreapta = dreapta
 FROM  Persoane WHERE  ID = 2 

SELECT  
	stanga, dreapta, nume
FROM    Persoane
WHERE   stanga BETWEEN @stanga AND @dreapta ;
SET STATISTICS TIME, IO OFF;