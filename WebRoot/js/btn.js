$(document).ready(function(){
	
	var quantity = $('#quantityinput').val();
	 	var minusbtn = $('#minusbtn');
	 	var addbtn = $('#addbtn');
	 	var btnbuy = $('.btn-buy');
	 	minusbtn.bind(
	 		'click',function(){
	 			if(quantity>1){
	 				quantity--;
	 			}
	 			$('#quantityinput').val(quantity);
            	
	 		});
        addbtn.bind(
        	'click',function(){
                quantity++;
                $('#quantityinput').val(quantity);
        	});
//       btnbuy.bind('click',function(){
//    	   var req = new XMLHttpRequest();
//           req.open('POST','./submitorder.jsp',true);
//           req.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
//           req.send('count=' + quantity);
//
//           req.onreadystatechange = function () {
//            if (req.readyState == 4 && req.status == 200) {
//
//               var response = req.responseText;
//               
//               if(response == 1){
//               alert("chenggong");
//               console.log(req.getAllResponseHeaders());
//               
//               
//               }
//               else if(response == 0){
//               	alert("buchenggong");
//               	
//                  }
//           }
//            
//      }      
//       });
});