select xml.query('
<rez>
 {
  for $l in /librarie/filiale/filiala
  
    return 
      <filiala>
        {$l/denumire/text()} 
        <carti>
          {  
          for $c in librarie/carti/carte
          where some $l1 in  $c/stocuri/filiala satisfies($l1/@codf eq($l/codf/text())[1])
          and $c/pret > 15
          return  <carte> 
                     <titlu>{$c/titlu/text()}</titlu> 
                     <autori>{$c/autori/autor/text()}</autori>
                     <gen>{$c/@gen}</gen>
                     <pret>{$c/pret/text()}</pret>
                  </carte>
          }
       </carti>
     </filiala>
     } 
</rez>
')from xmlTable