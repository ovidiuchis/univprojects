select xml.query('
<rez>
{
   for $l in /librarie/filiale/filiala
    return <filiala> <denumire> {$l/denumire/text()} </denumire>
           <stocmax>{ max(/librarie/carti/carte/stocuri/filiala[@codf = $l/codf/text()]/@stoc)}</stocmax>
    </filiala>
    
}
</rez>
')from xmlTable