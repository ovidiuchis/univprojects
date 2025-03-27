select xml.query('
<rez>
{
 for $c in /librarie/carti//carte
  where $c/pret=max(for $p in /librarie/carti/carte/pret return xs:integer($p))
  return <carte>{$c/titlu/text()}</carte>
}
</rez>
')from xmlTable