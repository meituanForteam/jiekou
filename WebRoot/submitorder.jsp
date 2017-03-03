<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*,com.meituan.product.*,com.meituan.company.*,com.meituan.cart.*,com.meituan.order.*" %> 
<%@ include file="_sessioncheck.jsp" %>
<jsp:useBean id="cart" class="com.meituan.cart.Cart" scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("GBK");
	int pid = Integer.parseInt(request.getParameter("pid"));
	int uid = Integer.parseInt(request.getParameter("uid"));
	String strCount = request.getParameter("count");
	int count = Integer.parseInt(strCount);
	Product p = new Product();
	Company cp = new Company();
	User u = new User();
	p = ProductManager.getInstance().getProduct(pid);
	cp = CompanyManager.getInstance().loadById(p.getCid());
	u = User.getUserDetail(uid);

	String action = request.getParameter("action");
	if(action != null && action.trim().equals("order")){
	double price = Double.parseDouble(request.getParameter("price"));
	int auid = Integer.parseInt(request.getParameter("uid"));
	int apid = Integer.parseInt(request.getParameter("pid"));
	String aCount = request.getParameter("count");
	int acount = Integer.parseInt(strCount);
	double totalPrice = Cart.getTotalPrice(price,acount);
	
	Product product = new Product();
	product = ProductManager.getInstance().getProduct(apid);//获得商品属性
	
	User au = new User();
	au.setId(auid);
	
	CartItem ci = new CartItem();
	ci.setProductId(apid);
	ci.setPrice(price);
	ci.setCount(acount);
	ci.setTotalPrice(totalPrice);
	ci.setName(product.getName());
	ci.setDescr(product.getDescr());
	cart.add(ci);
	
	SaleOrder so = new SaleOrder();
	so.setUser(au);
	so.setoDate(new Timestamp(System.currentTimeMillis()));
	so.setAddr("");
	so.setStatus(1);
	so.setCart(cart);
	so.save();
%>
<%
	response.sendRedirect("pay.jsp?pid=" + apid + "&uid=" + auid + "&totalprice=" + totalPrice);
		
}
			
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>美团网</title>
	<link rel="shortcut icon" href='images/tit.ico'>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/submitorder.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<script type="text/javascript" src = "js/jquery.min.js"></script>
	<script type="text/javascript" src = "js/btn.js"></script>
	<script type="text/javascript" src= "js/checkbox.js"></script>
	<script type="text/javascript" src='js/submitorder.js'></script>
