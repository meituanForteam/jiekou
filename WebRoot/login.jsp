<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*" %> 
<%
	request.setCharacterEncoding("GBK");
	String uAction = request.getParameter("uaction");
	
	if(uAction != null && uAction.trim().equals("userlogin")){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = null;
		try{
			user = User.validate(username,password);
			
		}catch(UserNotFoundException e){
			out.println("用户不存在");
			return;
		}catch(PasswordNotCorrectException e){
			out.println("密码不正确");
			return;
		}
		out.println("<script>alert('登陆成功');</script>");
		
		session.setAttribute("user",user.getUsername());
		session.setMaxInactiveInterval(3600);
		response.sendRedirect("shop.jsp");
		return; 
	}
	
 %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录|美团</title>
	<link rel=" shortcut icon" href='images/tit.ico'>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript" src = "js/jquery.min.js"></script>
	<script type="text/javascript" src='js/jquery-migrate-1.2.1.min.js'></script>
	<script type="text/javascript" src='js/login.js'></script>
</head>
<body>
	<div class="g-head">
		<div class="m-logo">
			<a href="##">美团网</a>
		</div>
	</div>
	<div class="g-main">
		<div class="m-pic">
			<img src="images/left.jpg">	
		</div>
		<div class="m-login">
			<!-- 图片验证码刷新start -->
				<script type="text/javascript">
							function myReload() {
								document.getElementById("ver").src = document
										.getElementById("ver").src
										+ "?nocache=" + new Date().getTime();
									}
						</script>
						<!-- 图片验证码刷新end -->
			<form action="login.jsp" method="post">
				<input type="hidden" name="uaction" value="userlogin">
				<div class="u-remind">
					
				</div>
				<div class="u-title">
					<span>账号登录</span>
					<a href="##" class="fr" id='mologin'>手机动态码登录<i class='ico'></i></a>
				</div>
				<div class="u-user">
					<i class="avatar"></i>
					<input type="text" id="userName" name="username" placeholder="手机号/用户名/邮箱">
				</div>
				<div class="u-verify">
					<i class='icon'></i>
					<input type='text' placeholder='验证码' class='verm'>
					<a>
					<img src='servlet/SCaptchaServlet' class='verimg' id="ver" onclick="myReload()"></a>
					<a href='#' id="ver" onclick="myReload()">看不清？换一张</a>
				</div>
				<div class='u-vernum'>
					<input type='button' value='免费获取手机动态码' class='btn verbtn'>
					<span class='getinfo'>已发送，一分钟后可获取</span>
				</div>
				<div class="u-user">
					<i class="pass"></i>
					<input type="password" name="password" id="userPass" placeholder="密码">
				</div>
				<div class="u-autologin">
					<input type="checkbox" id="autoLogin" name= "" class="checkice">
					<label for="autoLogin" class="check">7天内自动登录</label>
					<a href="##" class="fdp"> 忘记密码？</a>
				</div>
				<div class="u-commit">
					<input type="submit" value="登录" class="btn">
				</div>
				<p class='u-regst'><span>还没有账号？</span><a href='regist.jsp'>免费注册</a></p>
			</form>
			<div class="u-wrap">
				<p class='coopreat'>用合作网站账号登录</p>
				<div class="log">
					<a class='tencent'></a><a class='sina'></a>
				</div>
			</div>
		</div>
	</div>
	<div class="g-foot">
		<div class="m-siteinfo clearfix">
			<ul class='u-info'>
				<li class='fl'><a href='##'>关于美团</a></li>
				<li class='fl'><a href='##'>美团承诺</a></li>
				<li class='fl'><a href='##'>加入我们</a></li>
				<li class='fl'><a href='##'>商家入驻</a></li>
				<li class='fl'><a href='##'>帮助中心</a></li>
				<li class='fl'><a href='##'>美团手机版</a></li>
			</ul>
			<a href='#' class='commit fr'><img src='images/foot.png'></a>
		</div>
		<div class="m-copyright">
			<p>
				&copy;<span>2017</span>
				<a href='##'>美团网团购</a>
				meituan.com
				<a href='##'>京ICP证07078</a>
				京公安备110105086号
				<a href='##'>电子公告服务规则</a>
			</p>
		</div>
	</div>
</body>
</html>