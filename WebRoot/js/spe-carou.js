window.onload = function(){
		var imgallery = document.getElementById('imgallery');
		var coverimg = document.getElementById('coverimgs');
	    var carou = document.getElementById('carou');
	    var previous = document.getElementById('previous');
	    var next = document.getElementById('next');
	    var candimgs = document.getElementById('candimgs');
	    var candimga =  candimgs.getElementsByTagName('a');

	    var links = document.getElementsByTagName('a');
	    var imgAmount = 2;
	    var index1 = 0; 
	    var slide = function(i){
	    	carou.style.left =  i * (-460)+'px';
	    }
	    

	    previous.onclick = function(){
	    	if(index1<=0){
	    		index1 = imgAmount-1
	    	}else{
	    		index1--;
	    	}
	    	slide(index1);
	    }
	    next.onclick = function(){
	    	if(index1>=imgAmount-1){
	    		index1=0;
	    	}else{
	    		index1++;
	    	}
	    	slide(index1);
	    }
	    var removeClass = function(){
	    	for(var j = 0;j<candimga.length;j++){
	    		candimga[j].className = ' ';
	    	}
	    }
	    for(var i = 0;i<candimga.length;i++){
	    	candimga[i].index = i;
	    	candimga[i].onmouseover = function(){
	    		removeClass();
	    		candimga[this.index].className = 'current' ;
	    		slide(this.index);
	    		index1 = this.index;
	    	}
	    }
		
}
	
    