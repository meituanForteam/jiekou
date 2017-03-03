<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*,com.meituan.cart.*,com.meituan.order.*" %> 
<%@ include file="_sessioncheck.jsp" %>
<jsp:useBean id="cart" class="com.meituan.cart.Cart" scope="session"></jsp:useBean>
<%
	String strId = request.getParameter("uid");
	int id = 0;
	if(strId != null && !strId.trim().equals("")){
		id = Integer.parseInt(strId);
		
	}
	List<SaleOrder> so = new ArrayList<SaleOrder>();
	OrderManager.getInstance().getOrders(so,id); 
	
 %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>团购订单|美团网重庆站</title>
	<link rel='shortcut icon' href='images/tit.ico'>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/shopcart.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<script type="text/javascript" src = "js/jquery.min.js"></script>
	<script type='text/javascript' src='js/shopcart.js'></script>
</head>
<body>
    <div class='delConfirm' id='delConfirm'>
    	<div class='content'>
			<h3 class='head-tip'>提示</h3>
			<div class='body clearfix'>
				<span class='icon'></span>
				<div class='textbox'>
				    <p class='del-tit'>确定删除订单？</p>
					<p class='del-detail'>删除后本订单将从订单列表消失，且不能恢复。</p>
					<div class='check'>
						<input type='checkbox' id='delcomments'>
						<label for='delcomments'>同时删除我的评价(删除评价不会影响积分)</label>
					</div>
					<div class='action'>
						<a class='btn delbtn' id='delbtn'>
							确定
						</a>
						<a class='btn close' id='close'>
							取消
						</a>
					</div>
				</div>
			</div>
    	</div>
    </div>
    <div class='mask' id='mask'></div>
	<div class="g-head">
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
						User u = User.getUserDetail(id);
					 %>
					<li class='userinfo fl'>
						<a href='' class='username'><%=u.getUsername() %></a>
						<a href='' class='quit'>退出</a>
					</li>
					<li class='dropdown fl'>
						<a href=''>
							<span>消息</span>
							<i></i>
						</a>
					</li>
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
		<div class='m-search'>
		    <a href='' class='u-commitment fr'>
				<span class='comitem'>
					 <i class="iconfont icon-tui1"></i>
					<span class=''>随时退</span>
				</span>
				<span class='comitem'>
					<i class='iconfont icon-bumanyimiandan'></i>
					<span class='motop'>不满意免单</span>
				</span>
				<span class='comitem'>
					<i class='iconfont icon-guoqitui'></i>
				   <span class='motop'>过期退</span>
				</span>
			</a>
			<div class='u-logo fl'>
				<a href=''></a>	
			</div>
			<div class='u-city fl'>
				<h3><a href=''>重庆</a></h3>
				<a href='' class='togcity'>切换城市</a>
			</div>
			<div class='u-search'>
				<form action='' class='u-form clearfix'>
					<div class='u-tabs fl'>
						<span class='tri' id='tri'></span>
						<ul class='search-tabs' id='sertab'>
							<li class='tab-item' id='business'>商家</li>
							<li class='tab-item' id='groupgo'>团购</li>
						</ul>
					</div>
					<input type='text' class='fl search-input' placeholder='请输入商品名称地址等'>
					<input type='submit' class='search-submit' value='搜索'>
				</form>
				<div class='suggest-list'>
					<a href=''>烤鸭</a>
					<a href=''>火锅</a>
					<a href=''>美味美客</a>
					<a href=''>顺水鱼丸</a>
					<a href=''>一只酸奶牛</a>
					<a href=''>烤全羊</a>
					<a href=''>韩厨</a>
					<a href=''>必胜客</a>
				</div>
			</div>
		</div>
		<div class='m-lnav'>
			<div class='u-ltnav clearfix'>
			    <div class='fl'>
					<span class='clasify'>全部分类</span>
					<div class='u-navbox'>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''>美食</a></p>
									<i class='ricon'>
										<img src='images/shop/ricon.png'>
									</i>
									<p class='fr option'><a href=''>自助餐</a><a href=''>代金券</a></p>
								</div>
								<div class='rightnav fall1'>
									
								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''>今日新单</a></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class='u-rnav fl'>
					<ul class='u-linenav'>
						<li class='nav-bar'><a href='' class='navitem'>首页</a></li>
						<li class='nav-bar'><a href='' class='navitem'>今日新单</a></li>
						<li class='nav-bar'><a href='' class='navitem'>美食</a></li>
						<li class='nav-bar'><a href='' class='navitem'>身边外卖</a></li>
						<li class='nav-bar'><a href='' class='navitem'>名单抢购</a></li>
					</ul>
			    </div>
			</div>
		</div>
	</div>
	<div class='g-body'>
		<div class='m-main clearfix'>
			<div class='u-nav fl'>
				<dl>
					<dd class='head-item'>
						<ul>
							<li><a href=''>我的主页</a></li>
						</ul>
					</dd>
					<dt>
						<strong>我的订单</strong>
					</dt>
					<dd>
						<ul class='navlist'>
							<li class='current' >
								<a>团购订单</a>
							</li>
							<li>
								<a>其他订单</a>
							</li>
							<li>
								<a>电影选座</a>
							</li>
							<li>
								<a>酒店预订</a>
							</li>
							<li>
								<a>我的抽奖</a>
							</li>
							<li>
								<a>我的收藏</a>
							</li>
						</ul>
					</dd>
					<dt>
						<strong>我的评价</strong>
					</dt>
					<dd>
						<ul class='navlist'>
							<li>
								<a>待评价</a>
							</li>
							<li>
								<a >已评价</a>
							</li>
						</ul>
					</dd>
					<dt>
						<strong>退款维权</strong>
					</dt>
					<dd>
						<ul class='navlist'>
							<li><a>我的退款</a></li>
						</ul>
					</dd>
					<dt>
						<strong>我的账户</strong>
					</dt>
					<dd>
						<ul class='navlist'>
							<li><a >抵用券</a></li>
							<li><a >我的余额</a></li>
							<li><a >账户设置</a></li>
							<li><a >安全中心</a></li>
						</ul>
					</dd>
				</dl>
			</div>
			<div class='u-content fl'>
				<div class='bodybox'>
					<select>
						<option value='all' selected='selected'>全部状态</option>
						<option value='unused'>未消费</option>
						<option value='expiring'>即将到期</option>
						<option value='unpaied'>未付款</option>
						<option value='used'>已使用</option>
						<option value='expired'>已过期</option>
					</select>
					<div class='info-tips'>
						快捷提示：您有
						<a href=''>未付款(<span class='unpaied' id='unpaied'></span>)</a>
					</div>
					
					<div class='orderwrap'>
						<div class='order-head clearfix'>
							<div class='order-cell order-info' >团购信息</div>
							<div class='order-cell order-number'>数量</div>
							<div class='order-cell order-money'>总价</div>
							<div class='order-cell order-status'>订单状态</div>
							<div class='order-cell order-pay'>操作</div>
						</div>
						<%
							for(Iterator<SaleOrder> it = so.iterator();it.hasNext();){
								SaleOrder s = it.next();
						 %>
						<div class='order'>
							<div class='order-title'>
								订单编号：
								<a href=''>353674</a>
								<form action='' method=''>
									<span></span>
									<a href='javascript:void(0);' class='del'>
									</a>
								</form>
							</div>
							<div class='ordercon clearfix'>
								<div class='orderbox'>
									<div class='order-cell order-info clearfix'>
										<div class='infocontain clearfix'>
											<a class='img fl'>
												<img src='images/shopcart/shangpin.jpg'>
											</a>
											<div class='text fr'>
												<a href=''><%=s.getCart().getItems() %></a>
												<p>团购结束：2017-02-25</p>
												<a href='' class='business'>商家信息</a>
											</div>
										</div>
									</div>
									<div class='order-cell order-number'>1</div>
									<div class='order-cell order-money'>
										<span>￥10.80</span>
									</div>
									<div class='order-cell order-status'>
										 <span>未付款<span>
										 <p><a href=''>订单详情</a></p>
									</div>
									<div class='order-cell order-pay'>
										<a href=''>付款</a>
									</div>
								</div>
							</div>
						</div>
						<%} %>
						<div class='order'>
							<div class='order-title'>
								订单编号：
								<a href=''>353674</a>
								<form action='' method=''>
									<span></span>
									<a href='javascript:void(0);' class='del'>
										
									</a>
								</form>
							</div>
							<div class='ordercon clearfix'>
								<div class='orderbox'>
									<div class='order-cell order-info clearfix'>
										<div class='infocontain clearfix'>
											<a class='img fl'>
												<img src='images/shopcart/shangpin1.jpg'>
											</a>
											<div class='text fr'>
												<a href=''>每味每客饮品甜点12选1</a>
												<p>团购结束：2017-02-25</p>
												<a href='' class='business'>商家信息</a>
											</div>
										</div>
									</div>
									<div class='order-cell order-number'>1</div>
									<div class='order-cell order-money'>
										<span>￥10.80</span>
									</div>
									<div class='order-cell order-status'>
										 <span>未付款<span>
										 <p><a href=''>订单详情</a></p>
									</div>
									<div class='order-cell order-pay'>
										<a href=''>付款</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>