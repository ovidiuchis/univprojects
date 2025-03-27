IF OBJECT_ID('Persoane') is NOT NULL
	drop TABLE Persoane

CREATE TABLE [dbo].[Persoane](
      [ID] [int] IDENTITY(1,1) PRIMARY KEY,
      [Nume] [varchar](100) NOT NULL,
      [Parinte] [int] NULL,
      [Stanga] [int] NULL,
      [Dreapta] [int] NULL,
      [HID] [hierarchyid] NULL,
      [Nivel]  AS ([HID].[GetLevel]()))
GO
CREATE NONCLUSTERED INDEX [IDX_Adjacency] ON [dbo].[Persoane]
(
      [Parinte] ASC
)
INCLUDE ( [Nume]);
GO
CREATE NONCLUSTERED INDEX [IDX_HID] ON [dbo].[Persoane]
(
      [HID] ASC
)
INCLUDE ( [Nume]);

GO
CREATE NONCLUSTERED INDEX [IDX_NestedSets] ON [dbo].[Persoane]
(
      [Stanga] ASC,
      [Dreapta] ASC
)
INCLUDE ( [Nume]);
GO
ALTER TABLE [dbo].[Persoane]  WITH CHECK 
 ADD FOREIGN KEY([Parinte])
  REFERENCES [dbo].[Persoane] ([ID]);
GO
ALTER TABLE [dbo].[Persoane]  WITH CHECK 
 ADD  CONSTRAINT [CK_Range]
  CHECK  (([Stanga] IS NULL OR [Dreapta] IS NULL OR [Dreapta]>=[Stanga]));
GO
ALTER TABLE [dbo].[Persoane] CHECK CONSTRAINT [CK_Range];
GO

IF OBJECT_ID('Numbers') is NOT NULL
	drop TABLE Numbers


CREATE TABLE dbo.Numbers (
      Number INT PRIMARY KEY);
GO

/**Pt a crea date mai tarziu **/

INSERT INTO dbo.Numbers (Number)
 SELECT TOP 10000 ROW_NUMBER() OVER (ORDER BY T1.object_id)
 FROM sys.all_columns AS T1
  CROSS JOIN sys.all_columns AS T2;