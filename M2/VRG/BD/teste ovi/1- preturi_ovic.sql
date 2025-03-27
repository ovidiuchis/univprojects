if OBJECT_ID('preturi_ovic') is not null
	drop table preturi_ovic

select * 
into preturi_ovic
from preturi 

insert into preturi_ovic 
	(Cod_produs, UM, Tip_pret, Data_inferioara, Ora_inferioara, Data_superioara, Ora_superioara, Pret_vanzare, Pret_cu_amanuntul, 
		Utilizator, Data_operarii, Ora_operarii) 

select 
	po.cod_produs, 99, po.tip_pret, convert(date,GETDATE()),'', '01/01/2999','', po.pret_vanzare*4.55, po.pret_cu_amanuntul*4.55,'ovidiu',convert(date,GETDATE()),
	convert(VARCHAR(6), GETDATE(), 8)
from preturi_ovic po where po.um=1 

select * from preturi_ovic where um=99