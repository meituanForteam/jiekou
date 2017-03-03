<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*,java.sql.*" %>	
<%
	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");
	
	if(action != null && action.trim().equals("regform")){
		String phone = request.getParameter("phone");
		String img = request.getParameter("img");
		String sms = request.getParameter("sms");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		boolean valite = User.checkPhone(phone);
		//取出session中的 img验证码 和 手机短信验证码
		String strImg = (String)session.getAttribute("scaptcha");
		String strSms = (String)session.getAttribute("sms");
		out.println("<script>alert("+ strSms +")</script>");
		
		
		if(phone == null || phone.trim().equals("")){
			out.println("<script>alert('手机号不正确');</script>");
			return;
		}
		if(valite == true){
			out.println("<script>alert('该手机已存在');</script>");
			return;
		}
		if(img == null || !img.trim().equals(strImg)){
			out.println("<script>alert('图片验证码不正确');</script>");
			return;
		}
		if(sms == null || !sms.trim().equals(strSms)){
			out.println("<script>alert('手机验证码不正确');</script>");
			return;
		}
		if(password == null || password.trim().equals("")){
			out.println("<script>alert('密码不能为空');</script>");
			return;
		}
		if(!password.trim().equals(password2)){
			out.println("<script>alert('两次密码不一致');</script>");
			return;
		}
		else{
			User user = new User();
			user.setPhone(phone);
			user.setPassword(password);
			user.setRdate(new java.util.Date(System.currentTimeMillis()));
			user.save();
			
			%>
			<script>
				alert("注册成功");
			</script>
			
<% 		
		response.sendRedirect("login.jsp");
		}
	}
 %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>注册|美团</title>
	<link rel="shortcut icon" href='images/tit.ico'>
	<link rel="stylesheet" type='text/css' href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/regist.css">
	<script type="text/javascript" src = "js/jquery.min.js"></script>
	<script type="text/javascript" src='js/jquery-migrate-1.2.1.min.js'></script>
	<script type="text/javascript" src='js/regist.js'></script>
</head>
<body>
	<div class="g-head">
		<div class='m-wrap clearfix'>
			<a href='' class='u-logo fl'></a>
			<div class="u-login fr">
				<span>已有美团账号？</span>
				<a href='' class='btn u-lobtn'>登录</a>
		    </div>	
		</div>
	</div>
	<div class="g-main">
		<div class="m-signUp">
			<form action='regist.jsp' method='post'>
				<input type="hidden" name="action" value="regform"> 
				<div class='form-field u-mobile'>
					<label>手机号</label>
					<input type='text' class='f-text' id='phone' name="phone">
					<span class='native' id='native'>注册成功后，全美团通用</span>
					<span class='inline-tip'><i class='tipstatus'></i>请输入您的手机号</span>
					
				</div>
				<div class='form-field u-vbtn'>
						<!-- 图片验证码刷新start -->
				<script type="text/javascript">
							function myReload() {
								document.getElementById("ver").src = document
										.getElementById("ver").src
										+ "?nocache=" + new Date().getTime();
									}
						</script>
						<!-- 图片验证码刷新end -->
				
						<input type='text' class='f-text pic' name="img">
						<a>
						<img src='servlet/SCaptchaServlet' class='verimg' id="ver" onclick="myReload()"></a>
						<a href='#' class='inline-link' id="ver" onclick="myReload()">看不清楚？换一张</a>
						<span class='inline-tip'><i class='tipstatus'></i>请输入验证码</span>
		
				</div>
				<div class='form-field verwrap'>
					<input type='button' value='免费获取短信动态码' class='getvernum'>
					<span class='inline-tip'>请输入验证码</span>
				</div>
				<div class='form-field u-sms'>
					<label>短信动态码</label>
					<input type='text' class='messver f-text' id='messver' name="sms">
					<span class='inline-tip'>
						<i class='tipstatus'></i>请输入短信动态码
					</span>
				</div>
				<div class='form-field u-pwd'>
					<div class='pwstrengthbox' id='pwstrengthbox'>
					    <div class='length clearfix'>
							<span class='pwstrength' id='weak'>弱</span>
							<span class='pwstrength' id='medium'>中</span>
							<span class='pwstrength' id='advance'>强</span>
						</div>
					    
					</div>
					<label>创建密码</label>
					<input type='password' class='f-text' id='creapass' name="password">
					<span class='inline-tip'>
						<i class='tipstatus'></i>请填写密码
					</span>
					
				</div>
				<div class='form-field u-pwd2'>
					<label>确认密码</label>
					<input type='password' class='f-text' id='checkpass' name="password2">
					<span class='inline-tip'>
						<i class='tipstatus'></i>请再次输入密码
					</span>
				</div>
				<div class='form-field u-agre'>
					<input type='submit' class='btn' value='同意以下协议并注册' id='agreebtn'>
				</div>
				<input type='hidden'>
			</form>
			<div class='term'>
				<a href=''>《美团网用户协议》</a>
			</div>
		</div>
	</div>
</body>
</html>