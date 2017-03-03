
	$(function(){
		var navitema = $('#smoothscroll .navitem a');
	    var current = $('#smoothscroll .current');
	 	var changeClass = function(target){
	 	    current.removeClass('current');
	 	    target.parent().addClass(' current');
	 	    current = target.parent();
	 	}
	 	navitema.click(function(){
	 		changeClass($(this));
	 		var target = $(this).attr('href');

            var targetScroll = target.offset().top - 60;
            $('html,body').animate({scrollTop:targetScroll},500);

	 	});
	 	
		if(window.location.hash){
		 	var targetScroll = $(window.location.hash).offset().top -60;
		 	$("html,body").animate({scrollTop:targetScroll},300);
	     }
	    $(window).scroll(function(){             	
	     	var targetTop = $(this).scrollTop();
     	    
	     	if(targetTop >= 700){
             	$('#smoothscroll').addClass('fixedscroll');
             	$('#scaning').css('position','fixed');
             	$('#navbar').animate({width:'980px'},0);
             	$('#qbtn').css('display','block');
	     	}else{
	     		$('#smoothscroll').removeClass('fixedscroll');
	     		$('#scaning').css('position','');
	     		$('#navbar').animate({width:'702px'},0);
             	$('#qbtn').css('display','none');
     	    }
	     	if(targetTop < 830){
	     		changeClass($('.weizhi'));
	     	}else if(targetTop >1115 && targetTop<1316){
	     		changeClass($('.xuzhi'));
	     	}else if(targetTop >1300 && targetTop<1615){
	     		changeClass($('.xiangqing'));
	     	}else if(targetTop >1700 && targetTop<2700){
	     		changeClass($('.jieshao'));
	     	}else if(targetTop >2800){
	     		changeClass($('.pingjia'));
     		}
	    });
	    $('#tri').mouseover(function(){
	 	$('#sertab').css('overflow','visible');
		 	 $('#business').click(function(){
	     	 $('#sertab').html('<li class="tab-item" id="business">商家</li><li class="tab-item" id="groupgo">团购</li>');
			 $('#sertab').css('overflow','hidden');					
        });
	    $('#groupgo').click(function(){
	        $('#sertab').html('<li class="tab-item" id="groupgo">团购</li><li class="tab-item" id="business">商家</li>');
			$('#sertab').css('overflow','hidden');
	     	});
	    });
	  
   	    $('#iconfontjiao').toggle(function(){
   	    	$('#iconfontjiao').attr('class','iconfont icon-icon22');
   	    },function(){
   	    	$('#iconfontjiao').attr('class','iconfont icon-jiantouxia');
   	    });

   	    $('#clean').click(function(){
   	    	$('#scanbox').html('<div class="qk">暂无浏览记录</div>');
   	    })
	   		
	})
	    
	   		// $('#unavbox').css('display','block');
	   		// $('#unavbox').css('z-index','1000');
	   		// $('#unavbox').css('z-index','100')
	   

	