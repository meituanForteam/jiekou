$(function(){
	var container = $('#container');
	var mainbox = $('#mainbox');
    var account = $('#account');
    var  scan = $('#scan');

    // console.log(mainbox.position().top-11);
    account.click(function(){
    	var mainboxPos = mainbox.position();
    	var left = mainboxPos.left-803;
    	mainbox.animate({'left':left},500);
    	$('#tab1').css('display','none');
    	$('#tab2').css('display','block');
    });
    scan.click(function(){
    	var mainboxpos = mainbox.position();
    	var leftpos = mainboxpos.left+803;
    	mainbox.animate({'left':leftpos},500);
    	
    	$('#tab2').css('display','none');
    	$('#tab1').css('display','block');
    });
    $('#linkxq').click(function(){
    	$('#con').hide();
    	$('#con').siblings('.money').hide();
    	$('#hide').show();
    	$('#linkhide').show();
    	$(this).hide();
    });
    $('#linkhide').click(function(){
    	$('#hide').hide();
    	$(this).hide();
    	$('#con').show();
    	$('#con').siblings('.money').show();
    	$('#linkxq').show();
    });
    $('#sao1').click(function(){
    	$(this).hide();
    	$(this).siblings().show();
    });
    $('#sao2').click(function(){
    	$(this).hide();
    	$(this).siblings().show();
    });
})

	

    
    // console.log(mainbox.position().left);
    
