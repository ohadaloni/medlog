/*------------------------------------------------------------*/
$(function() {
	medLogPaintRows(document);
	/*	$(".imgToolTip").imgToolTip();	*/
	$(".showImage").showImage();
	$(".medLogRow", document).click(function(){
		$(".medLogRow").not(this).removeClass("keepHilited");
		$(this).addClass("keepHilited");
	});
});
/*------------------------------------------------------------*/
function medLogPaintRows(context)
{
	$(".mRow", context).hoverClass("hilite");
	$(".medLogRow", context).hoverClass("hilite");
	$(".mFormRow", context).hoverClass("hilite");
	$(".mHeaderRow", context).addClass("medLogZebra0");
	$(".medLogHeaderRow", context).addClass("medLogZebra0");
	$(".mFormRow:nth-child(odd)", context).addClass("medLogZebra1");
	$(".mFormRow:nth-child(even)", context).addClass("medLogZebra2");
	$(".mRow:nth-child(odd)", context).addClass("medLogZebra1");
	$(".mRow:nth-child(even)", context).addClass("medLogZebra2");
	$(".medLogRow:nth-child(odd)", context).addClass("medLogZebra2");
	$(".medLogRow:nth-child(even)", context).addClass("medLogZebra1"); // first row is 1
	$(".medLogFormRow:nth-child(odd)", context).addClass("medLogZebra2");
	$(".medLogFormRow:nth-child(even)", context).addClass("medLogZebra1"); // first row is 1

	$(".today:nth-child(odd)", context).addClass("medLogZebra3");
	$(".today:nth-child(even)", context).addClass("medLogZebra4");
	$(".yesterday:nth-child(odd)", context).addClass("medLogZebra5");
	$(".yesterday:nth-child(even)", context).addClass("medLogZebra6");

}
/*------------------------------------------------------------*/
