use xml
declare @cXml xml;
set @cXml='';
 select cXml.query('
<rez>
{   for $f in /librarie/filiale//filiala
    where empty(/librarie/carti/carte/stocuri/filiala[@codf=$f/codf/text()])
       return <filiala> <denumire> {$f/denumire/text()}</denumire><cod>{$f/codf/text()}</cod>
        </filiala>
          }
</rez>
')from Librarie