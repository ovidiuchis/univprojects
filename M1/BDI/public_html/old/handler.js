/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var request;
var url='xo.php';
var iStart;
var board=new Array();
for (var i=0; i<9; i++)
    board[i]=0;

function randomize()
{
    iStart=Math.floor(Math.random()*2);
    if(iStart==0){//x-ul lui
        var index=Math.floor(Math.random()*9);
        board[index]=1;
        var element = document.getElementById(index);
        element.value='X';
    }
}

function doRequest(objID)
{
    if (board[parseInt(objID)]==1 || board[parseInt(objID)]==2){
        alert('Esti chior?');
    }
    else{
        if(iStart==0)
            board[parseInt(objID)]=2;
        else
            board[parseInt(objID)]=1;

        var qstring="";
        qstring='start='+iStart;
        for (var i=0; i<9; i++)
            qstring=qstring+'&'+'el'+i+'='+board[i];

        request = getXmlHttpRequest();
        request.onreadystatechange = waitResponse;

        request.open('GET',url +'?'+ qstring, true);
        request.send();
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
        alert('Eroare AJAX ' + e);
        request = false;
    }
    return request;
}

function waitResponse() {
    if (request.readyState==4) { 
        if (request.status == 200) 
        {
            updateBoard();
        }
        else
            alert('Eroare request.status: ' + request.status);
    }
}

function updateBoard() {

    var a = new Array();
    a=eval('(' + request.responseText + ')');
    for (var i = 0; i < 9; i++) {
        if(a.celula[i]==1){
            var element = document.getElementById(i);
            element.value=' X';
            board[i]=1;
        }
        else
        if(a.celula[i]==2)
        {
            var element = document.getElementById(i);
            element.value=' O';
            board[i]=2;
        }
    }

    if(a.celula[9] =='Winner' || a.celula[9] =='Loser' || a.celula[9]=='Draw')
        alert(a.celula[9]);
}
