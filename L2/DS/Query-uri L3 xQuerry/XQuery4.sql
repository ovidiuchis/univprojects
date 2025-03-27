select xml.query('
<rez>
{
  for $c in /librarie/carti//carte
   where some $f in $c//filiala satisfies $f/@codf= /librarie/filiale//filiala[denumire/text()="Universitatii"]/codf
         and
         some $f in $c//filiala satisfies $f/@codf= /librarie/filiale//filiala[denumire/text()="Eroilor"]/codf
		 and
         some $f in $c//filiala satisfies $f/@codf= /librarie/filiale//filiala[denumire/text()="Iulius Mall"]/codf 
		 and
         some $f in $c//filiala satisfies $f/@codf= /librarie/filiale//filiala[denumire/text()="Horea"]/codf
		 and
         some $f in $c//filiala satisfies $f/@codf= /librarie/filiale//filiala[denumire/text()="Campus"]/codf 	 
   return <carte>{ $c/titlu/text() }</carte>
}
</rez>
')from xmlTable