<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/top.css" />
		<link rel="stylesheet" href="css/myorder.css" />
	</head>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js" ></script>
	<body>
		<div id="btd_d1">
			<div id="top_logo_left">
				<h1>
					<a href=""> 
						<span style="color: #FFF;"> 碧涛达维 <span style="color: #FFCE14;">酒店</span></span>
						<p id="logo_caption" style="color: #FFCE14; font-size: 10px; letter-spacing: 10px;">你梦想的度假胜地</p>
					</a>
				</h1>
			</div>
			<div id="top_logo_right">
				<ul>
					<li id="logo_menu_first"><a href="index" id="logo_link_first">主页</a>
					</li>
					<!--菜单 -> 主页 -->
					<li><a href="reserve/reserve_hotel" id="logo_link">预定房间</a></li>
					<li><a href="food/hotel_food" id="logo_link">订餐</a></li>
					<li><a href="#" id="logo_link">联系方式</a></li>
					<li style="margin-left:100px;">用户名:<a id="logo_link" class="user" style="display:blcok">${username}</a></li>
					<li>
						<a href="loading" id="logo_link" class="exit">退出</a>
					</li>
					
				</ul>
			</div>
		</div>
		
		
		<div class="pagebody" id="pagebody">
			<div class="leftpage">
				<div class="left-head">
					<div class="img"><img src="img/img1.png" width="70px" height="70px"></div>
					<div class="text" ><h3 id="username">${username}</h3></div>
					<ul>
						<a id="l-a" href="#"><p>优惠券</p>
							<h2>3</h2>
						</a>
						<a id="l-j" href="#"><p>积分</p>
							<h2>0</h2>
						</a>
						<a id="l-t" href="#"><p>特权券</p>
							<h2>1</h2>
						</a>
					</ul>
				</div>
				
				<div class="menu-list">
					<ul>
						<a id="m-l-one" ><p>个人首页</p></a>
						<a id="m-l-tow" href="#"><p>我的订单</p></a>
						 <a id="m-l-three" href="#"><p>我的订餐</p></a>
						<!-- <a id="m-l-forw" href="#"><p>积分查询</p></a> -->
						<a id="m-l-five" href="#"><p>基本信息</p></a>
					</ul>
				</div>
			</div>
			<div class="rightpage" id="rightpagee">
				
			</div>
			
		</div>
		<script type="text/javascript">
			$(function(){
				doLoadUI("m-l-one","pages/home")
				doLoadUI("m-l-tow","pages/order")
				doLoadUI("m-l-five","pages/basicinfo")
				doLoadUI("m-l-three","pages/lunch")
				
				doFindUsername()
			})
			function doLoadUI(id,url){
				$("#"+id).click(function(){
					$("#rightpagee").load(url);
				})
			}
			function doFindUsername(){
				
		         var url="doFindUserInfo";
		         var params={"username":"${username}"};
		         $.get(url,params,function(result){
		         //console.log(result);
		         doHandleResponseResult(result.data);})
		         }
			function doHandleResponseResult(data){
		    	  console.log(data.username);
		    	  var myname=$("#username");
		    	  myname.empty();
		    	  $("#username").html(data.username);
		          }
	          
	   
		</script>
	</body>
</html>
