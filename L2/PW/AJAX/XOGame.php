<?php

  $start=$_GET['start'];
  $mat= array( 0=>array($_GET['X0'], $_GET['X1'],$_GET['X2']),
                 1=>array($_GET['X3'],$_GET['X4'],$_GET['X5']),
				 2=>array($_GET['X6'],$_GET['X7'],$_GET['X8'])
				 );


  function verificaCastigator()
  {
     global $mat;
     if($mat[0][0]!=0 && $mat[0][0]==$mat[1][1] && $mat[1][1]==$mat[2][2]) //diagonale
       return $mat[0][0];
         else
          if($mat[0][2]!=0 && $mat[0][2]==$mat[1][1] && $mat[1][1]==$mat[2][0])
             return $mat[0][2];
      for($i=0; $i<3; $i++)
      {
        if($mat[$i][0]!=0 && $mat[$i][0]==$mat[$i][1] && $mat[$i][1]==$mat[$i][2]) //linie
           return $mat[$i][0];
         else   
           if($mat[0][$i]!=0 && $mat[0][$i]==$mat[1][$i] && $mat[1][$i]==$mat[2][$i]) //coloane
             return $mat[0][$i];
      
      }
      return -1;
         
  }
  
  function getPozitiiLibere()
  {
     global $mat;
     $array= array();
     $k=0;
     $poz=0;
     for($i=0; $i<3; $i++)
       for($j=0; $j<3; $j++){
         if($mat[$i][$j]==0){
           $array[$k]=$poz;
           $k++;
         }
         $poz++;
       }
         return $array;
      
  }
  
  function computer($array)
  {
    global $mat;
    $i=0;
    $j=0;
    $pos= $array[(rand()% count($array))];
    
    $index=0;
    while($index<$pos)
    {
       if($j<2)
         $j++;
        else 
        {
          $i++;
          $j=0;
        }
        $index++;
    }
    global $start;
    if($start==0)
       $mat[$i][$j]=1;
      else
       $mat[$i][$j]=2;
  }
  
  function toArray()
  {
  
    global $mat;
     $array= array();
     $k=0;
     for($i=0; $i<3; $i++)
       for($j=0; $j<3; $j++){
           $array[$k]=$mat[$i][$j];
           $k++;
         }
         return $array;

  }
  
  function trimite($array)
  {
    printf("{\"celula\": [ ");
       foreach ($array as $i=>$val)
           printf("\"%s\",", $val);
     printf(" ] }");
  }


  
  function main()
  {
     global $mat;   
     $array=array();
     
     if(verificaCastigator()==1 || verificaCastigator()==2){
          $array=toArray();
          $array[9]="Ai castigat";
          trimite($array);
       }
       else 
       {  
          computer(getPozitiiLibere($mat), $mat);
          if(verificaCastigator()==1 || verificaCastigator()==2){
            $array=toArray();
            $array[9]="Ai pierdut";
            trimite($array);
          }
            else{ 
             $array=toArray();
             $array[9]="go";
             trimite($array);
            }
       }
  }
  
   main();
   
?>