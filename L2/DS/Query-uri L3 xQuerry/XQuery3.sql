 select xml.query('
<rez>
{
  for $c in /librarie/carti//carte
  where count ($c/stocuri//filiala)=1
  return <carte>{$c/titlu/text()}</carte>
  }
</rez>
')from xmlTable