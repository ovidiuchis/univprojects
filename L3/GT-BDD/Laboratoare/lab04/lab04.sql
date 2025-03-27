select count(*) as Students
from students
-- =150
select count(*) as Students2
from students2
-- =20

select count(*) as Students3
from students3
-- = 203

select count(*) as Students4
from students4
-- =4449



-- 1. PK PersonId in PERSONS, STUDENTS


select s.StudentId, s.Average, p.Name
from 
	STUDENTS s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1
			




-- 2. PK PersonId in PERSONS, STUDENTS2 



select s.StudentId, s.Average, p.Name
from 
	STUDENTS2 s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1
	


-- 3. PK PersonId in PERSONS, Non-clustered index on average in STUDENT 

--create index
USE [lab04db2]
GO
CREATE NONCLUSTERED INDEX [IDX_Average] ON [dbo].[STUDENTS] 
(
	[Average] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO

select s.StudentId, s.Average, p.Name
from 
	STUDENTS s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1



--delete index
USE [lab04db2]
GO
/****** Object:  Index [IDX_Average]    Script Date: 05/13/2009 17:23:59 ******/
DROP INDEX [IDX_Average] ON [dbo].[STUDENTS] WITH ( ONLINE = OFF )
GO






-- 4. PK in Persons, non cluster index on average in STUDENTS4

	-- create nonclustered index
USE [lab04db2]
GO
CREATE NONCLUSTERED INDEX [IDX_AVG] ON [dbo].[STUDENTS4] 
(
	[Average] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO

select s.StudentId, s.Average, p.Name
from 
	STUDENTS4 s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1
		



	-- delete index
USE [lab04db2]
GO
DROP INDEX [IDX_AVG] ON [dbo].[STUDENTS4] WITH ( ONLINE = OFF )
GO






--5. PK PersonId in PERSONS, Clustered index on studentId in STUDENTS 

	
	-- create clustered index on studentId
USE [lab04db2]
GO
CREATE CLUSTERED INDEX [IDX_CL_StudentId] ON [dbo].[STUDENTS] 
(
	[StudentId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO



select s.StudentId, s.Average, p.Name
from 
	STUDENTS s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1
	

--delete index

USE [lab04db2]
GO
/****** Object:  Index [IDX_CL_StudentId]    Script Date: 05/19/2009 23:31:30 ******/
DROP INDEX [IDX_CL_StudentId] ON [dbo].[STUDENTS] WITH ( ONLINE = OFF )
GO


--6. PK PersonId in PERSONS, clustered index on studentId in STUDENTS3

	
	-- create clustered index 
USE [lab04db2]
GO
CREATE CLUSTERED INDEX [IDX_CL_StudentId] ON [dbo].[STUDENTS3] 
(
	[PersonId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO

	

select s.StudentId, s.Average, p.Name
from 
	STUDENTS3 s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where   p.gender=1 and s.Average>7


-- delete index
USE [lab04db2]
GO
DROP INDEX [IDX_CL_StudentId] ON [dbo].[STUDENTS3] WITH ( ONLINE = OFF )
GO
	



-- 7. PK PersonId in PERSONS,  non clustered index on average in STUDENTS 

		-- create non clustered index
USE [lab04db2]
GO
CREATE NONCLUSTERED INDEX [IDX_Average] ON [dbo].[STUDENTS] 
(
	[Average] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO




select s.StudentId, s.Average, p.Name
from 
	STUDENTS s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1

--delete index

USE [lab04db2]
GO
/****** Object:  Index [IDX_Average]    Script Date: 05/19/2009 23:34:45 ******/
DROP INDEX [IDX_Average] ON [dbo].[STUDENTS] WITH ( ONLINE = OFF )
GO

--8. PK PersonId in PERSONS, clustered index on average and personID in STUDENTS

-- create create clustered index_Average

USE [lab04db2]
GO
CREATE CLUSTERED INDEX [IDX_CL_PersonID_Average] ON [dbo].[STUDENTS] 
(
	[Average] ASC,
	[PersonId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO


select s.StudentId, s.Average, p.Name
from 
	STUDENTS s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1


-----------
USE [lab04db2]
GO
/****** Object:  Index [IDX_CL_PersonID_Average]    Script Date: 05/19/2009 23:36:14 ******/
DROP INDEX [IDX_CL_PersonID_Average] ON [dbo].[STUDENTS] WITH ( ONLINE = OFF )
GO	


-- 9. PK PersonId, non-clustered index on gender in PERSONS

-- create non-clustered index Gender in PERSONS
USE [lab04db2]
GO
CREATE NONCLUSTERED INDEX [IDX_Gender] ON [dbo].[PERSONS] 
(
	[Gender] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO


select s.StudentId, s.Average, p.Name
from 
	STUDENTS s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1

	
---delete index

USE [lab04db2]
GO
DROP INDEX [IDX_Gender] ON [dbo].[PERSONS] WITH ( ONLINE = OFF )
GO


-- 10. PK PersonId, non-clustered index on gender in PERSONS ,STUDENTS2


	-- create non clustered index on gender in PERSONS
USE [lab04db2]
GO
CREATE NONCLUSTERED INDEX [IDX_Gender] ON [dbo].[PERSONS] 
(
	[Gender] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [PRIMARY]
GO

	
select s.StudentId, s.Average, p.Name
from 
	STUDENTS2 s
	inner join PERSONS p
		on s.PersonId=p.PersonId
where s.Average>7 and p.gender=1
	
-- delete index

USE [lab04db2]
GO
DROP INDEX [IDX_Gender] ON [dbo].[PERSONS] WITH ( ONLINE = OFF )
GO