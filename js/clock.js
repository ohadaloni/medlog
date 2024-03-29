/*------------------------------------------------------------*/
function clocks() {
	clock();
	stopWatch();
}
/*------------------------------------------------------------*/
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
  document.getElementById('clock').innerHTML =
  	D + " " + G + ":" + i + "<span style=\"color:#ccc\">" + ":" + s + "</span>";
  setTimeout(clock, 1000);
}

/*------------------------------------------------------------*/
var startTime;
/*------------------------------------------------------------*/
function stopWatch() {
	const time = new Date();
	if ( startTime === undefined )
		startTime = document.getElementById('stopWatch').innerHTML ;
	seconds = Math.floor(time.getTime() / 1000) - startTime;
	/*	alert(startTime + ", now: " + now + ", seconds:" + seconds);	*/
	secs = seconds % 60 ;
	minutes = ( seconds - secs ) / 60;
	mins = minutes % 60;
	hours = ( minutes - mins ) /60;
	hrs = hours % 24 ;
	days = ( hours  - hrs ) / 24 ;
	if ( days > 0 ) {
		secs = pad0(secs);
		mins = pad0(mins);
		str = days + "d" + " " + hrs + ":" + mins + ":" + secs ;
	} else if ( hours > 0 )  {
		secs = pad0(secs);
		mins = pad0(mins);
		str = hours + ":" + mins + ":" + secs ;
	} else if ( mins > 0 ) {
		secs = pad0(secs);
		str = mins + ":" + secs ;
	} else {
		str = secs;
	}
	str = '<h3 style="color:blue;">' + str + '</h3>' ;
	document.getElementById('stopWatch').innerHTML = str;
	setTimeout(this.stopWatch, 1000);
}
/*------------------------------------------------------------*/
function pad0(i) {
if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
return i;
}
/*------------------------------------------------------------*/
