
	window.onload = function(){

			var slideBox = document.getElementById('slideBox');
			var promotion = slideBox.querySelector('#promotion');
			var proIndex = 0;
			var slider = promotion.querySelector('#slider');
			var previousbtn = promotion.querySelector('#previous');
			var next =  promotion.querySelector('#next');
			var countLi = 6;
			var slide = function(i){
				slider.style.left = i*(-689)+'px';
			}
			var protimer = setInterval(function () {
				if (proIndex >= countLi-1) {
					proIndex= 0;
				}
				else {
					proIndex ++;
				}			
				slide(proIndex);
			},2666);
			previousbtn.onclick = function(){
				if(proIndex<=0){
					proIndex = countLi-1;
				}else{
					proIndex--;
				}
				slide(proIndex);
			}
			next.onclick = function(){
				if(proIndex >= countLi-1){
					proIndex = 0;
				}else{
					proIndex++;
				}
				slide(proIndex);
			}
			promotion.onmouseenter = function () {
			if (protimer) 
				clearInterval(protimer);
			}
		   promotion.onmouseleave = function () {
				protimer = setInterval(function () {
				if (proIndex >= countLi - 1){
					proIndex = 0;
				}	
				else {
					proIndex ++;
				}
				slide(proIndex);
				},2666);
			}
			var  element = document.querySelector('#elevator').querySelector('.element');
			var scroll = element.offsetTop;
			document.getElementsByTagName("body")[0].onscroll=function(){
                if(scroll>160){
                   scroll = scroll-20;
                }
                
                element.style.top = scroll +'px';
                console.log(element.offsetTop);
            }
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

	      	var itemintro = document.getElementsByClassName('itemintro');
	      	var navrights = document.getElementsByClassName('rightnav');
	      	 console.log(itemintro);
	      	// console.log(navrights);
	      	for(var i=0;i<itemintro.length;i++){
        		itemintro[i].index= navrights[i].index=i  ;                    //如果连等写法，那么nav2的index属性也要赋值为i，否则获取不到无法执行
        		itemintro[i].onmouseover=navrights[i].onmouseover=function(){    //连等写法
            	    clearTimeout(itemintro[this.index].timer);                  //放入则停止计时器
            	    navrights[this.index].style.display="block";
        		}
        		itemintro[i].onmouseout= navrights[i].onmouseout=function(){
            		var self=this;                               //保存当前this为self，因为下面setTimeout会改变this
           			itemintro[this.index].timer=setTimeout( function(){navrights[self.index].style.display="none";},50)   //this改为self,计时器作为每一个nav1的属性，为了保证多个物体分别计时
        		}
    		}

}

