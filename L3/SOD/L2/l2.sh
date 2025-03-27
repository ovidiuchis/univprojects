
for user in `who | cut -d" " -f1`
 do
   for grup in `groups "$user" `
    do
     if [ $grup = $1 ]
      then
	echo $user
     fi
    done
 done
