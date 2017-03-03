$(function(){
	var itema = $('.g-main .m-content .elevator .element .alist .item a');
	var current = $('.g-main .m-content .elevator .element .alist .current');
    
	function  changeClass(target){
		current.removeClass('current');
		target.parent().addClass(' current');
		current = target.parent();
	}
	itema.click(function(){
		changeClass($(this));
		var target = $(this).attr('href');
		var targetScroll = $(target).offset().top;
		$('html,body').animate({
			scrollTop:targetScroll
		},500);
		// return false;
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
    
	$('#gotop').on('click',function(){
		$('html,body').animate({'scrollTop':0},500);
	});

	    if(window.location.hash){
		 	var targetScroll = $(window.location.hash).offset().top -60;
		 	$("html,body").animate({scrollTop:targetScroll},300);
	     }

	    var navitema = $('#elevator #element .alist .item  a');
	    var current = $('#elevator  #element .alist .current');
	 	var changeClass = function(target){
	 	    current.removeClass('current');
	 	    target.parent().addClass(' current');
	 	    current = target.parent();
	 	}
	    $(window).scroll(function(){
	        var $this = $(this);              	
	     	var targetTop = $(this).scrollTop();
	     	// var footTop = $('#foot').offset().top;
     	    // var height = $(window).height();
	     	if(targetTop >= 150){
             	$('#element').addClass('fixed');
	     	}else{
	     		$('#element').removeClass('fixed');
     	    }
	     	if(targetTop < 1500){
	     		changeClass($('.food'));
	     	}else if(targetTop >1600 && targetTop<2600){
	     		changeClass($('.xiuxian'));
	     	}else if(targetTop >2700 && targetTop<3115){
	     	 	changeClass($('.movie'));
	     	}else if(targetTop >3115 && targetTop<3900){
	     		changeClass($('.hotel'));
	     	}else if(targetTop >3920&&targetTop<4800){
	     	 	changeClass($('.lifeservice'));
     	    }else if(targetTop >4820&&targetTop<5300){
     	     	changeClass($('.liren'));
     	     }else if(targetTop >5300){
     	     	changeClass($('.trip'));
     	    }
	    });

	
})
	
   
