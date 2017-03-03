
$(document).ready(function(){
	var  checkboxl = $('#checkboxlabel');
	var  targetbox = $('#targetbox');
	
	// console.log(Isselected);
	// console.log(targetbox);
	// checkboxl.bind(
	// 	'click',function(){
	// 		if(Isselected==true){
	// 			targetbox.addClass('dbk');
	// 		}else{
	// 			// targetbox.removeClass('dbk');
	// 			targetbox.addClass('dn');
	// 		}
	// });
   checkboxl.click(function(){
       if(checkboxl.is(':checked')){
				targetbox.show();
		}else{
			    targetbox.hide();
				// targetbox.removeClass('dbk');
			// targetbox.addClass('dbk');
		}

   });
})
	

// window.onload = function(){

// 	var checkboxl = document.getElementById('checkboxlabel');
// 	var targetbox = document.getElementById('targetbox');

// 	checkboxl.onclick = function(){
// 		if(checkboxl.checked){
// 			targetbox.style.display = 'block';
// 		}else{
// 			targetbox.style.display = 'none';
// 		}
// 	}

// }