</head>
<body>
	<div class='g-head'>
		<div class="m-top user-nav">
			<div class="u-user clearfix">
				<ul class='u-binfo fl'>
					<li class='keep fl'>
						<a href=''>
							<i></i>
							收藏美团
						</a>
					</li>
					<%
						if(uid != 0){
					 %>
					<li class='userinfo fl'>
						<a href='' class='username'><%=u.getUsername()%></a>
						<a href='' class='quit'>退出</a>
					</li>
					<li class='dropdown fl'>
						<a href=''>
							<span>消息</span>
							<i></i>
						</a>
					</li>
					<%
						}
					 %>
				</ul>
				<ul class='userfuc fr'>
					<li class='fl dropdown orders'><a href='' >我的订单</a></li>
					<li class='fl dropdown'>
						<a href='' class='unav'>
						<span>我的美团</span>
						<i class='tri'></i>
						<i class='vertical-bar'></i>
						</a>
						<ul class='drop-menu'>
							<li><a href='' class='item'>我的订单</a></li>
							<li ><a href='' class='item'>我的评价</a></li>
							<li ><a href='' class='item'>我的收藏</a></li>
							<li ><a href='' class='item'>抵用券</a></li>
							<li ><a href='' class='item'>我的余额</a></li>
							<li ><a href='' class='item'>账户设置</a></li>
						</ul>
					</li>
					<li class='fl dropdown'>
						<a href='' class='unav'>
							<span>最近浏览</span>
							<i class='tri'></i>
							<i class='vertical-bar'></i>
						</a>
						<div class='drop-menu'>
							<ul>
								<li>
									<a><img src=''></a>
									<p><a href=''></a></p>
									<a>
										<span></span>
										<span></span>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class='fl dropdown'>
						<a href='' class='unav'>
							<span>联系客服</span>
							<i class='tri'></i>
							<i class='vertical-bar'></i>
						</a>
						<div class='drop-menu'>
							<ul>
								<li><a href='' class='item'>申请退款</a></li>
								<li><a href='' class='item'>申请退换货</a></li>
								<li><a href='' class='item'>查看美团劵</a></li>
								<li><a href='' class='item'>换绑手机号</a></li>
								<li><a href='' class='item'>常见问题</a></li>
							</ul>
						</div>
					</li>
					<li class='fl dropdown'>
						<a class='unav' href=''>
							<span>我是商家</span>
							<i class='tri'></i>
							<i class='vertical-bar'></i>
						</a>
						<div class='drop-menu'>
							<ul>
								<li><a href='' class='item'>登录商家中心</a></li>
								<li><a href='' class='item'>我想合作</a></li>
								<li><a href='' class='item'>商家营销平台</a></li>
								<li><a href='' class='item'>手机免费开店</a></li>
							</ul>
						</div>
					</li>
					<li class='fl dropdown'><a href='' class='unav'>城市招募</a></li>
					<li class='fl dropdown'>
						<a href='' class='unav'>
							<span>更多</span>
							<i class='tri'></i>
							<i class='vertical-bar'></i>
						</a>
						<div class='drop-menu'>
							<ul>
								<li><a href='' class='item'>手机版</a></li>
								<li><a href='' class='item'>邮件订阅</a></li>
								<li><a href='' class='item'>邀请好友</a></li>
							</ul>
						</div>	
					</li>
				</ul>
			</div>
		</div>
		<div class='m-main clearfix'>
			<a href='' class='fl u-logo'>
				<img src='images/logo.png'>
			</a>
			<div class='fl u-process'>
				<ol class='processlist clearfix'>
					<li class='step current'>1. 提交订单</li>
					<li class='step'>2. 选择支付方式</li>
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
	<div class='g-main'>
		<div class='m-body'>
			<form class='project clearfix' method="post" action="submitorder.jsp">
				<input type="hidden" name="action" value="order">
				<input type="hidden" name="price" value="<%=p.getMemberprice()%>">
				<input type="hidden" name="uid" value="<%=uid%>">
				<input type="hidden" name="pid" value="<%=pid%>">
				<div class='table-box'>
					<table>
						<tbody>
							<tr class='head-row'>
								<th class='desc'>项目</th>
								<th class='price'>单价</th>
								<th class='number'>数量</th>
								<th class='total'>总价</th>
							</tr>
							<tr>
								<td class='desc'>
									<a href=''>
                   						 每味每客:饮品甜点12选1，建议单人使用，提供免费WiFi
                					</a>
								</td>
								<td class='price'>
									￥<span id='permoney' ><%=p.getMemberprice()%></span>
								</td>
								<td class='quantity number'>
									<div class='quantity-box'>
										<button class='minus' type='button' id='minusbtn'>-</button>
										<input type='text' class='num' value='<%=count%>' id='quantityinput' name="count">
										<button class='add' type='button' id='addbtn'>+</button>
									</div>
								</td>
								<td class='total orange'>
								    ￥
									<span  id='amountmoney'><%=p.getMemberprice() %></span>
								</td>
							</tr>
							<tr class='discount'>
								<td colspan='4'>
									<div class='card'>
										<div class='cardcode'>
											<div class='clearfix ring'>
												<div class='fr'>
													<input type='checkbox' id='checkboxlabel'  name='useq'>
													<label for='use-card'>使用抵用券抵扣：</label>
													<span>
														￥
														<span>
															-0
														</span>
													</span>
												</div>
											</div>
											<div class='box dn' id='targetbox'>
												<div class='fr'>
													<input type='text' placeholder='输入抵用券密码' class='quananswer'>
													<a href='' class='verfy'>验证密码</a>
													<p class='orange remind'>请输入抵用券</p>
												</div>
												<div class='fr addquan'>
													添加抵用券
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan='3' class='total'>
									<strong>应付金额</strong>
									<span class='orange'>
										￥
										<strong id='allmoney'><%=p.getMemberprice() %></strong>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class='bindnewphone'>
					<p>

                         将发送美团券密码至手机号：
 					
                
						<span class='mobile'>
						<%
 							if((String)session.getAttribute("user") == null){
						%>
						<% 
							}
							
							else{
						%>
						<%=u.getPhone() %>
						
						<%
							}
					 	%>
					 </span>
						<a href='' class='link'>绑定新手机号</a>
					</p>
				</div>
				<div class='submit-box fr'>
					<input type='submit' class='submit-btn' value='提交订单'>
				</div>
			</form>
		</div>
	</div>
</body>
</html>