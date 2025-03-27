select c.query('
<rez>
{
   for $l2 in /rez/filiala
    return <filiala><denumire>{$l2/denumire/text()}</denumire>
           <valoare>{ sum(/rez/filiala[denumire/text() = $l2/denumire/text()]/carti/carte/valoare/text() )}</valoare>
           </filiala>
}
</rez>
')from (select xml.query('
<rez>
{
   for $l in /librarie/filiale/filiala
   return <filiala><denumire>{$l/denumire/text()}</denumire>
          <carti>
          {
            for $c in /librarie/carti/carte
            return <carte><titlu>{$c/titlu/text()}</titlu>
                   <valoare>{($c/pret/text())[1]*($c/stocuri/filiala[@codf = $l/codf/text()]/@stoc)[1]}</valoare>
                   </carte>
                   
            }</carti></filiala>
}
</rez>
')from xmlTable) as T(c)