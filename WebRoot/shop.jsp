<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*,com.meituan.product.*" %> 
<%
	request.setCharacterEncoding("GBK");
	String user = (String)session.getAttribute("user");
	User u = new User();
	
	
 %>
 <%	
 		int count = 10;
 		List<Product> products = new ArrayList<Product>();
 		products = ProductManager.getInstance().getLatestProducts(count);
 		
 		
 
  %>
 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>重庆美团网-重庆美食餐厅酒店预订</title>
	<link rel="shortcut icon" href='images/tit.ico'>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/shop.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont2/iconfont.css">
	<script type="text/javascript" src = "js/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script> -->
	<script type="text/javascript" src='js/shopcarou.js'></script>
	<script type="text/javascript" src='js/shopaddress.js'></script>
	<!-- <script type="text/javascript" src='js/tab.js'></script> -->
</head>
<body>
	<div class="g-head">
		<div class="m-top user-nav">
			<div class="u-user clearfix">
				<ul class='u-binfo fl'>
					<li class='keep fl'>
						<a href=''>
							<i class='iconfont icon-shoucang1'></i>
							收藏美团
						</a>
					</li>
					<%
						
												
						if(user == null || user.trim().equals("")){	
							
 					%>
					<li class='userinfo fl'>
						<a href='login.jsp' class='login'>登录</a>
						<a href='regist.jsp'>注册</a>
					</li>
					<%
						}
						
						
						else
						{	
							u = User.getUserDetails(user);
							
							
					 %>
					 <li class='userinfo fl'>
						<a href='' class='login'><%=u.getUsername()%></a>
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
					<li class='fl dropdown orders'><a href='shopcart.jsp?uid=<%=u.getId()%>' >我的订单</a></li>
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
									<p class='title'><a href=''>美食</a></p>
									<ul class='content'>
										<li class='conitem bribe'><a href=''>代金券</a></li>
										<li class='conitem'><a href=''>甜点饮品</a></li>
										<li class='conitem'><a href='' class='hot'>火锅</a></li>
										<li class='conitem hot'><a href='' class='hot'>自助餐</a></li>
										<li class='conitem'><a href=''>川菜</a></li>
										<li class='conitem'><a href=''>湘菜</a></li>
										<li class='conitem'><a href=''>小吃快餐</a></li>
										<li class='conitem'><a href=''>其他美食</a></li>
										<li class='conitem'><a href=''>日韩料理</a></li>
										<li class='conitem'><a href=''>东北菜</a></li>
										<li class='conitem'><a href=''>聚餐宴请</a></li>
										<li class='conitem'><a href=''>西餐</a></li>
										<li class='conitem'><a href=''>香锅烤鱼</a></li>
										<li class='conitem'><a href=''>烧烤烤肉</a></li>
										<li class='conitem'><a href=''>江浙菜</a></li>
										<li class='conitem'><a href=''>中式烧烤/烤串</a></li>
									</ul>
									<ul class='content'>
										<li class='conitem'><a href=''>粤港菜</a></li>
										<li class='conitem'><a href=''>咖啡酒吧茶馆</a></li>
										<li class='conitem'><a href=''>西北菜</a></li>
										<li class='conitem'><a href=''>京菜鲁菜</a></li>
										<li class='conitem'><a href=''>云贵菜</a></li>
										<li class='conitem'><a href=''>东南亚菜</a></li>
										<li class='conitem'><a href=''>海鲜</a></li>
										<li class='conitem'><a href=''>素食</a></li>
										<li class='conitem'><a href=''>台湾/客家菜</a></li>
										<li class='conitem'><a href=''>创意菜</a></li>
										<li class='conitem'><a href=''>汤/粥/炖菜</a></li>
										<li class='conitem'><a href=''>蒙餐</a></li>
										<li class='conitem'><a href=''>新疆菜</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''>酒店/客栈</a></p>
									<i class='ricon'>
										<img src='images/shop/ricon.png'>
									</i>
									<p class='fr option'><a href=''>经济型酒店</a></p>
									
								</div>
								<div class='rightnav fall2'>
									<p class='title'><a href=''>酒店</a></p>
									<ul class='content'>
										<li class='conitem bribe'><a href='' class='hot'>经济型酒店</a></li>
										<li class='conitem'><a href=''>豪华酒店</a></li>
										<li class='conitem'><a href=''>度假酒店/度假村</a></li>
										<li class='conitem'><a href=''>主题酒店</a></li>
										<li class='conitem'><a href=''>公寓型酒店</a></li>
										<li class='conitem'><a href=''>客栈</a></li>
										<li class='conitem'><a href=''>青年旅社</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''> 电影/在线选座</a></p>
									<i class='ricon'>
										<img src='images/shop/ricon.png'>
									</i>
								</div>
								<div class='rightnav fall3 clearfix'>
								    <div class='fl'>
										<p class='title'><a href=''>当前热映</a></p>
										<ul class='content'>
											<li class='conitem'><a href=''>极限特工：终极回...</a></li>
											<li class='conitem'><a href=''>欢乐好声音</a></li>
											<li class='conitem'><a href=''>生化危机：终章</a></li>
											<li class='conitem'><a href=''>爱乐之城</a></li>
											<li class='conitem'><a href=''>刺客信条</a></li>
											<li class='conitem'><a href=''>功夫瑜伽</a></li>
											<li class='conitem'><a href=''>乘风破浪</a></li>
											<li class='conitem'><a href=''>游戏规则</a></li>
											<li class='conitem'><a href=''>完美有多美</a></li>
											<li class='conitem'><a href=''>上海王</a></li>
										</ul>
									</div>
									<div class='fl'>
									    <p class='title'><a href=''>热门影院</a></p>
										<ul class='content'>
											<li class='conitem'><a href=''>星美国际影城</a></li>
											<li class='conitem'><a href=''>CGV影城</a></li>
											<li class='conitem'><a href=''>越界影城</a></li>
											<li class='conitem'><a href=''>万达影城</a></li>
											<li class='conitem'><a href=''>UME国际影城</a></li>
											<li class='conitem'><a href=''>保利万和国际影城</a></li>
											<li class='conitem'><a href=''>百老汇影城</a></li>
											<li class='conitem'><a href=''>影立方</a></li>
											<li class='conitem'><a href=''>大地影院</a></li>
											<li class='conitem'><a href=''>沙坪坝电影院</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro'>
									<p class='fl title'><a href=''  class='conitem'> KTV</a></p>
								</div>
								<div class='rightnav fall4'></div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''> 休闲娱乐</a></p>
									<i class='ricon'>
										<img src='images/shop/ricon.png'>
									</i>
									<p class='fr option'><a href=''>足疗按摩</a><a href=''>温泉</a></p>
									
								</div>
								<div class='rightnav fall5'>
									<p class='title'><a href=''>休闲娱乐</a></p>
									<ul class='content'>
										<li class='conitem'><a href='' class='hot'>KTV</a></li>
										<li class='conitem'><a href=''>其他娱乐</a></li>
										<li class='conitem'><a href=''>演出赛事</a></li>
										<li class='conitem'><a href=''>电玩/游戏厅</a></li>
										<li class='conitem'><a href=''>运动健身</a></li>
										<li class='conitem'><a href=''>私人影院</a></li>
										<li class='conitem'><a href=''>足疗按摩</a></li>
										<li class='conitem'><a href=''>洗浴/汗蒸</a></li>
										<li class='conitem'><a href=''>中医养生</a></li>
										<li class='conitem'><a href=''>茶馆</a></li>
										<li class='conitem'><a href=''>棋牌</a></li>
										<li class='conitem'><a href=''>桌游</a></li>
										<li class='conitem'><a href=''>轰趴</a></li>
										<li class='conitem'><a href=''>温泉</a></li>
										<li class='conitem'><a href=''>采摘/农家乐</a></li>
										<li class='conitem'><a href=''>DIY手工</a></li>
									</ul>
									<ul class='content'>
										<li class='conitem'><a href=''>密室逃脱</a></li>
										<li class='conitem'><a href=''>酒吧</a></li>
										<li class='conitem'><a href=''>真人CS</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''> 周边游/旅游</a></p>
									<i class='ricon'>
										<img src='images/shop/ricon.png'>
									</i>
								</div>
								<div class='rightnav fall6'>
									<p class='title'><a href=''> 周边游</a></p>
									<ul class='content'>
										<li class='conitem bribe'><a href=''>温泉</a></li>
										<li class='conitem'><a href=''>景点</a></li>
										<li class='conitem'><a href=''>主题公园</a></li>
										<li class='conitem'><a href=''>水上乐园</a></li>
										<li class='conitem'><a href=''>动植物园</a></li>
										<li class='conitem'><a href=''>海洋馆</a></li>
										<li class='conitem'><a href=''>展览馆</a></li>
										<li class='conitem'><a href=''>游船</a></li>
										<li class='conitem'><a href=''>高空观景</a></li>
										<li class='conitem'><a href=''>真人CS</a></li>
										<li class='conitem'><a href=''>漂流</a></li>
										<li class='conitem'><a href=''>单车出租</a></li>
										<li class='conitem'><a href=''>其他游玩</a></li>
										<li class='conitem'><a href=''>演出赛事</a></li>
										<li class='conitem'><a href=''>农家乐</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem clearfix'>
								<div class='itemintro'>
									<p class='fl title'><a href=''>生活服务</a></p>
									<i class='ricon'>
										<img src='images/shop/ricon.png'>
									</i>
									<p class='fr option'><a href=''>婚纱摄影</a><a href=''>个性写真</a></p>
								</div>
								<div class='rightnav fall7'>
									<p class='title'><a href=''>生活服务</a></p>
									<ul class='content'>
										<li class='conitem bribe'><a href=''>婚纱摄影</a></li>
										<li class='conitem'><a href=''>个性写真</a></li>
										<li class='conitem'><a href=''>亲子摄影</a></li>
										<li class='conitem'><a href=''>其他摄影</a></li>
										<li class='conitem'><a href=''>培训课程</a></li>
										<li class='conitem'><a href=''>其他生活</a></li>
										<li class='conitem'><a href=''>汽车服务</a></li>
										<li class='conitem'><a href=''>体检/齿科</a></li>
										<li class='conitem'><a href=''>衣物/皮具洗护</a></li>
										<li class='conitem'><a href=''>鲜花</a></li>
										<li class='conitem'><a href=''>母婴亲子</a></li>
										<li class='conitem'><a href=''>配镜</a></li>
										<li class='conitem'><a href=''>照片冲印</a></li>
										<li class='conitem'><a href=''>商场购物卡</a></li>
										<li class='conitem'><a href=''>服饰鞋包</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''> 丽人</a></p>
									<i class='ricon'>
										<img src='images/shop/ricon.png'>
									</i>
									<p class='fr option'><a href=''>美发</a><a href=''>美甲美睫</a></p>
								</div>
								<div class='rightnav fall8'>
									<p class='title'><a href=''>丽人</a></p>
									<ul class='content'>
										<li class='conitem'><a href=''>美发</a></li>
										<li class='conitem'><a href=''>美容美体</a></li>
										<li class='conitem'><a href=''>美甲美睫</a></li>
										<li class='conitem'><a href=''>瑜伽舞蹈</a></li>
										<li class='conitem'><a href=''>瘦身纤体</a></li>
										<li class='conitem'><a href=''>韩式定妆</a></li>
										<li class='conitem'><a href=''>祛痘</a></li>
										<li class='conitem'><a href=''>纹身</a></li>
									</ul>

								</div>
							</div>
						</div>
						<div class='bot'>
							<div class='u-navitem'>
								<div class='itemintro clearfix'>
									<p class='fl title'><a href=''>今日新单</a></p>
								</div>
								<div class='rightnav fall9'></div>
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
	<div class='g-main'>
		<div class='m-content'>
			<div class='content-header'>
				<div class=''>
					<div class='floor clearfix'>
						<div class='slidplacel'>
							<div class='place'>
								<div class='content-cell cell-hot'>
									<h3>
										<i class='iconfont icon-weibiaoti2'></i>
										<span class='celtit'>热门团购</span>
									</h3>
									<div class='strip'>
										<ul class='strip-list'>
											<li class='list-item'><a href='' class='hot'>火锅</a></li>
											<li class='list-item '><a href='' class='hot'>自助餐</a></li>
											<li class='list-item'><a href=''>小吃快餐</a></li>
											<li class='list-item'><a href=''>聚餐宴请</a></li>
											<li class='list-item'><a href=''>甜点饮品</a></li>
											<li class='list-item'><a href=''>川菜</a></li>
											<li class='list-item'><a href=''>烧烤烤肉</a></li>
											<li class='list-item'><a href=''>海鲜</a></li>
											<li class='list-item'><a href=''>京菜鲁菜</a></li>
										</ul>
									</div>
								</div>
								<div class='content-cell cell-area'>
									<h3>
										<i class='iconfont icon-place'></i>
										<span class='celtit'>热门团购</span>
									</h3>
									<div class='strip'>
										<ul class='strip-list'>
											<li class='list-item'><a href=''>渝中区</a></li>
											<li class='list-item'><a href=''>江北区</a></li>
											<li class='list-item'><a href=''>沙坪坝区</a></li>
											<li class='list-item'><a href=''>渝北区</a></li>
											<li class='list-item'><a href=''>大渡口区</a></li>
											<li class='list-item'><a href=''>九龙坡区</a></li>
											<li class='list-item'><a href=''>南岸区</a></li>
											<li class='list-item'><a href=''>北碚区</a></li>
											<li class='list-item'><a href=''>巴南区</a></li>
										</ul>
									</div>
								</div>
								<div class='content-cell cell-trade'>
									<h3>
										<i class='iconfont icon-fangzi'></i>
										<span class='celtit'>热门商圈</span>
									</h3>
									<div class='strip'>
										<ul class='strip-list'>
											<li class='list-item'><a href=''>解放碑</a></li>
											<li class='list-item'><a href=''>三峡广场</a></li>
											<li class='list-item'><a href=''>较场口</a></li>
											<li class='list-item'><a href=''>大坪</a></li>
											<li class='list-item'><a href=''>北城天街/九街</a></li>
											<li class='list-item'><a href=''>杨家坪</a></li>
											<li class='list-item'><a href=''>大学城</a></li>
											<li class='list-item'><a href=''>观音桥</a></li>
											<li class='list-item'><a href=''>两路口</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class='slide-box' id='slideBox'>
								<div class='promotion' id='promotion'>
									<ul class='slider'  id='slider'>
										<li class='sheet'>
											<div class='left clearfix'>
												<em class='discount'>7.5</em>
												<a href=''>
													<img src='images/shop/carou1.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>小鲜肉锡箔花甲</a>
													<p class='desc'>秘制锡箔花甲1份，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>15.8</strong>
												</span>
											</div>
											<div class='right clearfix'>
												<em class='discount'>7.5</em>
												<a href=''>
													<img src='images/shop/carou2.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>汉丽轩烤肉自助餐厅</a>
													<p class='desc'>自助晚餐，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>52.9</strong>
												</span>
											</div>
										</li>
										<li class='sheet'>
											<div class='left clearfix'>
												<em class='discount'>8.8</em>
												<a href=''>
													<img src='images/shop/carou3.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>金诺郎韩式养生自助烤肉</a>
													<p class='desc'>特惠自助韩式烤肉，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>59</strong>
												</span>
											</div>
											<div class='right clearfix'>
												<em class='discount'>9</em>
												<a href=''>
													<img src='images/shop/carou4.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>星象师饭吧</a>
													<p class='desc'>限时体验双人套餐，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>19.9</strong>
												</span>
											</div>
										</li>
										<li class='sheet'>
											<div class='left clearfix'>
												<em class='discount'>7.5</em>
												<a href=''>
													<img src='images/shop/carou5.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>欧式饼屋</a>
													<p class='desc'>12英寸冰激凌鲜奶水果蛋糕1个，3种口味任选其一</p>
												</div>
												<span class='price'>
													￥<strong>69.8</strong>
												</span>
											</div>
											<div class='right clearfix'>
												<em class='discount'>1.6</em>
												<a href=''>
													<img src='images/shop/carou6.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>云雅阙博物馆主题餐厅</a>
													<p class='desc'>体验套餐，建议2人使用，有赠品，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>38</strong>
												</span>
											</div>
										</li>
										<li class='sheet'>
											<div class='left clearfix'>
												<em class='discount'>5.1</em>
												<a href=''>
													<img src='images/shop/carou7.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>好食寨海鲜自助火锅</a>
													<p class='desc'>单人自助火锅晚餐，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>38</strong>
												</span>
											</div>
											<div class='right clearfix'>
												<em class='discount'>4.4</em>
												<a href=''>
													<img src='images/shop/carou8.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>木之义蛋糕</a>
													<p class='desc'>蛋糕12选1,约8英寸，圆</p>
												</div>
												<span class='price'>
													￥<strong>78</strong>
												</span>
											</div>
										</li>
										<li class='sheet'>
											<div class='left clearfix'>
												<em class='discount'>8.2</em>
												<a href=''>
													<img src='images/shop/carou9.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>桃太郎の屋</a>
													<p class='desc'>桃太郎双人餐，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>88</strong>
												</span>
											</div>
											<div class='right clearfix'>
												<em class='discount'>6.6</em>
												<a href=''>
													<img src='images/shop/carou10.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>斗十千精细日本料理</a>
													<p class='desc'>招牌双人餐，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>298</strong>
												</span>
											</div>
										</li>
										<li class='sheet'>
											<div class='left clearfix'>
												<em class='discount'>5.8</em>
												<a href=''>
													<img src='images/shop/carou11.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>解放碑威斯汀酒店 思悦兹</a>
													<p class='desc'>蛋糕4选1,约6寸，圆形</p>
												</div>
												<span class='price'>
													￥<strong>150</strong>
												</span>
											</div>
											<div class='right clearfix'>
												<em class='discount'>6.9</em>
												<a href=''>
													<img src='images/shop/carou12.jpg'>
												</a>
												<div class='title'>
													<a href='' class='link'>味我可遇日式料理</a>
													<p class='desc'>精致2人餐，提供免费WiFi</p>
												</div>
												<span class='price'>
													￥<strong>108</strong>
												</span>
											</div>
										</li>
									</ul>
									<div class='pre-next'>
										<a href='javascript:void(0);' class='arrow' id='previous'><</a>
										<a href='javascript:void(0);' class='arrow' id='next'>></a>
									</div>
								</div>
							</div>
						</div>
						<div class='u-image'>
							<div class='img'>
							<img src='images/sao.png'>
							</div>
						</div>
						<div class='u-fresh'>
							<ul class='newtopic'>
								<li class='sheet'>
									<a href='' class='wrap'>
										<div class='top-title'>
											<p class='newtit'>每日上新</p>
											<p class='newtit newdesc'>吃喝玩乐最低价</p>
											<img src='images/fresh.png' class='newimg'>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class='content-body'>
			    <div class='famous'>
			    	
			    </div>
				<div class='category-list'>
					<div class='category-floor'  id='food'>
						<div class='floor-title clearfix'>
							<a href='' class='fl ltit'>
								<i class='iconfont icon-meishi'>
									
								</i>美食
							</a>
							<ul class='categories fr'>
								<li class='cateitem'><a href=''>美食</a></li>
								<li class='cateitem'><a href=''>代金券</a></li>
								<li class='cateitem'><a href=''>自助餐</a></li>
								<li class='cateitem'><a href=''>火锅</a></li>
								<li class='cateitem'><a href=''>烧烤烤肉</a></li>
								<li class='cateitem'><a href=''>香锅烤鱼</a></li>
								<li class='cateitem'><a href=''>西餐</a></li>
								<li class='cateitem'><a href=''>全部></a></li>
							</ul>
						</div>
						
						<div class='floor-body'>
						
							<div class='itemlist clearfix'>
							<%
									for(Iterator<Product> it = products.iterator();it.hasNext();){
										Product p = it.next();
									
								 %>
								<div class='item fl'>
									<div class='imgbox'>
										<a href='speshop.jsp?pid=<%=p.getId() %>&uid=<%=u.getId() %>' class='link'>
											<img src='images/food/f1.webp'>
											<span class='mark'>
												<span class='mark-item taocan'></span>
												<span class='mark-item yuyue'></span>
											</span>
										</a>
									</div>
									<h3>
										<a href='speshop.jsp?id=<%=p.getId() %>'>
											<span class='uptit'><%=p.getName() %></span>
											<span class='detailtit'><%=p.getDescr() %></span>
										</a>
									</h3>
									<p class='pvs'>
										<span class='price'>
											￥<strong><%=p.getMemberprice() %></strong>
										</span>
										<span class='value'>
											门店价
											<del class='num'>
											    ￥
												<span><%=p.getNormalprice() %></span>
											</del>
										</span>
										<span class='sales fr'>
											已售
											<strong class='num'>1234</strong>
										</span>
										
									</p>
									<div class='extrainfo'>
										<p>
											<a href='speshop.jsp?id=<%=p.getId() %>'>
												<span class='rate-star fr'>
													<span class='stars'></span>
												</span>
												<span class='rate-count fr'>4307人评价</span>
											</a>
										</p>
									</div>
								</div>
								<%
									}
								 %>
						</div>
						
					</div>	
					<div class='category-floor' id='movie'>
						<div class='floor-title clearfix'>
							<a href='' class='fl ltit'>
								<i class='iconfont icon-dianying1'></i>电影
							</a>
							<ul class='categories fr'>
								<li class='cateitem'><a href=''>电影</a></li>
								<li class='cateitem'><a href=''>电影票团购</a></li>
								<li class='cateitem'><a href=''>电影院</a></li>
								<li class='cateitem'><a href=''>在线选座</a></li>
								<li class='cateitem'><a href=''>最新电影</a></li>
								<li class='cateitem'><a href=''>全部></a></li>
							
							</ul>
						</div>
						<div class='floor-body'>
							<div class='itemlist clearfix'>
								<div class='item fl'>
									<div class='imgbox'>
										<a href='' class='link'>
											<img src='images/movie/m0.webp'>
											<span class='mark'>
												<span class='mark-item taocan'></span>
												<span class='mark-item yuyue'></span>
											</span>
										</a>
									</div>
									<h3>
										<a href=''>
											<span class='uptit'>【4店通用】吴优留香排骨</span>
											<span class='detailtit'>特色留香排骨大份1份，提供免费WiFi</span>
										</a>
									</h3>
									<p class='pvs'>
										<span class='price'>
											￥<strong>26.9</strong>
										</span>
										<span class='value'>
											门店价
											<del class='num'>
											    ￥
												<span>30</span>
											</del>
										</span>
										<span class='sales fr'>
											已售
											<strong class='num'>1234</strong>
										</span>
										
									</p>
									<div class='extrainfo'>
										<p>
											<a href=''>
												<span class='rate-star fr'>
													<span class='stars'></span>
												</span>
												<span class='rate-count fr'>4307人评价</span>
											</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class='floor-foot'>
							<a href='' class='link'>
								<span>更多美食团购请点击查看</span>
								<i class='in'>></i>
							</a>
						</div>
					</div>
					<div class='category-floor' id='hotel'>
						<div class='floor-title clearfix'>
							<a href='' class='fl ltit'>
								<i class='iconfont icon-jiudian1'></i>酒店
							</a>
							<ul class='categories fr'>
								<li class='cateitem'><a href=''>酒店</a></li>
								<li class='cateitem'><a href=''>经济型酒店</a></li>
								<li class='cateitem'><a href=''>主题酒店</a></li>
								<li class='cateitem'><a href=''>豪华酒店</a></li>
								<li class='cateitem'><a href=''>全部></a></li>
								
							</ul>
						</div>
						<div class='floor-body'>
							<div class='itemlist clearfix'>
								<div class='item fl'>
									<div class='imgbox'>
										<a href='' class='link'>
											<img src='images/hotel/hotel0.webp'>
											<span class='mark'>
												<span class='mark-item taocan'></span>
												<span class='mark-item yuyue'></span>
											</span>
										</a>
									</div>
									<h3>
										<a href=''>
											<span class='uptit'>【4店通用】吴优留香排骨</span>
											<span class='detailtit'>特色留香排骨大份1份，提供免费WiFi</span>
										</a>
									</h3>
									<p class='pvs'>
										<span class='price'>
											￥<strong>26.9</strong>
										</span>
										<span class='value'>
											门店价
											<del class='num'>
											    ￥
												<span>30</span>
											</del>
										</span>
										<span class='sales fr'>
											已售
											<strong class='num'>1234</strong>
										</span>
										
									</p>
									<div class='extrainfo'>
										<p>
											<a href=''>
												<span class='rate-star fr'>
													<span class='stars'></span>
												</span>
												<span class='rate-count fr'>4307人评价</span>
											</a>
										</p>
									</div>
								</div>
							</div>	
						</div>
					</div>
						
						<div class='floor-foot'>
							<a href='' class='link'>
								<span>更多美食团购请点击查看</span>
								<i class='in'>></i>
							</a>
						</div>
					</div>
					<div class='category-floor' id='lifeservice'>
						<div class='floor-title clearfix'>
							<a href='' class='fl ltit'>
								<i class='iconfont icon-shenghuofuwu1'></i>生活服务
							</a>
							<ul class='categories fr'>
								<li class='cateitem'><a href=''>生活服务</a></li>
								<li class='cateitem'><a href=''>培训课程</a></li>
								<li class='cateitem'><a href=''>母婴亲子</a></li>
								<li class='cateitem'><a href=''>配镜</a></li>
								<li class='cateitem'><a href=''>其他摄影</a></li>
								<li class='cateitem'><a href=''>体检/齿科</a></li>
								<li class='cateitem'><a href=''>汽车服务</a></li>
								<li class='cateitem'><a href=''>全部></a></li>
							</ul>
						</div>
						<div class='floor-body'>
							<div class='itemlist clearfix'>
								<div class='item fl'>
									<div class='imgbox'>
										<a href='' class='link'>
											<img src='images/living/l0.webp'>
											<span class='mark'>
												<span class='mark-item taocan'></span>
												<span class='mark-item yuyue'></span>
											</span>
										</a>
									</div>
									<h3>
										<a href=''>
											<span class='uptit'>【4店通用】吴优留香排骨</span>
											<span class='detailtit'>特色留香排骨大份1份，提供免费WiFi</span>
										</a>
									</h3>
									<p class='pvs'>
										<span class='price'>
											￥<strong>26.9</strong>
										</span>
										<span class='value'>
											门店价
											<del class='num'>
											    ￥
												<span>30</span>
											</del>
										</span>
										<span class='sales fr'>
											已售
											<strong class='num'>1234</strong>
										</span>
										
									</p>
									<div class='extrainfo'>
										<p>
											<a href=''>
												<span class='rate-star fr'>
													<span class='stars'></span>
												</span>
												<span class='rate-count fr'>4307人评价</span>
											</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class='floor-foot'>
							<a href='' class='link'>
								<span>更多美食团购请点击查看</span>
								<i class='in'>></i>
							</a>
						</div>
					</div>
					<div class='category-floor' id='liren'>
						<div class='floor-title clearfix'>
							<a href='' class='fl ltit'>
								<i class='iconfont icon-liren1'></i>丽人
							</a>
							<ul class='categories fr'>
								<li class='cateitem'><a href=''>丽人</a></li>
								<li class='cateitem'><a href=''>美发</a></li>
								<li class='cateitem'><a href=''>瑜伽舞蹈</a></li>
								<li class='cateitem'><a href=''>全部></a></li>
							</ul>
						</div>
						<div class='floor-body'>
							<div class='itemlist clearfix'>
								<div class='item fl'>
									<div class='imgbox'>
										<a href='' class='link'>
											<img src='images/liren/lr0.webp'>
											<span class='mark'>
												<span class='mark-item taocan'></span>
												<span class='mark-item yuyue'></span>
											</span>
										</a>
									</div>
									<h3>
										<a href=''>
											<span class='uptit'>【4店通用】吴优留香排骨</span>
											<span class='detailtit'>特色留香排骨大份1份，提供免费WiFi</span>
										</a>
									</h3>
									<p class='pvs'>
										<span class='price'>
											￥<strong>26.9</strong>
										</span>
										<span class='value'>
											门店价
											<del class='num'>
											    ￥
												<span>30</span>
											</del>
										</span>
										<span class='sales fr'>
											已售
											<strong class='num'>1234</strong>
										</span>
										
									</p>
									<div class='extrainfo'>
										<p>
											<a href=''>
												<span class='rate-star fr'>
													<span class='stars'></span>
												</span>
												<span class='rate-count fr'>4307人评价</span>
											</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class='floor-foot'>
							<a href='' class='link'>
								<span>更多美食团购请点击查看</span>
								<i class='in'>></i>
							</a>
						</div>
					</div>
					<div class='category-floor' id='trip'>
						<div class='floor-title clearfix'>
							<a href='' class='fl ltit'>
								<i class='iconfont icon-lvyou'></i>旅游
							</a>
							<ul class='categories fr'>
								<li class='cateitem'><a href=''>旅游</a></li>
								<li class='cateitem'><a href=''>景点门票</a></li>
								<li class='cateitem'><a href=''>国内游</a></li>
								<li class='cateitem'><a href=''>境外游</a></li>
								<li class='cateitem'><a href=''>全部></a></li>
							</ul>
						</div>
						<div class='floor-body'>
							<div class='itemlist clearfix'>
								<div class='item fl'>
									<div class='imgbox'>
										<a href='' class='link'>
											<img src='images/trip/trip0.webp'>
											<span class='mark'>
												<span class='mark-item taocan'></span>
												<span class='mark-item daijinquan'></span>
											</span>
										</a>
									</div>
									<h3>
										<a href=''>
											<span class='uptit'>【4店通用】吴优留香排骨</span>
											<span class='detailtit'>特色留香排骨大份1份，提供免费WiFi</span>
										</a>
									</h3>
									<p class='pvs'>
										<span class='price'>
											￥<strong>26.9</strong>
										</span>
										<span class='value'>
											门店价
											<del class='num'>
											    ￥
												<span>30</span>
											</del>
										</span>
										<span class='sales fr'>
											已售
											<strong class='num'>1234</strong>
										</span>
									</p>
									<div class='extrainfo'>
										<p>
											<a href=''>
												<span class='rate-star fr'>
													<span class='stars'></span>
												</span>
												<span class='rate-count fr'>4307人评价</span>
											</a>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class='floor-foot'>
							<a href='' class='link'>
								<span>更多美食团购请点击查看</span>
								<i class='in'>></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class='elevator' id='elevator'>
				<div class='element' id='element'>
					<ul class='alist'>
						<li class='item current'>
							<a class='link food' href='#food'>
								<i class='iconfont icon-meishi'></i>
								<span>美食</span>
							</a>
						</li>
						<li class='item'>
							<a  class='link xiuxian' href='#xiuxian'>
								<i class='iconfont icon-xiuxianyule1'></i>
								<span>休闲娱乐</span>
							</a>
						</li>
						<li class='item'>
							<a  class='link movie' href='#movie'>
								<i class='iconfont icon-dianying1'></i>
								<span>电影</span>
							</a>
						</li>
						<li class='item'>
							<a  class='link hotel' href='#hotel'>
								<i class='iconfont icon-jiudian1'></i>
								<span>酒店</span>
							</a>
						</li>
						<li class='item'>
							<a  class='link lifeservice' href='#lifeservice'>
								<i class='iconfont icon-shenghuofuwu1'></i>
								<span>生活服务</span>
							</a>
						</li>
						<li class='item'>
							<a  class='link liren' href='#liren'>
								<i class='iconfont icon-liren1'></i>
								<span>丽人</span>
							</a>
						</li>
						<li class='item'>
							<a  class='link trip' href='#trip'>
								<i class='iconfont icon-lvyou'></i>
								<span>旅游</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class='g-addreco'>
		<div class='m-link'>
			<div class='info-fence'>
				<ul class='gromlist'>
					<li class='gromitem current'>
						<a  href='javascript:void(0)'>团购分类</a>
					</li>
					<li class='gromitem'>
						<a  href='javascript:void(0)'>热门地标</a>
					</li>
					<li class='gromitem'>
						<a  href='javascript:void(0)'>周边城市</a>
					</li>
					<li class='gromitem'>
						<a  href='javascript:void(0)'>品牌推荐</a>
					</li>
					<li class='gromitem'>
						<a  href='javascript:void(0)'>专题推荐</a>
					</li>
					<li class='gromitem'>
						<a  href='javascript:void(0)'>品类推荐</a>
					</li>
					<li class='gromitem'>
						<a  href='javascript:void(0)'>友情链接</a>
					</li>
				</ul>
			</div>
			<div class='m-recontent dbk'>
				<a href=''>美食团购</a>
				<a href=''>电影团购</a>
				<a href=''>休闲娱乐团购</a>
				<a href=''>旅游团购</a>
				<a href=''>生活服务团购</a>
				<a href=''>购物团购</a>
				<a href=''>丽人团购</a>
				<a href=''>网购评论</a>
				<a href=''>品牌团购</a>
				<a href=''>专题团购</a>
				<a href=''>美团团购</a>
			</div>
			<div class='m-recontent dn'>
				<a href=''>观音桥团购</a>
				<a href=''>解放碑团购</a>
				<a href=''>南坪团购</a>
				<a href=''>杨家坪团购</a>
				<a href=''>大坪团购</a>
				<a href=''>观音桥团购</a>
				<a href=''>解放碑团购</a>
				<a href=''>杨家坪团购</a>
				<a href=''>南坪团购</a>
				<a href=''>大坪团购</a>
				<a href=''>观音桥团购</a>
				<a href=''>解放碑团购</a>
				<a href=''>杨家坪团购</a>
				<a href=''>南坪团购</a>
				<a href=''>大坪团购</a>
				<a href=''>观音桥团购</a>
				<a href=''>解放碑团购</a>
				<a href=''>杨家坪团购</a>
				<a href=''>南坪团购</a>
				<a href=''>大坪团购</a>
				<a href=''>观音桥团购</a>
				<a href=''>解放碑团购</a>
				<a href=''>杨家坪团购</a>
				<a href=''>南坪团购</a>
				<a href=''>大坪团购</a>
				<a href=''>观音桥团购</a>
				<a href=''>解放碑团购</a>
			</div>
			<div class='m-recontent dn'>
				<a href=''>杭州团购</a>
				<a href=''>宁波团购</a>
				<a href=''>无锡团购</a>
				<a href=''>南京团购</a>
				<a href=''>合肥团购</a>
				<a href=''>武汉团购</a>
				<a href=''>成都团购</a>
				<a href=''>青岛团购</a>
				<a href=''>大连团购</a>
				<a href=''>沈阳团购</a>
				<a href=''>长沙团购</a>
				<a href=''>郑州团购</a>
				<a href=''>石家庄团购</a>
			</div>
			<div class='m-recontent dn'>
				<a href=''>ONEMORE</a>
				<a href=''>益家优点</a>
				<a href=''>胡氏大盘鸡</a>
				<a href=''>德庄</a>
				<a href=''>GOSSELINcake阁瑟林</a>
				<a href=''>真味料自助无烟烧烤</a>
				<a href=''>诸葛烤鱼</a>
				<a href=''>九月烘焙工坊</a>
				<a href=''>东京四谷姜太公</a>
				<a href=''>吉尼咖啡</a>
				<a href=''>华庭自助百汇</a>
				<a href=''>锦程大酒店</a>
				<a href=''>面包新语</a>
			</div>
			<div class='m-recontent dn'>
				<a href=''>桂林景点门票团购</a>
				<a href=''>无忧团购导航网</a>
				<a href=''>美心团购</a>
				<a href=''>实惠团购</a>
				<a href=''>胶州团购网站</a>
				<a href=''>乐山电影票 团购</a>
				<a href=''>凯德广场美食团购</a>
				<a href=''>石家庄火锅团购</a>
				<a href=''>横店门票团购</a>
				<a href=''>宿州酒店团购</a>
				<a href=''>广州水疗馆团购</a>
				<a href=''>纯棉四件套团购</a>
				<a href=''>最大团购网</a>
			</div>
			<div class='m-recontent dn'>
				<a href=''>杭州洗浴/汗蒸</a>
				<a href=''>杭州电器/数码</a>
				<a href=''>杭州蛋糕</a>
				<a href=''>杭州儿童乐园</a>
				<a href=''>杭州主题公园/游乐园</a>
				<a href=''>杭州演出/赛事/展览</a>
				<a href=''>杭州东北菜</a>
				<a href=''>杭州香锅烤鱼</a>
				<a href=''>杭州鲁菜/北京菜</a>
				<a href=''>杭州足疗按摩</a>
				<a href=''>杭州台湾菜/客家菜</a>
			</div>
			<div class='m-recontent dn'>
				<a href=''>大众点评网</a>
				<a href=''>大众点评下载</a>
				<a href=''>亲子</a>
				<a href=''>家装</a>
				<a href=''>结婚</a>
				<a href=''>教育</a>
				<a href=''>宴会</a>
			</div>

		</div>
	</div>
	<div class='g-foot'>
		<div class='u-sitefirm'>
			<div class='info clearfix'>
				<div class='info-item'>
					<h3>获取更新</h3>
					<ul>
						<li><a href=''>邮件订阅</a></li>
						<li><a href=''>iPhone/Android</a></li>
						<li><a href=''>美团QQ空间</a></li>
						<li><a href=''>美团新浪微博</a></li>
						<li><a href=''>sitemap</a></li>
						<li><a href=''>RSS订阅</a></li>
					</ul>
				</div>
				<div class='info-item'>
					<h3>商务合作</h3>
					<ul>
						<li><a href=''>商家合作</a></li>
						<li><a href=''>美团商家营销平台</a></li>
						<li><a href=''>到店餐饮代理商招募</a></li>
						<li><a href=''>市场合作</a></li>
						<li><a href=''>美团联盟</a></li>
						<li><a href=''>美团云</a></li>
						<li><a href=''>廉正邮箱</a></li>
					</ul>
				</div>
				<div class='info-item'>
					<h3>公司信息</h3>
					<ul>
						<li><a href=''>关于美团</a></li>
						<li><a href=''>美团承诺</a></li>
						<li><a href=''>媒体报道</a></li>
						<li><a href=''>加入我们</a></li>
						<li><a href=''>法律声明</a></li>
						<li><a href=''>用户协议</a></li>
						<li><a href=''>美团点评餐饮安全管理办法</a></li>
					</ul>
				</div>
				<div class='info-item'>
					<h3>用户帮助</h3>
					<ul>
						<li><a href=''>申请退款</a></li>
						<li><a href=''>查看美团券密码</a></li>
						<li><a href=''>常见问题</a></li>
						<li><a href=''>开放API</a></li>
						<li><a href=''>反诈骗公告</a></li>
					
					</ul>
				</div>
				<div class='info-item item-service'>
					<div class='content'>
						<i class='hotline'></i>
						<p class='phonetit'>客服电话</p>
						<p class='phonetime'>
							<span class='phone'>10107888</span>
							<span class='time'>(9:00-23:00)</span>
						</p>
						<p class='desc'>退款、退换货、查看美团券</p>
						<p class='cankao'><a href=''>参考教程，轻松搞定!</a></p>
					</div>
				</div>
			</div>
		</div>
		<div class='u-copyright'>
			<p>
				&copy;<span>2017</span>
				<a href=''>美团网团购</a>
				<a href=''>京ICP证070791号</a>
				<a href=''>京ICP备10211739号</a>
				<a href=''> 电子公告服务规则</a>
			</p>
		</div>
		<div class='u-certlang'>
			<a href=''>广播电视节目制作经营许可证（京）字第03889号</a>
			<a href='' class='underno'>
				<img src='images/jing.png'>
				<span>京公网安备11010502025545号</span>
			</a>
		</div>
		<div class='u-certimg'>
			<ul class='imglist'>
				<li><a href='' class='beian'></a></li>
				<li><a href='' class='wz'></a></li>
				<li><a href='' class='xf'></a></li>
				<li><a href='' class='wq'></a></li>
			</ul>
		</div>
	</div>
	<div class='u-gotop'>
		<div class='top' id='gotop'>
			<a>
				<i></i>
				<span>回到顶部</span>
			</a>
		</div>
		<div class='vote'>
			<a>
				<i ></i>
				<span>问卷调查</span>
			</a>
		</div>
		<div class='help'>
			<a>
				<i></i>
				<span>帮助中心</span>
			</a>
		</div>
		<div class='feedback'>
			<a>
				<i></i>
				<span>意见反馈</span>
			</a>
		</div>
	</div>
</body>
</html>