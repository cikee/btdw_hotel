<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		//如果用户未登录,把其隐藏
		if($(".user").html()==""){
			$("#clean").html("")
			$(".loading").css("display","block")
			$(".login").css("display","block")
		}
		
		if($(".user").html()){
			 $(".loading").css("display","none")
			 $(".login").css("display","none")
		}
		
	})
</script>
</head>
<body>
	<div id="btd_zonghe">
		<!--第一个div,导航条-->
		<div id="btd_d1">
			<div id="top_logo_left">
				<h1>
					<a href=""> <span style="color: #FFF;"> 碧涛达维&emsp;<span
							style="color: #FFCE14;">酒店</span></span>
						<p id="logo_caption"
							style="color: #FFCE14; font-size: 10px; letter-spacing: 10px;">你梦想的度假胜地</p>
					</a>
				</h1>
			</div>
			<div id="top_logo_right">
				<ul>
				
				<% 
				String username=(String)session.getAttribute("username");
				
		/* 		Cookie[] cs=request.getCookies();
					for(Cookie c :cs){
						if(c.getName().equals("username")){
							String username=c.getValue();
							request.setAttribute("name", username);
						
						}
						
					} */
				%>
					<li id="logo_menu_first"><a href="#" id="logo_link_first">主页</a>
					</li>
					<!--菜单 -> 主页 -->
					<li><a href="reserve/reserve_hotel" id="logo_link">预定房间</a></li>
					<li><a href="food/hotel_food" id="logo_link" class="eatFood">订餐</a></li>
					<li><a href="#" id="logo_link">联系方式</a></li>
					<li><a href="loading" id="logo_link" class="loading" style="display:blcok">登录</a></li>
					<li><a href="login" id="logo_link" class="login" style="display:blcok">注册</a></li>
					<li id="clean" style="margin-left:100px;">用户名:<a href="myorder" id="logo_link" class="user" style="display:blcok">${username}</a></li>
				</ul>
			</div>
		</div>
		<!--第二个div,图片轮换-->
		<div id="but_tp">
			<img src="img/1.jpg" id="tp_1" />
			<div id="but_Wenzk">
				<div id="but_Wenz">
					<h4>碧涛达维酒店</h4>
					<h3>我们知道你爱什么</h3>
					<p id="but_huany">欢迎来到我们酒店</p>
				</div>
				<div id="but_htp">
					<input type="button" id="0" onclick="hqq(0)" /> <input
						type="button" id="1" onclick="hqq(1)" /> <input type="button"
						id="2" onclick="hqq(2)" />
				</div>
			</div>

		</div>
		<script type="text/javascript">
				setInterval(htp, 5000);
				var imgs = ["img/1.jpg", "img/2.jpg", "img/3.jpg"]; /*获取图片*/
				var ipts = document.getElementsByTagName("input")
				var x = 0;

				function htp() {
					x++;

					if(x > imgs.length - 1) {
						x = 0;
					}
					tp_1.src = imgs[x];
					ipts[0].style.background = "gainsboro";
					ipts[1].style.background = "gainsboro";
					ipts[2].style.background = "gainsboro";
					ipts[x].style.background = "orange";

				}

				function hqq(a) {
					tp_1.src = imgs[a];
					ipts[0].style.background = "gainsboro";
					ipts[1].style.background = "gainsboro";
					ipts[2].style.background = "gainsboro";
					ipts[a].style.background = "orange";
					x = a;
				}
			</script>

		<div id="btd_chax">

			<div id="btd_chax_left">
				<h2>查询房间</h2>
			</div>
			<div id="btd_chax_right">
				<div id="btd_chax_Fangj">
					<p style="margin-bottom: 10px;">房间类型</p>
					<select>
						<option>选择一个房间</option>
						<option>豪华客房</option>
						<option>高级客房</option>
						<option>单人间</option>
						<option>双人间</option>
					</select>
				</div>
				<div id="btd_chax_Ruzhu">
					<p style="margin-bottom: 10px;">入住日期</p>
					<input type="date" id="date" value="年月日" />
				</div>

				<div id="btd_chax_Tuif">
					<p style="margin-bottom: 10px;">退房日期</p>
					<input type="date" id="date" value="年月日" />
				</div>
				<div id="btd_chax_Dianc">
					<input type="submit" id="" value="点击查询" />
				</div>
			</div>

		</div>

		<div style="margin-top: 30px; background: #333333;">
			<div id="btd_fuwuxm">
				<h3 style="font-size: 48px; padding: 32px;">服务项目</h3>

				<div id="btd_fuw_zongh">

					<div id="btd_fuw_left">
						<img src="img/qianb.jpg" />
						<h4>先留后付</h4>
						<p>工作与时间的安排都是必要的</p>
						<p>
							<i><img src="img/yes.jpg" /></i>精装的房间,舒适的空间
						</p>
						<p>
							<i><img src="img/yes.jpg" /></i>单独的阳台
						</p>
					</div>

					<div id="btd_fuw_right">
						<img src="img/time2.jpg" />
						<h4>24小时用餐</h4>
						<p>工作与时间的安排都是必要的</p>
						<p>
							<i><img src="img/yes.jpg" /></i>24小时客房服务
						</p>
						<p>
							<i><img src="img/yes.jpg" /></i>24小时前台服务
						</p>
					</div>
				</div>

			</div>
		</div>
		<div></div>
	</div>
</body>
</html>