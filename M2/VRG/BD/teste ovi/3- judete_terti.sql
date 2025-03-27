select
	t.Judet judet, count(1) nrTerti
from terti t
where t.Subunitate='1' and LEN(t.judet)=2 and ISNUMERIC(t.judet)=0
group by t.judet
having count(1)>=1000
order by 2 desc