function recalculate_totals(){
	recalculate_total_amount();
	recalculate_total_price();
}

function recalculate_total_amount(){
	$("total_tracks").value = checked_checkboxes().size();
}

function recalculate_total_price(){
	var sum = checked_checkboxes().inject(0, function(sum, n){
		return sum + parseFloat(n.getAttribute("rel"));
	})
	$('total_price').innerHTML = sum;
}

function checked_checkboxes(){
	return $$(".track_checkbox").findAll(function(n){
		return n.checked;
	})
}