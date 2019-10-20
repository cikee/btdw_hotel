<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reserve_hotel.css" />
</head>
<body>
	<div id="btd_d1">
		<div id="top_logo_left">
			<h1>
				<a href=""> <span style="color: #FFF;"> 碧涛达维 <span
						style="color: #FFCE14;">酒店</span></span>
					<p id="logo_caption"
						style="color: #FFCE14; font-size: 10px; letter-spacing: 10px;">你梦想的度假胜地</p>
				</a>
			</h1>
		</div>
		<div id="top_logo_right">
			<ul>
				<li id="logo_menu_first"><a href="../index" id="logo_link_first">主页</a>
				</li>
				<!--菜单 -> 主页 -->
					<li><a href="reserve_hotel" id="logo_link">预定房间</a></li>
					<li><a href="../food/hotel_food" id="logo_link">订餐</a></li>
					<li><a href="#" id="logo_link">联系方式</a></li>
	
					<li><a href="../loading" id="logo_link" class="loading" style="display:blcok">登录</a></li>
					<li><a href="../login" id="logo_link" class="login" style="display:blcok">注册</a></li>
					<li style="margin-left:100px;">用户名:<a href="../myorder" id="logo_link" class="user" style="display:blcok">${username}</a></li>
			</ul>
		</div>
	</div>

	<!--筛选栏-->
	<div class="container">
		<div class="input_section">
			<label class="input_title">目的地</label> 
			<input type="text" placeholder="请输入汉字或拼音" class="input_text" />
			<label class="input_title">日期</label>
			<input type="text" placeholder="入住离店日期" class="date" />
			<label class="input_title">关键词</label>
			<input type="text" placeholder="酒店名/地标/商圈" class="input_text" />
			<button class="input_search" ng-click="">搜索</button>
		</div>


		<div class="option_section">
			<div class="row clearfix" style="width: 1148px;">
				<label class="title ng-binding">位置</label> <label class="unlimited">不限</label>
				<div class="checkbox_box clearfix">
					<label class="location_s_m"> <span class="ng-binding">商圈/地标</span>
					</label> <label class="location_s_m"> <span class="ng-binding">飞机场/火车站</span>
					</label> <label class="location_s_m"> <span class="ng-binding">轨道交通</span>
					</label> <label class="location_s_m"> <span class="ng-binding">行政区</span>
					</label> <label class="location_s_m"> <span class="ng-binding">景点</span>
					</label>
				</div>
			</div>

			<div class="row">
				<label class="title ng-binding">星级</label> <label class="unlimited">不限</label>
				<form class="checkbox_box" action="#">
					<label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">经济型</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">舒适型</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">高档型</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">豪华型</span>
					</label>
				</form>
			</div>
			<div class="row">
				<label class="title ng-binding">价格(元)</label> <label
					class="unlimited">不限</label>
				<form class="checkbox_box" action="#">
					<label class="location_s_m"> <input type="radio"
						name="priveArea" /> <span>200以下</span>
					</label> <label class="location_s_m"> <input type="radio"
						name="priveArea" /> <span>200-400</span>
					</label> <label class="location_s_m"> <input type="radio"
						name="priveArea" /> <span>400-600</span>
					</label> <label class="location_s_m"> <input type="radio"
						name="priveArea" /> <span>600以上</span>
					</label> <label class="price_input" style="width: 236px;"> <span
						class="ng-binding">价格区间</span> <input type="text"
						class="price_section" /> <span>-</span> <input type="text"
						class="price_section" />
					</label>
					<button class="price_confirm">确认</button>
				</form>
			</div>
			<div class="row">
				<label class="title ng-binding">提供服务</label> <label
					class="unlimited">不限</label>
				<div class="checkbox_box" action="#">
					<label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">免费WIFI</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">免费停车</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">餐厅</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">健身中心</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">室内游泳池</span>
					</label> <label class="location_s_m"> <input type="checkbox" /> <span
						class="ng-binding">行李寄存</span>
					</label>
				</div>
			</div>
		</div>
	</div>
	<!--酒店查询结果信息区域-->
	<div id="container2_first">
		<div id="container2_content">
			<div id="search_result">
				查询到 <span>${ rows }</span> 家酒店
			</div>
			<div id="sort_nav">
				<div class="nav_title">排序:&nbsp;</div>
				<div class="nav_one">默认排序</div>
				<div class="nav_two">由近到远</div>
				<div class="nav_three">价格:&nbsp;由低到高</div>
			</div>
			<c:forEach items="${ result }" var="r">
			<div id="information_frame">
				<div id="message_picture">
					<a href="reserve_room?id=${ r.id }"><img src="../${ r.photoAddr }" /></a>
				</div>
				<div id="message_right">
					<div id="message_detail">
						<p class="pname">
							<a href="reserve_room?id=${ r.id }">${ r.hotelName }</a>
						</p>
						<div class="address">
							地址:&nbsp;<span>${ r.hotelAddr }</span>
						</div>
						<div class="distance">${ r.hotelDistance }</div>
					</div>
					<div id="message_middle">
						<div class="middle_tag1">${ r.hotelType }</div>
						<div class="middle_tag2">新开业</div>
					</div>
					<div id="message_bottom_frame">
						<div id="price_frame">
							<div id="price">
								￥ <span>${ r.hotelMinprice }</span> 起
							</div>
							<div id="price_detail">
								<a href="reserve_room?id=${ r.id }">查看详情</a>
							</div>
						</div>
					</div>
				</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</body>
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
</html>