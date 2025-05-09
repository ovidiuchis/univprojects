USE [rezervari]
GO
/****** Object:  StoredProcedure [dbo].[updateRezervari]    Script Date: 06/05/2009 14:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateRezervari]
	@Type nvarchar(50)
AS
	declare @MasinaID int
	declare @ParcareID int
	declare cursors cursor for
	select Masina.ID,ParcareID from Masina 
	inner join Rezervare on Masina.ID=Rezervare.MasinaID
	where Masina.Type=@Type
	
	open cursors
	fetch next from cursors into @MasinaID,@ParcareID	
	while (@@FETCH_STATUS =0)
	 begin
		declare @date datetime
		select @date=EndDate from Rezervare where MasinaID=@MasinaID AND ParcareID=@ParcareID
		update Rezervare set EndDate = DateADD(MINUTE,30,@date) where MasinaID=@MasinaID AND ParcareID=@ParcareID
		fetch next from cursors into @MasinaID,@ParcareID
	 end
	close cursors
	deallocate cursors
	
	