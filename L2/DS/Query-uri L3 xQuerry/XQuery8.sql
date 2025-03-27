select xml.query('
<rez>
{
 max(for $p in /librarie/carti/carte/pret return xs:integer($p))
}
</rez>
')from xmlTable