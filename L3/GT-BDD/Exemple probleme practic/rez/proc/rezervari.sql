USE [rezervari]
GO
/****** Object:  StoredProcedure [dbo].[rezervari]    Script Date: 06/05/2009 14:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rezervari] 
	@MasinaID int,
	@ParcareID int
AS
	declare @ok nvarchar(100)
	set @ok=dbo.verify(@MasinaID,@ParcareID)
	if(@ok=1)
	 begin 
		declare @date datetime
		select @date=EndDate from Rezervare where MasinaID=@MasinaID AND ParcareID=@ParcareID
		update Rezervare set EndDate = DateADD(MINUTE,10,@date) where MasinaID=@MasinaID AND ParcareID=@ParcareID
	 end
	else
	  begin
		declare @ss datetime
		set @ss=getdate()
		insert into Rezervare (MasinaID,ParcareID,StartDate,EndDate) values (@MasinaID,@ParcareID,getDate(),DateAdd(MINUTE,20,@ss) )
	 end