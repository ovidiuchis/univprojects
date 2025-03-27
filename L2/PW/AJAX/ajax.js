var request;
var url='XOGame.php';
var rand;
var array=new Array();
for (var i=0; i<9; i++)
    array[i]=0;
	
function init()
{
  rand=Math.floor(Math.random()*2);
//  alert(rand);
  if(rand==0){  // a inceput computerul
     var index=Math.floor(Math.random()*9);
     array[index]=1;
     var element = document.getElementById(index);
     element.value='X';
   }
 }
 
function doRequest(value,method)
{
    if(rand==0)
       array[parseInt(value)]=2;	 
	else
	   array[parseInt(value)]=1;	
	   
	 var query="";
     query='start='+rand;	 
	 
	 for (var i=0; i<9; i++)
	    query=query+'&'+'X'+i+'='+array[i];
	
	 request = getXmlHttpRequest();
	 request.onreadystatechange = waitResponse;
	  if (method == 'GET') {
	    request.open(method,url +'?'+ query, true);
	    request.send('');
	    return;
	  }
	}

function getXmlHttpRequest() {
	try{
	if (window.XMLHttpRequest)
	  {
	   request=new XMLHttpRequest();
	  }
	else
	  {
		request=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	} catch (e) 
	    {
		    alert('Browserul nu poate lucra cu AJAX: ' + e);
		    request = false;
	    }
     return request;
}

function waitResponse() {
	  if (request.readyState == 4) { // cerere rezolvata
	    if (request.status == 200) // raspuns OK
		{			
	     showResponse();	  	
		  }
	    else
	      alert('Eroare request.status: ' + request.status);
	  }
	  }

function showResponse() {

	     var a = new Array();
		 a=eval('(' + request.responseText + ')');
		 for (var i = 0; i < 9; i++) {
		   if(a.celula[i]==1){
		     var element = document.getElementById(i);
             element.value='X';  
			 array[i]=1;
			 }
			 else
			 if(a.celula[i]==2)
			 {
			   var element = document.getElementById(i);
               element.value='O';  
			   array[i]=2;
			 }
		}
		
		if(a.celula[9] != "go") 
	         alert(a.celula[9]);
	}