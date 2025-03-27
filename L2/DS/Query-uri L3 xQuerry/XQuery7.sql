select c.query('
<rez>
{
  for $f in rez//filiala
  where count ( $f/carti//carte)=0
     return <filiala> <denumire> {$f/denumire/text()}</denumire> <cod>{$f/cod/text()}</cod></filiala>
         
}
</rez>
')from ( select xml.query('
<rez>
{   for $f in /librarie/filiale//filiala
       return <filiala> <denumire> {$f/denumire/text()}</denumire><cod>{$f/codf/text()}</cod><carti>
         { for $c in /librarie/carti//carte
           where some $fc in $c/stocuri/filiala satisfies $fc/@codf = $f/codf/text()
            return <carte>{$c/titlu/text()}</carte>
          }</carti></filiala>
          }
</rez>
')from xmlTable) as T(c)