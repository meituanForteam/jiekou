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