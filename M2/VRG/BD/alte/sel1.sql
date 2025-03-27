select	
	*
from pozdoc where subunitate='1' and tip='RM' AND cod NOT in (select top 10 cod from nomencl order by NEWID())