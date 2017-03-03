window.onload = function(){
	var minusbtn = document.querySelector("#minusbtn");
	var addbtn = document.querySelector("#addbtn");
	var allmoney = document.querySelector("#allmoney");
	var quantity = parseFloat(document.querySelector("#quantityinput").value);
	minusbtn.onclick = function(){
		quantity = parseFloat(document.querySelector("#quantityinput").value);
		var permoney = parseFloat(document.querySelector("#permoney").innerHTML);
		var paynumber = new Number(quantity * permoney).toFixed(2);
		document.querySelector("#amountmoney").innerHTML = paynumber;
		allmoney.innerHTML = paynumber;

	}
	addbtn.onclick = function(){
	    var quantity = parseFloat(document.querySelector("#quantityinput").value);
		var permoney = parseFloat(document.querySelector("#permoney").innerHTML);
		var paynum =  new Number(quantity * permoney).toFixed(2);
	    document.querySelector("#amountmoney").innerHTML = paynum;
	    allmoney.innerHTML = paynum;
	}
	
}