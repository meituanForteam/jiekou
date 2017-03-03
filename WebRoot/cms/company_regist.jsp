<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*,java.sql.*,com.meituan.company.*" %>

<%
	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");
	
	if(action != null && action.trim().equals("regform")){
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		int classify = Integer.parseInt(request.getParameter("classify"));
		boolean valite = CompanyManager.getInstance().checkCompany(phone);
		
		String companyCategory = request.getParameter("company");
		out.println(password);
		if(phone == null || phone.trim().equals("")){
			out.println("<script>alert('手机号不正确');</script>");
			return;
		}
		if(valite == true){
			out.println("<script>alert('该手机已存在');</script>");
			return;
		}
		
		if(password == null || password.trim().equals("")){
			out.println("<script>alert('密码不能为空');</script>");
			return;
		}
		if(!password.trim().equals(password2)){
			out.println("<script>alert('密码不一致');</script>");
			return;
		}
		if(companyCategory == null || companyCategory.trim().equals("0")){
			out.println("<script>alert('请选择商铺类别');</script>");
			return;
		}
		else{
			Company cp = new Company();
			cp.setCompanyPhone(phone);
			cp.setCompanyPassword(password);	
			cp.setCompanyDescr(companyCategory);
			cp.setCompanyPdate(new Timestamp(System.currentTimeMillis()));
			cp.setCompanyClassify(classify);	
			int id = CompanyManager.getInstance().save(cp);		
			
			%>
			<script>
				alert("注册成功");
			</script>
			
<% 		
		
		session.setAttribute("company",id);
		response.sendRedirect("index.jsp?id=" + id);
		
		}
		
	}
	
 %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>注册|美团</title>
	<link rel="shortcut icon" href='../images/tit.ico'>
	<link rel="stylesheet" type='text/css' href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/regist.css">
	<script type="text/javascript" src = "../js/jquery.min.js"></script>
	<script type="text/javascript" src='../js/jquery-migrate-1.2.1.min.js'></script>
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
			<form action='company_regist.jsp' method='post'>
				<input type="hidden" name="action" value="regform"> 
				<div class='form-field u-mobile'>
					<label>手机号</label>
					<input type='text' class='f-text' id='phone' name="phone">
					<span class='native' id='native'>注册成功后，全美团通用</span>
					<span class='inline-tip'><i class='tipstatus'></i>请输入您的手机号</span>
					
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
				<div class='form-field u-pwd2'>
					<label>商铺类别</label>
					<select name="classify">
						<option value="0">请选择商铺分类</option>
						<option value="1">美食</option>
						<option value="2">酒店</option>
						<option value="3">电影</option>
						<option value="4">KTV</option>
						<option value="5">休闲娱乐</option>
						<option value="6">周边游</option>
						<option value="7">生活服务</option>
						<option value="8">购物</option>
						<option value="9">丽人</option>
					</select>
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