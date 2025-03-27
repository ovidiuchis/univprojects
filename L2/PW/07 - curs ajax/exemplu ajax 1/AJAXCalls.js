
var request;
var url='toUpper.php';
var urlPOST = 'toUpperPOST.php';

function doRequest(src, value, dst, method) {
  // src - numele campului care este trimis serverului Web
  // value - valoarea campului de mai sus
  // dst - numele campului destinatie care va fi actualizat
  // method - metoda prin carei invoc URL-ul de la serverul Web

  this.destination = dst;
  request = getXmlHttpRequest();
  request.onreadystatechange = waitResponse;
  if (method == 'GET') {
    request.open(method, url + '?' + src + '=' + value, true);
    request.send('');
    return;
  }
  if (method == 'POST') {
    request.open(method, urlPOST, true);
    request.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
    request.send(src + '=' + value);
    return;
  }
  alert('Metoda trebuie sa fie GET sau POST');
}

function getXmlHttpRequest() { // Furnizeaza obiectul XMLHttpRequest
  try {
    request = new XMLHttpRequest();
  } catch (e) {
    alert('Browserul nu poate lucra cu AJAX: ' + e);
    request = false;
  }
  return request;
}

function waitResponse() {
  if (request.readyState == 4) { // cerere rezolvata
    if (request.status == 200) // raspuns Ok
      showResponse();
    else
      alert('Eroare request.status: ' + request.status);
  }
}

function showResponse() {
  var dst = document.getElementById(this.destination);
  dst.value = request.responseText;
}
