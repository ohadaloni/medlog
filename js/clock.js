function clock() {
  const time = new Date();
  Dn = time.getDay();
  days = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
  D = days[Dn];
  G = time.getHours();
  i = time.getMinutes();
  i = pad0(i);
  s = time.getSeconds();
  s = pad0(s);
  document.getElementById('clock').innerHTML = D + " " + G + ":" + i + ":" + s;
  setTimeout(clock, 1000);
}

function pad0(i) {
  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
  return i;
}
