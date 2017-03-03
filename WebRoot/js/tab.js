window.onload = function(){

	var gromlist = document.getElementsByClassName('gromitem');
	var recontent = document.getElementsByClassName('m-recontent');
	for(var i=0;i<gromlist.length;i++){
		gromlist[i].index = i;
        gromlist[i].onclick = function(){
        	for(var i=0;i<gromlist.length;i++){
        		gromlist[i].className = 'gromitem';
        		recontent[i].style.display = 'none';
        	}
 		gromlist[this.index].className = 'gromitem current' ;
 		recontent[this.index].style.display = 'block' ;
         
        
 		}

	}
}