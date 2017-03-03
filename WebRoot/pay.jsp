<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*,com.meituan.product.*,com.meituan.company.*,com.meituan.cart.*,com.meituan.order.*" %> 
<%@ include file="_sessioncheck.jsp" %>	
<%
	request.setCharacterEncoding("GBK");
	int pid = Integer.parseInt(request.getParameter("pid"));
	int uid = Integer.parseInt(request.getParameter("uid"));
	Double totalPrice = Double.parseDouble(request.getParameter("totalprice"));
 %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>收银台</title>
	<link rel="shortcut icon" href='images/pay/title.ico'>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/pay.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<script type="text/javascript" src = "js/jquery.min.js"></script>
	<script type="text/javascript" src='js/pay.js'></script>
</head>
<body>
	<div class='g-head'>
		<div class='m-top'>
			<div class='m-main clearfix'>
				<a href='' class='fl u-logo'>
					<img src='images/logo.png'>
				</a>
				<div class='fl u-process'>
					<ol class='processlist clearfix'>
						<li class='step'>1. 提交订单</li>
						<li class='step current'>2. 选择支付方式</li>
						<li class='step'>3. 购买成功</li>
					</ol>
					<div class='processpic'>
						<div class='process-bar'></div>
					</div>
				</div>
				<a href=''  class='fr icon'>
					
				</a>
			</div>
		</div>
	</div>
	<div class='g-body'>
		<div class='m-main'>
			<div class='order clearfix'>
				<span class='ordername'>
					项目：每味每客饮品甜点12选1
				</span>
				<span class='money fr'>
					应付：
					<span class='orange price'>¥<%=totalPrice %></span>
				</span>
			</div>
			<div class='payment'>
				<div class='payment-type clearfix'>
					<ul class='menu clearfix'>
						<li class='pay-tab current'>支付宝/财付通/微信</li>
						<li class='pay-tab tab'>网银支付</li>
					</ul>
					<ul class='tips clearfix'>
						<li><span>支付帮助</span></li>
						<li><a href=''>意见反馈</a></li>
					</ul>
					<div class='paylist list1 clearfix'>
						<ul classs='clearfix'>
							<li>
								<input type='radio' id='wx' name='thirdpay'>
								<label for='wx' class='icon'>
									<img src='images/pay/wexin.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='tenpay' name='thirdpay'>
								<label for='tenpay' class='icon'>
									<img src='images/pay/tenpay2.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='alipay' name='thirdpay'>
								<label for='alipay' class='icon'>
									<img src='images/pay/alipay.png'>
								</label>
							</li>
						</ul>
					</div>
					<div class='paylist list2 clearfix'>
						<p class='tip'>支持储蓄卡和信用卡，需要开通网银</p>
						<ul class='clearfix'>
							<li>
								<input type='radio' id='abc' name='ebank'>
								<label for='abc' class='icon'>
									<img src='images/pay/abc.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='icbc' name='ebank'>
								<label for='icbc' class='icon'>
									<img src='images/pay/icbc.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/ccb.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/bob.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/boc.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/bofc.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/cebb.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/cebb.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/cib.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/cmb.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/cmbc.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/gfyh.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/pab_pc.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/spdb.png'>
								</label>
							</li>
							<li>
								<input type='radio' id='ccb' name='ebank'>
								<label for='ccb' class='icon'>
									<img src='images/pay/zxyh.png'>
								</label>
							</li>
						</ul>
					</div>
				</div>
			    <div class='mobile-type fl'>
			        <div class='text'>
				    	<span>美团手机版</span>
				    	扫码支付
				    	<p><a href=''>点我下载美团手机版</a>
				    	</p>
			    	</div>
			    	<div class='img'>
			    		<img src='images/pay/data.png'>
			    	</div>
			    </div>
			    <div class='phone fl'>
			    	<img src='images/pay/phone.png'>
			    </div>
			    <div class='lastpay '>
			    	<div class='amount'>
			    		支付：<span class='orange'>￥<%=totalPrice %></span>
			    	</div>
			    	<div class='submit fr'>
			    		<a>去付款</a>
			    	</div>
			    	<div class='back fr'>
			    		<a>返回修改订单</a>
			    	</div>
			    </div>
			</div>
		</div>
	</div>
</body>
</html>