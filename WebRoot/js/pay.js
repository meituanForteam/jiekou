window.onload = function(){
    var payTab = document.getElementsByClassName('pay-tab');
	var paylist = document.getElementsByClassName('paylist');
	 // console.log(paylist);
	//console.log(payTab);
		// function  hide(){
		// 	for(var i=0;i<paylist.length;i++){
		// 		paylist[i].style.display = 'none';
		// 	}
		// }
    
    	for(var i=0;i<payTab.length;i++){
    		payTab[i].index = i;
    		payTab[i].onclick = function(){
    			for(var i = 0;i<payTab.length;i++){
    				payTab[i].className = 'pay-tab tab' ;
    				paylist[i].style.display = 'none' ;

    			}
    			payTab[this.index].className = 'pay-tab current';
    			paylist[this.index].style.display = 'block';
    		}
        }
}
	
    

	
