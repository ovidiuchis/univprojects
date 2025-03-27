
T1. 

create trigger trigg1 on Produse
	instead of insert as
	declare @cod int
	declare @den nvarchar(20)
	declare @um nvarchar(2)

	if (select count(*) from inserted)>1
		raiserror('Eroare prea multe',7,21)
	else
		if ( (select codp from inserted) = '' )
			raiserror('Eroare nume vid',7,21)
		else		
				begin
					insert into Produse select * from inserted
				end
				


 TEST 
 
select * from Produse
insert into Produse select 4,'produs4','kg' union all select 5,'produs5','kg'
insert into Produse values (5,'produs4','kg')
insert into Produse values (7,'','kg')
insert into Produse values (8,'bla bla','kg')



T2. 


drop trigger trigg2

create trigger trigg2 on Catalog
instead of insert,update as
declare @s nvarchar(40)
set @s=''
declare @cod int
declare @data datetime
declare @cods int
declare @pret int

declare @codd int
declare @datad datetime
declare @codss int
declare @pretd int


declare c cursor for select * from inserted
declare cc cursor for select * from deleted
open c
open cc
fetch next from cc into @codd,@codss,@datad,@pretd
fetch next from c into @cod,@cods,@data,@pret
while @@fetch_status=0
	begin
		
		if (not exists  (select * from tranzactii where codP=@cod having max(data)>@data))
			begin
			
			print 'avem voie'
--		avem voie sa facem adaugarea/modificarea
			
			declare @pret_vechi int
    		set @pret_vechi=(select top 1 pret from catalog where codP=@cod and data<@data order by data desc)
	
			
			if (@pret=@pret_vechi)
				if ((select count(*) from deleted)>0)
					delete from Catalog where codP=@codD and data=@datad and pret=@pretd
				else 
					begin
					print 'e insert'
					set @s=@s+@cod
					set @s=@s+(select produs from Produse where codP=@cod)
					end
			else
				-- putem efectua operatia
				if ((select count(*) from deleted)>0)
					update Catalog set codP=@cod,cods=@cods,data=@data,pret=@pret where codP=@codD and cods=@cods and data=@datad and pret=@pretd
				else
					insert into Catalog values (@cod,@cods,@data,@pret)
			end
		else
			begin
			set @s=@s+@cod+ ' '
			set @s=@s+(select produs from Produse where codP=@cod)
			raiserror('interzis..exista operatii la acea data',7,21)
			end
	

	fetch next from cc into @codd,@codss,@datad,@pretd
	fetch next from c into @cod,@cods,@data,@pret
	end
close c
deallocate c
close cc
deallocate cc
print @s



select * from catalog where codP=1

select * from tranzactii where codP=1



insert into Catalog values (1,2,'2010-07-25',560)


insert into Catalog values (1,2,'2010-07-25',50)

insert into Catalog values (1,1,'2008-09-25',560)
insert into Catalog select 1,1,'2010-07-25',560 union all select 1,1,'2008-09-25',5

update Catalog set pret=645 where codP=1 and cods=2 and data='2008-09-25'
update Catalog set pret=563 where codP=1 and cods=1 and data='2009-04-07'


update Catalog set pret=60 where codP=1 and data='2009-04-07'


update Catalog set pret=50 where codP=1 and cods=1 and data='2010-07-25'
update Catalog set pret=100 where codP=1 and cods=1 and data='2010-07-25'





select * from Catalog where codP=1


select * from tranzactii where codP=1 order by data
select * from tranzactii where codP=3





T3.

create trigger trig on Test
	instead of delete as
	declare @codc int
	declare @nrd int
    declare @id int
    declare @nr int
    declare @ok int
	 
	set @ok=1
	declare crs cursor for select codc,count(*) from deleted group by codc
	open crs
    fetch next from crs into @id,@nr
	while @@fetch_status=0 
		begin
			 set @nrd = (select count(*) from tranzactii where codc=@id )
			 if (@nrd=@nr)
				begin
					raiserror('Eroare client',7,21)
					set @ok=0
				end
			fetch next from crs into @id,@nr
		end
	if (@ok=1)
		delete from tranzactii where codc in (select codc from deleted)
	close crs
	deallocate crs


