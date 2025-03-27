 select xml.query('
<rez>
{
  for $c in /librarie/carti//carte
  where count ($c/stocuri//filiala)= count(/librarie/filiale//filiala)
        and
        every $s in $c/stocuri/filiala satisfies $s/@stoc>5
  return <carte>{$c/titlu/text()}</carte>
}
</rez>
')from xmlTable