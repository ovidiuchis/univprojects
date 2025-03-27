select xml.query('
<rez>
{   
for $f in /librarie/filiale//filiala
    return 
       <carti>
       { 
          for $c in librarie/carti//carte
          where some $f2 in $c/stocuri//filiala satisfies ($f2/@codf eq ($f/codf/text())[1])
          return   <carte>{$f/denumire/text()}---{$c/titlu/text()} </carte>
       }
       </carti>
}
</rez>
')from xmlTable