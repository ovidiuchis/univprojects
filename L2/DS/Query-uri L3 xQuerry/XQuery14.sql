select s.query('
<rez>
{
   for $f in /rez/filiala
    where $f/stoc= max(/rez/filiala/stoc)
    return <filiala>{$f/nume/text()}</filiala>
}
</rez>
')from
(select xml.query('
<rez>
{
   for $f in /librarie/filiale/filiala
    return <filiala> <nume> {$f/denumire/text()} </nume>
           <stoc>{ sum(/librarie/carti/carte/stocuri/filiala[@codf = $f/codf/text()]/@stoc)}</stoc>
    </filiala>
    
}
</rez>
')from xmlTable) as T(s)