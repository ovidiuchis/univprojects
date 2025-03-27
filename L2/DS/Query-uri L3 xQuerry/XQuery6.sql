select xml.query('
<rez>
{   for $f in /librarie/filiale//filiala
       return <filiala> <denumire> {$f/denumire/text()}</denumire><carti>
         { for $c in /librarie/carti//carte
           where count($c/stocuri/filiala[@codf= $f/codf/text()])=0
            return <carte>{$c/titlu/text()}</carte>
          }</carti></filiala>
          }
</rez>
')from xmlTable