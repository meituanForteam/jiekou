$(function(){
   var current = $('.navlist li');
   
   // console.log(current);
   var changeClass = function(target){
 	    current.removeClass('current');
 	    target.addClass('current');
 	    current = target;
   }
   $('.navlist li').click(function(){
   	 changeClass($(this));
   });
   
   $('.del').click(function(){
   		$('#delConfirm').show();
   		$('#mask').show();
   		var thisdel = $(this);
   		$('#delbtn').click(function(){
   		    thisdel.parents('.order').remove();
   		    $('#delConfirm').hide();
	   		$('#mask').hide();
	   		$('#unpaied').text($('.order').length);

   		});
	    $('#close').click(function(){
	            $('#delConfirm').hide();
	   		    $('#mask').hide();
	   		    
	   	});
	   


   });

   	$('#unpaied').text($('.order').length);


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

});
  

