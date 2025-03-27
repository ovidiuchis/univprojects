select xml.query('
<rez>
{
  for $c in distinct-values(/librarie/carti/carte/@gen)
    return <genuri><denumire>{$c}</denumire>
           <nrCarti>{ count(/librarie/carti/carte[@gen=$c])}</nrCarti>
           {
             for $c2 in /librarie/carti/carte
                where $c2/@gen=$c
                return <carte>{$c2/titlu/text()}</carte>
             }
           </genuri>
}
</rez>
')from xmlTable