var request, request2;
var url = 'cautaDestinatii.php';
var anotherUrl = 'cautaTrenuri.php';
var destination;

function doRequest(src, value, dst, method) {


  destination = dst;

  if (value == 'NA') {
    clear(destination);
    return;
  }

  try {
    request = new XMLHttpRequest();
  }
  catch (e) {
    alert('Browserul nu suporta AJAX: ' + e);
    return;
  }

  request.onreadystatechange = waitResponse;

  if (method == 'GET') {
    request.open(method, url + '?' + src + '=' + value, true);
    request.send('');
    return;
  }
  alert('Metoda molosita pentru apelul asincron trebuie sa fie GET');
}


function waitResponse() {
  if (request.readyState == 4) { // cerere rezolvata
    if (request.status == 200) { // raspuns Ok

      var dst = document.getElementById(destination);
//      alert(request.responseText);
//      alert(destination);

      clear(destination);

      var array = eval('(' + request.responseText + ')');

//      alert(' ' + array.sosiri.length);
      for (var i = 0; i < array.sosiri.length; i++) {
        var o = document.createElement('option');
        o.text = array.sosiri[i];
        o.value = array.sosiri[i];
        dst.add(o, null);
      }

      var button = document.getElementById('afiseaza');
      button.disabled = false;
    }
    else
      alert('Eroare request.status: ' + request.status);
  }
}

function clear(destination) {
  var dst = document.getElementById(destination);

  while (dst.length > 0)
    dst.remove(dst.length - 1);
  var button = document.getElementById('afiseaza');
  button.disabled = true;
  var dst = document.getElementById('mersulTrenurilor');
  dst.innerHTML = '';
}

function doAnotherRequest(plecare, sosire, method) {
    var plecareObj = document.getElementById(plecare);
    var sosireObj = document.getElementById(sosire);
    var orasPlecare = plecareObj.options[plecareObj.selectedIndex].value;
    var orasSosire = sosireObj.options[sosireObj.selectedIndex].value;
//    alert('Trebuie sa caut trenurile de la ' + orasPlecare + ' la ' + orasSosire);

    try {
      request2 = new XMLHttpRequest();
    }
    catch (e) {
      alert('Browserul nu suporta AJAX: ' + e);
      return;
    }

    request2.onreadystatechange = updateTable;

    if (method == 'GET') {
      request2.open(method, anotherUrl + '?' + plecare + '=' + orasPlecare + '& ' + sosire + '=' + orasSosire, true);
      request2.send('');
      return;
    }
    alert('Metoda molosita pentru apelul asincron trebuie sa fie GET');
}

function updateTable() {
  if (request2.readyState == 4) { // cerere rezolvata
    if (request2.status == 200) { // raspuns Ok
      var tabel = '<table class="tabel"><tr><th>Oras Plecare</th><th>Oras Sosire</th><th>Ora Plecare</th></tr>';
      var dst = document.getElementById('mersulTrenurilor');
//      alert(request2.responseText);
      var array = eval('(' + request2.responseText + ')');
      for (var i = 0; i < array.trenuri.length; i++) {
        tabel += '<tr><td>' + array.trenuri[i].plecare + '</td><td>' + array.trenuri[i].sosire + '</td><td>'
          + array.trenuri[i].ora + '<sup>' + array.trenuri[i].minut + '</sup></td></tr>';
      }
      tabel += '</table>';
      dst.innerHTML = tabel;
//      alert(tabel);
    }
    else
      alert('Eroare request.status: ' + request2.status);
  }
}
