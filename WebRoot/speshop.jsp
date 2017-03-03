<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.meituan.user.*,com.meituan.product.*,com.meituan.company.*" %> 
<%@ include file="_sessioncheck.jsp" %>

<%
	request.setCharacterEncoding("GBK");
	int pid = Integer.parseInt(request.getParameter("pid"));
	int uid = Integer.parseInt(request.getParameter("uid"));
	
	Product p = new Product();
	Company cp = new Company();
	p = ProductManager.getInstance().getProduct(pid);
	cp = CompanyManager.getInstance().loadById(p.getCid());
	
	
 %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel=" shortcut icon" href='images/tit.ico'>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/speshop.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont2/iconfont.css">
	<script type="text/javascript" src = "js/jquery.min.js"></script>
	<script type="text/javascript" src='js/jquery-migrate-1.2.1.min.js'></script>
	<script type='text/javascript' src='js/speshop.js'></script>
	<script type='text/javascript' src='js/btn.js'></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<script type="text/javascript" src='js/spe-carou.js'></script>
	<script type="text/javascript" src='js/searchtab.js'></script>
	
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
						String username = (String)session.getAttribute("user");
						
						if(username == null || username.trim().equals("")){
							
					 %>
					<li class='userinfo fl'>
						<a href='' class='login'>登录</a>
						<a href=''>注册</a>
					</li>
					<%
						}else{
					 %>
					 <li class='userinfo fl'>
						<a href='' class='username'><%=username %></a>
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
				<form action='submitorder.jsp' method="post" class='u-form clearfix'>
				
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
			    <div class='fl left'>
					<span class='clasify'>全部分类</span>
					<i class='iconfont icon-jiantouxia' id='iconfontjiao'></i>
					<div class='u-navbox' id='unavbox'>
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
										<li class='conitem'><a href=''>火锅</a></li>
										<li class='conitem'><a href=''>自助餐</a></li>
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
										<li class='conitem bribe'><a href=''>经济型酒店</a></li>
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
										<li class='conitem'><a href=''>KTV</a></li>
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
									<div class=></div>
								</div>
								<div class='rightnav fall9'>
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
								<div class='rightnav fall7'>
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
		<div class='m-bdw clearfix'>
			<div class='u-tit'>
				
			</div>
			<div class='u-topcontain clearfix'>
				<div class='headline fl'>
					<div class='head-tit clearfix'>
						<span class='tit-componentl fl'>【<%=cp.getCompanylocation() %>】</span>
						<h1 class='tit-componentr fl'><%=cp.getCompanyName()%></h1>
					</div>
					<div class='head-desc'>
						<p><%=p.getDescr() %></p>
					</div>
				</div>
				<div class='content clearfix'>
					<div class='conleftimg fl'>
						<div class='lazyrend'>
							<div class='compimg'>
								<div class='img-gallery' id='imgallery'>
									<div class='coverimg' id='coverimgs'>
										<div class='carou clearfix' id='carou'>
											<img src='images/spe-area/contain0.jpg'>
											<img src='images/spe-area/contain1.jpg'>
											<!-- <img src='images/spe-area/contain0.jpg'>
											<img src='images/spe-area/contain1.jpg'> -->
										</div>
										<a href='javascript:void(0);' class='arrow control-left' id='previous'><</a>
										<a href='javascript:void(0);' class='arrow control-right' id='next'>></a>
									</div>
									<div class='candimgs' id='candimgs'>
										<a class='current'><img src='images/spe-area/display1.jpg' ></a>
										<a><img src='images/spe-area/display2.jpg'></a>
										<!-- <a><img src='images/spe-area/display1.jpg'></a>
										<a><img src='images/spe-area/display2.jpg'></a> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class='conrightinfo fl'>
						<div class='lazyrend'>
							<div class='price'>
								<div class='compoprice clearfix'>
									<span class='group fl leading'>团购价</span>
									<h2 class='currprice orange fl'>
										<span class='symbol fl'>￥<%=p.getMemberprice() %></span>					
									</h2>
									<span class='defaultprice fl'>
										<span>门店价</span>
										<del> ¥<%=p.getNormalprice() %></del>
									</span>
								</div>
							</div>
							<div class='rating'>
								<span class='item'>
								    已售
									<span class='orange'>111</span>
								</span>
								<span class='verbar'></span>
								<span class='item viewed'>
									<a href=''>
										<span>
											<span></span>
										</span>
									</a>
									<a href=''>
										<span class='orange'>4.8</span>分
									</a>
								</span>
								<span class='verbar'></span>
								<span class='item comments'>
									<a href=''>
										<span class='orange'>54</span>人评价
									</a>
								</span>
							</div>
							<div class='expiry'>
								<span class='leading titexpiry'>有效期</span>
								<span class='content'>
									<span class='deadline'>截止到2017.03.19</span>
									<span class='orange'>周末、法定节假日通用</span>
								</span>
							</div>
							<form class='quantcontain' method="post" action="submitorder.jsp">
								<input type="hidden" name="pid" value="<%=pid%>">
								<input type="hidden" name="uid" value="<%=uid%>">
								<div class='content'>
									<div class='quantity'>
										<span class='leading'>数量</span>
										<button class='minus' type='button' id='minusbtn'>-</button>
										<input type='text' class='quantin' id='quantityinput' value='1' name="count">
										<button class='add' type='button' id='addbtn'>+</button>
									</div>
									<div class='purchase'>
									
										<input type='submit' class='btn-buy'>
										<a href='' class='small-btn'>
											<i class='iconfont icon-shoucang1'></i>
											<span>收藏</span>(<b>18</b>)
										</a>
										<a href='' class='small-btn share'>
											<i class='iconfont icon-fenxiang'></i>
											<span >分享到</span>
										</a>
									</div>
								</div>
							</form>
							<div class='promise'>
								<span class='leading'>
									服务承诺
								</span>
								<span class='proitem'>
									<a href='' class='suishitui'><i></i>随时退</a>
									<a href='' class='guoqitui'><i></i>过期退</a>
									<a href='' class='jisutui'><i></i>极速退</a>
									<a href='' class='pingjia'><i></i>真实评价</a>
								</span>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class='u-content fl'>
				<div class='detail-tips'>
					<div class='detail-text'>
						<p>亲爱的用户，本次团购有效期延长至2017年03月19日，感谢您的支持，祝消费愉快~</p>
					</div>
				</div>
				<div class='smoothscroll' id='smoothscroll'>
						<div class='nav-bar' id='navbar'>
							<ul class='navlist clearfix'>
								<li class='navitem current'><a href='#businessinfo' class='weizhi'>商家位置</a></li>
								<li class='navitem'><a href='#purchaseinfo' class='xuzhi'>购买须知</a></li>
								<li class='navitem'><a href='#detail' class='xiangqing'>本单详情</a></li>
								<li class='navitem'><a href='#introduce' class='jieshao'>商家介绍</a></li>
								<li class='navitem'><a href='#reviews' class='pingjia'>消费评价<span class='num'>(54)</span></a></li>
							</ul>
							<div class='btn' id='qbtn'>
								<a class='qbtn'>抢购</a>
							</div>
						</div>
				</div>
				<div class='detail-staff'>
					<div class='content'>
						<div class='upmain'>
							<div class='intro'>
								<div class='business-address' id='businessinfo'>
									<h2 class='contit'>商家位置</h2>
									<div class='spe-business'>
										<div class='loadimg'>
										</div>
										<div class='addcontent clearfix'>
											<div class='leftcon fl' id='map'>
												
											</div>
											<div class='rightcon fr'>
												<div class='infotext'>
													<h5 class='info-tit'><a href=''><%=cp.getCompanyName()%></a></h5>
													<div class='speinfo'>
														<div class='item'>
															<span class='ltit'>地址：</span>
															<span class='substance'><%=cp.getCompanyAddr() %></span>
														</div>
														<div class='item pad'>
															<a href=''>查看地图</a>
															<a href=''>公交/驾车去这里</a>
														</div>
														<div class='item'>
															<span class='ltit'>地铁：</span>
															<span class='substance'>距沙坪坝站约291米</span>
														</div>
														<div class='item'>
															<span class='ltit'>电话：</span>
															<span class='substance'><%=cp.getCompanyPhone() %></span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class='notice' id='purchaseinfo'>
									<h2 class='contit'>购买须知</h2>
									<dl>
										<dt>有效期</dt>
										<dd>2015.3.27 至 2017.3.19（周末、法定节假日通用）</dd>
										<dt>使用时间</dt>
										<dd>美团券24小时可用</dd>
										<dt>预约方式</dt>
										<dd>提前预约即可，提前预约即可</dd>
										<dt>入住须知</dt>
										<dd>入住需要押金，金额以前台为准,并出示身份证（一人一证）普通大床房钟点房限住2名成人入住，身高1.2米（不含）以上算成人请不要携带宠物入住
										</dd>
										<dt>使用规则</dt>
										<dd>
											<!-- <ul>
												<li>不可与其他优惠同享</li>
												<li>美团券密码一旦验证即代表消费成功，不可申请“随时退款”和“过期退款”，请您合理安排验证时间</li>
												<li>多张美团券可以叠加使用</li>
											</ul> -->
										</dd>
									</dl>
								</div>
								<div class='circumstance' id='detail'>
									<h2 class='contit'>本单详情</h2>
									<div class='cirtext'>
										<p class='standardbar'>温馨入住</p>
										<ul class='clearfix'>
											<li><img src='images/spe-area/icon_kuandai.jpg'></li>
											<li><img src='images/spe-area/icon_tool.jpg'></li>
											<li><img src='images/spe-area/icon_wifi.jpg'></li>
											<li><img src='images/spe-area/icon_yu.jpg'></li>
										</ul>
										<table class='deal-menu'>
											<tbody>
												<tr>
													<th class='name'>套餐内容</th>
													<th></th>
													<th class='price'>单价</th>
													<th class='num'>数量/规格</t>
													<th class='subtotal'>小计</th>
												</tr>
												<tr>
													<td rowspan='1' class='subline'>
														<span class='title'>房型</span>
													</td>
													<td class='name'><%=p.getDescr() %></td>
													<td class='price'>¥<%=p.getNormalprice() %></td>
													<td class='number'>1间</td>
													<td class='subtotal'>¥<%=p.getNormalprice() %></td>
												</tr>
											</tbody>
										</table>
										<p class='summary'>
											价值<span class='worth'>￥<%=p.getNormalprice() %></span>
											美团价
											<span class='worth price'>
												￥<%=p.getMemberprice() %>
								
											</span>
										</p>
										<ul class='infolist'>
											<li>不含早餐；提供免费宽带服务+免费WiFi服务+热水洗浴</li>
											<li>普通大床房钟点房有窗</li>
											<li>普通大床房钟点房：1张大床1.8×2.0米</li>
										</ul>
									</div>
								</div>
								<div class='busintro' id='introduce'>
									<h2 class='contit'>商家介绍</h2>
									<p class='standardbar'>名居酒店</p>
									<div class='standard-content'>
										<p class='gray'>
											※以下为部分房间图，店内各房型略有差异，以商家实际安排为准。
										</p>
										<p>重庆名居酒店坐落于重庆市沙坪坝区三峡广场横店电影院楼上，处于沙坪坝区黄金地段，紧邻磁器口景区和文化中心（重庆大学、重庆师范大学、一三八重点中学)文化氛围浓厚。周边交通便捷，商业发达，购物便捷，楼下有约30万平方米商业购物中心，餐饮、银行、学校、医院、大型超市、娱乐等各种配套设施功能齐全。有多条公交及地铁快速抵达全城各区，方便快捷。距重庆江北机场和朝天门码头仅约30分钟车程，距陈家坪长途汽车站约15分钟车程，距解放碑约30分钟车程，交通十分便利。酒店均为独立户型，三米大窗，房间内设有冷暖空调，有线电视，免费6M宽带，免费wifi，家一样的温馨自在；房间宽敞大方，干净整洁，通风舒适，设施齐全；规范物管24小时保安值守，安全可靠，名居酒店将以个性化的优质服务为您营造一个便捷、安全、时尚、温馨的“家”，是宾客商务、旅游、休闲、出差的理想家园。酒店拥有不同类型的客房，供你选择。名居酒店热诚欢迎您的光临。
										</p>
										<img class='standard-img' src='images/spe-area/display1.jpg'>
										<img class='standard-img' src='images/spe-area/display2.jpg'>
										<img class='standard-img' src='images/spe-area/display4.jpg'>
									</div>
								</div>
							</div>
							<div class='anchorviews' id='reviews'>
								<div class='overview'>
									<div class='title'>
										<h2 class='contit'>消费评价</h2>
									</div>
									<div class='detail clearfix'>
										<div class='rate total'>
											<div class='group score'>
												<span>
													<span class='orange aver'>4.8</span>分
												</span>
											</div>
											<div class='group star'>
												<span class='outer'>
													<span class='rate-star'></span>
												</span>
											</div>
											<div class='group'>
												共<strong class='orange'>54</strong>人评价
											</div>
										</div>
										<div class='rate count'>
											<div class='wrap'>
												<div class='group'>
													<span class='score'>1分</span>
													<span class='percent-box'>
														<em class='percent'></em>
													</span>
													0人
												</div>
												<div class='group'>
													<span class='score'>2分</span>
													<span class='percent-box'>
														<em class='percent'></em>
													</span>
													0人
												</div>
												<div class='group'>
													<span class='score'>3分</span>
													<span class='percent-box'>
														<em class='percent'  style='width: 3.7%'></em>
													</span>
													2人
												</div>
												<div class='group'>
													<span class='score'>4分</span>
													<span class='percent-box'>
														<em class='percent'  style='width: 11.11%'></em>
													</span>
													6人
												</div>
												<div class='group'>
													<span class='score'>5分</span>
													<span class='percent-box'>
														<em class='percent'></em>
													</span>
													46人
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class='comments'>
									<div class='commentswrap'>
										<ul class='connav clearfix'>
											<li class='item'><a href='' class='link active-link'>全部</a></li>
											<li class='item'><a href='' class='link'>晒图评价</a></li>
											<li class='item'><a href=''  class='link'>只看低分</a></li>
											<li class='item push-right'>
												<div>
													
												</div>
												<div></div>
											</li>
										</ul>
										<div class='comments-content'>
											<ul class='comments-list'>
												<li class='comments-item clearfix'>
													<div class='user fl'>
														<div class='avatar-wrap'>
															<img src='images/spe-area/user.jpg' class='avatar'>
														</div>
														<p class='name-wrap'>
															<span class='name'>我是你哥</span>
															<span class='growth'>
																<i></i>
															</span>
														</p>
													</div>
													<div class='viewcontent fl'>
														<div class='timeinfo clearfix'>
															<div class='star fl'>
																<span class='outer'>
																	<span class='rate-star'></span>
																</span>
															</div>
															<span class='time'>2016-01-24</span>
														</div>
														<div class='view'>
															<p class='text'>
                    											地理位置不错，下楼就是三峡广场，逛街购物、交通都很方便，地铁三号线也在附近。房间设施齐全，也还算干净，布置得挺温馨的。老板人很好，我们是晚上八点多的火车，十一点多退了房以后还可以把行李寄存在她那里，总之，还是很满意的！下次去重庆还会选择这家店的！
															</p>
															<div class='images'>
																	<div class='image-list'>
																		<div class='pic-content'>
																			<ul class='pic-list'>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																			</ul>
																			<a href=''></a>
																			<a href=''></a>
																		</div>
																	</div>
															</div>
														</div>
														<div class='reply'>
															商家回复：尊贵的宾客：感谢您选择并入住本酒店，并给予我们五星好评，这是对我们最大的支持与肯定。入住过程中有任何问题可拨打酒店前台【24小时热线电话023-81958880】我们会在第一时间，力所能及的给您提供方便，如您在酒店入住过程中遇到任何服务质量问题可随时拨打我们的【投诉电话：13228588880】我们会给您一个满意的处理方式，希望您下次能再选择我们酒店，期待您的再次光临！
														</div>
													</div>
												</li>
												<li class='comments-item clearfix'>
													<div class='user fl'>
														<div class='avatar-wrap'>
															<img src='images/spe-area/user.jpg' class='avatar'>
														</div>
														<p class='name-wrap'>
															<span class='name'>我是你哥</span>
															<span class='growth'>
																<i></i>
															</span>
														</p>
													</div>
													<div class='viewcontent fl'>
														<div class='timeinfo clearfix'>
															<div class='star fl'>
																<span class='outer'>
																	<span class='rate-star'></span>
																</span>
															</div>
															<span class='time'>2016-01-24</span>
														</div>
														<div class='view'>
															<p class='text'>
                    											地理位置不错，下楼就是三峡广场，逛街购物、交通都很方便，地铁三号线也在附近。房间设施齐全，也还算干净，布置得挺温馨的。老板人很好，我们是晚上八点多的火车，十一点多退了房以后还可以把行李寄存在她那里，总之，还是很满意的！下次去重庆还会选择这家店的！
															</p>
															<div class='images'>
																	<div class='image-list'>
																		<div class='pic-content'>
																			<ul class='pic-list'>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																			</ul>
																			<a href=''></a>
																			<a href=''></a>
																		</div>
																	</div>
															</div>
														</div>
														<div class='reply'>
															商家回复：尊贵的宾客：感谢您选择并入住本酒店，并给予我们五星好评，这是对我们最大的支持与肯定。入住过程中有任何问题可拨打酒店前台【24小时热线电话023-81958880】我们会在第一时间，力所能及的给您提供方便，如您在酒店入住过程中遇到任何服务质量问题可随时拨打我们的【投诉电话：13228588880】我们会给您一个满意的处理方式，希望您下次能再选择我们酒店，期待您的再次光临！
														</div>
													</div>
												</li>
												<li class='comments-item clearfix'>
													<div class='user fl'>
														<div class='avatar-wrap'>
															<img src='images/spe-area/user.jpg' class='avatar'>
														</div>
														<p class='name-wrap'>
															<span class='name'>我是你哥</span>
															<span class='growth'>
																<i></i>
															</span>
														</p>
													</div>
													<div class='viewcontent fl'>
														<div class='timeinfo clearfix'>
															<div class='star fl'>
																<span class='outer'>
																	<span class='rate-star'></span>
																</span>
															</div>
															<span class='time'>2016-01-24</span>
														</div>
														<div class='view'>
															<p class='text'>
                    											地理位置不错，下楼就是三峡广场，逛街购物、交通都很方便，地铁三号线也在附近。房间设施齐全，也还算干净，布置得挺温馨的。老板人很好，我们是晚上八点多的火车，十一点多退了房以后还可以把行李寄存在她那里，总之，还是很满意的！下次去重庆还会选择这家店的！
															</p>
															<div class='images'>
																	<div class='image-list'>
																		<div class='pic-content'>
																			<ul class='pic-list'>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																			</ul>
																			<a href=''></a>
																			<a href=''></a>
																		</div>
																	</div>
															</div>
														</div>
														<div class='reply'>
															商家回复：尊贵的宾客：感谢您选择并入住本酒店，并给予我们五星好评，这是对我们最大的支持与肯定。入住过程中有任何问题可拨打酒店前台【24小时热线电话023-81958880】我们会在第一时间，力所能及的给您提供方便，如您在酒店入住过程中遇到任何服务质量问题可随时拨打我们的【投诉电话：13228588880】我们会给您一个满意的处理方式，希望您下次能再选择我们酒店，期待您的再次光临！
														</div>
													</div>
												</li>
												<li class='comments-item clearfix'>
													<div class='user fl'>
														<div class='avatar-wrap'>
															<img src='images/spe-area/user.jpg' class='avatar'>
														</div>
														<p class='name-wrap'>
															<span class='name'>我是你哥</span>
															<span class='growth'>
																<i></i>
															</span>
														</p>
													</div>
													<div class='viewcontent fl'>
														<div class='timeinfo clearfix'>
															<div class='star fl'>
																<span class='outer'>
																	<span class='rate-star'></span>
																</span>
															</div>
															<span class='time'>2016-01-24</span>
														</div>
														<div class='view'>
															<p class='text'>
                    											地理位置不错，下楼就是三峡广场，逛街购物、交通都很方便，地铁三号线也在附近。房间设施齐全，也还算干净，布置得挺温馨的。老板人很好，我们是晚上八点多的火车，十一点多退了房以后还可以把行李寄存在她那里，总之，还是很满意的！下次去重庆还会选择这家店的！
															</p>
															<div class='images'>
																	<div class='image-list'>
																		<div class='pic-content'>
																			<ul class='pic-list'>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																				<li><a href=''><img src=''></a></li>
																			</ul>
																			<a href=''></a>
																			<a href=''></a>
																		</div>
																	</div>
															</div>
														</div>
														<div class='reply'>
															商家回复：尊贵的宾客：感谢您选择并入住本酒店，并给予我们五星好评，这是对我们最大的支持与肯定。入住过程中有任何问题可拨打酒店前台【24小时热线电话023-81958880】我们会在第一时间，力所能及的给您提供方便，如您在酒店入住过程中遇到任何服务质量问题可随时拨打我们的【投诉电话：13228588880】我们会给您一个满意的处理方式，希望您下次能再选择我们酒店，期待您的再次光临！
														</div>
													</div>
												</li>
											</ul>
											<div class='page-wrap'>
												<ul class='page'>
													<li class='first-page'>
														<span>首页</span>
													</li>
													<li class='previous'>
														<i></i>
														<span>上一页</span>
													</li>
													<li class='current'>
														<span>1</span>
													</li>
													<li class='pagelink'>
														<a href=''>2</a>
													</li>
													<li class='pagelink'>
														<a href=''>3</a>
													</li>
													<li class='next'>
														<i></i>
														<a href=''>下一页</a>
													</li>
													<li class='last-page'>
														<a href=''>尾页</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='bottom-buy'>
							
						</div>
					</div>
				</div>
				<div class='mobile-link'>
					<a href=''>
						<img src='images/spe-area/mobile.png'>
					</a>
				</div>
			</div>
			<div class='u-sidebar fr'>
				<div class='sideimg'>
					<div class='box'>
						<a href='' class='up'></a>
					</div>
					<div class='box'>
						<a href='' class='down'></a>
					</div>
				</div>
				<div class='scaning' id='scaning'>
					<div class='content'>
						<h3 class='clearfix'>最近浏览 <a class='clean' id='clean'>清空</a></h3>
						<ul id='scanbox'>
							<li class='imgitem clearfix'>
								<img src='images/spe-area/side1.jpg'>
								<h5>
									<a href=''>卡玛发艺-【靓丽精剪造型】单人女士专享精致洗剪吹</a>
								</h5>
								<p>
									<em class='price'>￥21</em>
									<span class='default-price'>门店价￥<del>58</del></span>
								</p>
							</li>
							<li class='imgitem clearfix'>
								<img src='images/spe-area/side4.jpg'>
								<h5>
									<a href=''>重庆三峰泉酒店1晚+双人三峰泉温泉门票+双早</a>
								</h5>
								<p>
									<em class='price'>￥538</em>
									<span class='default-price'>门店价￥<del>668</del></span>
								</p>
							</li>
							<li class='imgitem clearfix'>
								<img src='images/spe-area/side1.jpg'>
								<h5>
									<a href=''>卡玛发艺-【靓丽精剪造型】单人女士专享精致洗剪吹</a>
								</h5>
								<p>
									<em class='price'>￥21</em>
									<span class='default-price'>门店价￥<del>58</del></span>
								</p>
							</li>
						</ul>
					</div>
				</div>
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
				<li><a href='' class='xf'></a><s/li>
				<li><a href='' class='wq'></a></li>
			</ul>
		</div>
	</div>
	
	 <script>
		// var map = new BMap.Map("map"); // 创建地图实例
         //var point = new BMap.Point(116.404, 39.915); // 创建点坐标
       //map.centerAndZoom(point, 15); 
   		var map = new BMap.Map("map");    // 创建Map实例
	     
	     map.centerAndZoom(new BMap.Point(106.501816,29.581987),14);//初始化地图,设置中心点坐标和地图级别 
	     map.enableScrollWheelZoom(true);
	</script> 
</body>
</html>