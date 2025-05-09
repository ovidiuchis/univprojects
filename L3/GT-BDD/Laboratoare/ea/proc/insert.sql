USE [electronicAgenda]
GO
/****** Object:  StoredProcedure [dbo].[insertUA]    Script Date: 06/05/2009 14:06:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertUA]

AS

	/*delete from UsersAppointments
	delete from Appointments
	delete from Users*/
	
	declare @entries int
	set @entries=1
	while @entries<=100
		begin
			insert into Users (ID,name,password,NoOfShared) values (@entries,'user nr' + convert(nvarchar(10),@entries),'pass',0)
			set @entries=@entries+1
		end

	declare @entr int
	declare cursorUser cursor for
	 select ID from Users
	
	declare @UserID int
	open cursorUser
	fetch next from cursorUser into @UserID
	set @entries=1

	while @entries<=1000
		begin
			set @entr =1
			while @entr<=10
				begin
					insert into Appointments (ID,date,duration,location,subject,ownerID) 
					  values (@entries,getdate(),30,'location nr ' + convert (nvarchar(10),@entries %100),'subject nr ' + convert(nvarchar(10),@entries%300),@UserID)
					set @entries=@entries+1
					set @entr=@entr+1
				end
			fetch next from cursorUser into @UserID
		end
	close cursorUser
	deallocate cursorUser