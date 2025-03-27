select xml.query('
<rez>
{
   for $a in  distinct-values(/librarie/carti/carte/autori/autor)
     where count (/librarie/carti/carte/autori/autor[text()=$a])>=2
     return <autor>{$a} </autor>
}
</rez>
')from xmlTable