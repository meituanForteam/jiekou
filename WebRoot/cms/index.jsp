<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="sessioncheck.jsp"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>基本管理</h2>
  <!--<ul style="display:block">
    <li><a href="info.html" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
    <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>单页管理</a></li>  
    <li><a href="adv.html" target="right"><span class="icon-caret-right"></span>首页轮播</a></li>   
    <li><a href="book.html" target="right"><span class="icon-caret-right"></span>订单管理</a></li>     
    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>商品管理</a></li>
  </ul>  -->
  <h2><span class="icon-pencil-square-o"></span>商品管理</h2>
  <ul> 
    <li><a href="productlist.jsp" target="right"><span class="icon-caret-right"></span>商品管理</a></li>
    


  </ul>  
  <h2><span class="icon-pencil-square-o"></span>订单管理</h2>
  <ul>
   
    <li><a href="orderlist.jsp" target="right"><span class="icon-caret-right"></span>已接单</a></li>
    <li><a href="refuseorder.jsp" target="right"><span class="icon-caret-right"></span>未接单</a></li> 
    
  </ul>  
  <h2><span class="icon-pencil-square-o"></span>类别管理</h2>
  <ul>
    <li><a href="categorylist.jsp" target="right"><span class="icon-caret-right"></span>分类管理</a></li>
    
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  
  
  
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="categorylist.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</body>
</html>