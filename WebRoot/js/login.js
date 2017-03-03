$(document).ready(function(){
	var mologin  = $('#mologin');
	var btn = $('.u-vernum .verbtn');
	console.log(btn);
	mologin.toggle(
		function(){
			 $(mologin).html("普通方式登录<i class='ico'></i>");
			 $('.ico').css('background-position',"-597px -676px");
			 $('.avatar').css('background-position','-1250px -617px');
			 $('#userPass').attr('placeholder','密码');
			 $('#userName').attr('placeholder','手机号/用户名/邮箱');
			 $('.u-vernum').css('display','block');
		},
		function(){
			 $(mologin).html("手机动态码登录<i class='ico'></i>");
			 $('.avatar').css('background-position','-1250px -581px')
			 $('.ico').css('background-position',"-611px -677px");
			 $('#userPass').attr('placeholder','动态码');
			 $('#userName').attr('placeholder','手机号');
			 $('.u-vernum').css('display','none');
		}
		);
	 btn.bind('click',function(){
		$('.u-verify').css('display','block');
	});
});