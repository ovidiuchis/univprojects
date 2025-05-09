
create procedura scr4
as
	declare 
		@cods int, @lunaInceput int, @lunaSfarsit int , @anInceput int , @anSfarsit int , @luna int,
		@an int, @lunaSF int,@codp_i int,	@codp_o int,@codp int,
       

        @denumire varchar(30),@produs varchar(30),
		@exista bit,
		
	
		@dataAux smalldatetime,@data smalldatetime,@data_o	smalldatetime,@data_i smalldatetime,
		
		
		@pret decimal(10,2),@cant_i decimal(10,2),@cant_o decimal(10,2),@cantitate_o decimal(10,2),
		@cantitate_i decimal(10,2),@val_i decimal(10,2),@val_o decimal(10,2),@cant_init decimal(10,2)

	declare cgest cursor for select cods,denumire from SistemeCE
	if exists(select name from sysobjects where name='Stocuri')
		drop table Stocuri

	create table Stocuri (
			cods int, luna int,an int,idp int,cant_i decimal(10,2), 
			val_i decimal(10,2), cant_o decimal(10,2), val_o decimal(10,2))
	set nocount on
	open cgest

	fetch next from cgest into @cods,@denumire
	
	while @@fetch_status=0 
      begin  --cea mai mica data ....prima pentru cods sa nimic....
		set @dataAux = (select top 1 data from tranzactii where cods_dela=@cods or cods_la=@cods order by data asc)
		if @dataAux is null 
        begin
			print ''
			print convert(varchar(5),@cods)+' '+@denumire+' ** Nu s-au efectuat tranzactii'
		end
		else begin
			set @lunaInceput = month(@dataAux)
			set @anInceput = year(@dataAux)  
       --ultima data cea  mai recenta cu tranzactie sau fara 
			set @dataAux = (select top 1 data from tranzactii where cods_dela=@cods or cods_la=@cods order by data desc)
			set @lunaSfarsit = month(@dataAux)
			set @anSfarsit = year(@dataAux)
			print ''
			print convert(varchar(5),@cods)+' '+@denumire+': lunaInceput '+convert(varchar(5),@lunaInceput)+
					' anInceput '+convert(varchar(5),@anInceput)+' lunaSfarsit '+convert(varchar(5),@lunaSfarsit)
					+' anSfarsit '+convert(varchar(5),@anSfarsit)
			set @luna=@lunaInceput
			set @an=@anInceput
			
			while @an<=@anSfarsit begin
				print '     Anul:'+convert(varchar(5),@an)
				if @an=@anSfarsit    
					set @lunaSF=@lunaSfarsit  --ultimq luna pt tranz
				else
					set @lunaSF=12   
				
				if @an=@anInceput
					set @luna=@lunaInceput  --prima tranz din an
				else
					set @luna=1

				while @luna<=@lunaSF begin --luna inceput < luna sf tr
					declare cursorLuna cursor for select distinct codp from tranzactii where month(data)=@luna and
						year(data)=@an and (cods_dela=@cods or cods_la=@cods)
					open cursorLuna
					fetch next from cursorLuna into @codp
					
					set @exista=0
					if @@fetch_status=0 --citesc ,am tr
                        begin
						print '          Luna:'+convert(varchar(5),@luna)
					
                        print '                                                                         '						
                    set @exista=1
					end
					else
						print '          Luna:'+convert(varchar(5),@luna) + ' - Nu exista tranzactii'
			
					while @@fetch_status=0 begin
						set @cant_i=(select sum(cantitate) from tranzactii where cods_la=@cods and codp=@codp
									 and year(data)=@an and month(data)=@luna)
						set @cant_o=(select sum(cantitate) from tranzactii where cods_dela=@cods and codp=@codp
									 and year(data)=@an and month(data)=@luna)
						
						set @produs=(select produs from produse where codp=@codp)
						if @cant_i is null 
							set @cant_i=0
						if @cant_o is null
							set @cant_o=0
						set @cant_init=(select sum(case when cods_la=@cods then
															cantitate
														when cods_dela=@cods then
															-cantitate
														else 
															0
													end) from tranzactii where
							data<convert(smalldatetime,'01.'+convert(varchar(2),@luna)+'.'+convert(varchar(4),@an)) and
							(cods_dela=@cods or cods_la=@cods))
	
						if @cant_init is null
							set @cant_init = 0
					
						declare cursor_la cursor for select data,codp,cantitate from tranzactii where month(data)=@luna and
							year(data)=@an and cods_la=@cods and codp=@codp
						declare cursor_dela cursor for select data,codp,cantitate from tranzactii where month(data)=@luna and
							year(data)=@an and cods_dela=@cods and codp=@codp

						open cursor_la
						fetch next from cursor_la into @data_i,@codp_i,@cantitate_i
						set @val_i=0
						while @@fetch_status=0 begin
							set @pret=(select top 1 pret from catalog where codp=@codp_i and 
								data<=@data_i order by data desc)
							set @val_i=@val_i+@cantitate_i*@pret
							fetch next from cursor_la into @data_i,@codp_i,@cantitate_i
						end
						close cursor_la
						deallocate cursor_la
					
						open cursor_dela
						fetch next from cursor_dela into @data_o,@codp_o,@cantitate_o
						set @val_o=0
						while @@fetch_status=0 begin
							set @pret=(select top 1 pret from catalog where codp=@codp_o and 
								data<=@data_o order by data desc)
							set @val_o=@val_o+@cantitate_o*@pret
							fetch next from cursor_dela into @data_o,@codp_o,@cantitate_o
						end
						close cursor_dela
						deallocate cursor_dela
						

						print '               '+convert(char(5),@codp)+convert(char(15),@produs)+convert(char(10),@cant_init)
						+convert(char(10),@cant_i)+convert(char(10),@val_i)+convert(char(10),@cant_o)+convert(char(10),@val_o)
						insert into stocuri(cods,luna,an,idp,cant_i,val_i,cant_o,val_o)
							values (@cods,@luna,@an,@codp,@cant_i,@val_i,@cant_o,@val_o)


						fetch next from cursorLuna into @codp
					end
					close cursorLuna
					deallocate cursorLuna
					set @luna=@luna+1
				end
				set @an=@an+1
			end		
		end
		fetch next from cgest into @cods,@denumire
	end
	close cgest
	deallocate cgest
	

