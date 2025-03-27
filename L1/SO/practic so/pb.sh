if [ $# = 0 ]
then
 echo "Nu sunt parametri"
fi
for user 
do
 touch date.txt
 echo `finger $user` >> date.txt

done
