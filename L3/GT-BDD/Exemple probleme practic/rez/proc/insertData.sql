USE [rezervari]
GO
/****** Object:  StoredProcedure [dbo].[insertData]    Script Date: 06/05/2009 14:08:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertData]
AS

	declare @entries int
	set @entries=1
	while @entries<=100
	 begin
		insert into Oras (ID,name) values (@entries,'oras nr '+convert(nvarchar(10),@entries))
		set @entries=@entries+1
     end
	declare @orasID int
	declare @entr int
	declare cursorS cursor for
		select ID from Oras

	open cursorS
	fetch next from cursorS into @orasID
	set @entries=1
	while @entries <=1000
	 begin
		set @entr=1
		while @entr <=10
		 begin
			insert into Parcare (ID,parcare,OrasID) values (@entries,'parcare nr' + convert(nvarchar(10),@entries),@orasID)
			set @entries=@entries+1
			set @entr=@entr+1
		 end
		fetch next from cursorS into @orasID
	 end