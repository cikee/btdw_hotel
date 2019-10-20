<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reserve_room.css" />
<script src="../js/reserve_room.js"></script>
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
	
	<div id="color-background">
		<!--展示栏-->
		<div class="container2">
		
			<div class="container2_center">
				<div class="room-title">
					<span class="room-title-first">房型</span> <span
						class="room-title-other">取消规则</span> <span
						class="room-title-other">人数上限</span> <span
						class="room-title-other">房价</span>
				</div>
				<!--房间信息总div-->
				<c:forEach items="${ result }" var="r">
				<div class="room-information">
					<!--房间信息左边图片区总div-->
					<div class="room-information-pic">
						<div class="photo">
							<img src="../${ r.photoAddr }" />
						</div>
						<div class="photo-name">
							<span>${ r.roomType }</span>
						</div>
						<div id="detail" onclick="showtable()">
							详情
							<div id="content" style="display: none;">
								<span>床型:${ r.roomBedtype }&nbsp;${ r.roomBedsize }</span> <span>面积:${ r.roomSize }(具体面积以实际情况为准)</span>
								<span>楼层:${ r.roomFloor }</span> <span>有WIFI</span> <br /> <span>有窗</span>
								<span>无早餐提供</span>
							</div>
						</div>
					</div>
					<!--房间信息右边详细信息总div-->
					<div class="room-information-detail">
						<div class="room-detail">
							<div class="room-row">
								<span id="span1">会员价</span> <span
									style="margin-left: 20px; width: 120px;">18:00之前可取消</span> <span
									style="margin-left: 110px;">*${ r.roomPeople }</span> <span
									style="margin-left: 120px;">￥${ r.minPrice }</span> 
									<%-- <a href="reserve_order?id=${ r.id }&money=${ r.minPrice }"></a> --%>
						<form action="reserve_order" method="post">
								<input style="display: none" name="id" value="${ r.storeId }"/>	
								<input style="display: none" name="money" value="${ r.minPrice }"/>	
									<input type="submit" id="room-reserve" value="立即预定" />
						</form>
						
							</div>
							<div class="room-row">
								<span id="span1">标准价</span> <span
									style="margin-left: 20px; width: 120px;">18:00之前可取消</span> <span
									style="margin-left: 110px;">*${ r.roomPeople }</span> <span
									style="margin-left: 120px;">￥${ r.maxPrice }</span>
								
									<%-- <a href="reserve_order?id=${ r.id }&money=${ r.maxPrice }"></a> --%>
						<form action="reserve_order" method="post">
								<input style="display: none" name="id" value="${ r.storeId }"/>	
								<input style="display: none" name="money" value="${ r.maxPrice }"/>	
									<input type="submit" id="room-reserve" value="立即预定" />
						</form>
									
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				


			</div>
		</div>
		<!--酒店基本信息栏-->
		<div class="container3">
			<div class="container3_center">
				<div class="find_top">
					<div>
						<a href="#">酒店信息</a>
					</div>
					<div>
						<a href="#">用户评论</a>
					</div>
				</div>
				<div class="information_show">
					<h2 style="margin-left: 20px;">酒店信息</h2>
					<div>
						<span id="s">酒店电话:</span>0739-88888888
					</div>
					<div>
						<span id="s">入住时间:</span>14:00后
					</div>
					<div>
						<span id="s">退房时间:</span>12:00前
					</div>
					<div>
						<span id="s">酒店介绍:</span>
					</div>
					<div style="line-height: 24px;">
						♣酒店位于长寿路商业区，属于地铁沿线比较便捷，门口就是地铁7号地铁，
						13号地铁长寿路站，7号地铁7号口上来，2分钟（昆仑商务正门）即可直达酒店。<br />
						♣出行便捷：13号线转11号线直达迪斯尼乐园；另7号线直达新国际博览中心展览馆；
						世博展览馆直达；分店距离10分钟车程到达静安寺，15分钟车程到达上海火车站、
						长途客运总站、南京西路；20分钟车程到达人民广场、南京路步行街、城隍庙、外滩；
						30分钟车程到达陆家嘴、东方明珠、环球金融中心；40分钟车程到达虹桥火车站、 虹桥机场；50分钟车程到达浦东机场。<br />
						♣购物娱乐休闲一应俱全：亚新广场、巴黎春天、久光百货、恒隆广场、名品商厦等。<br />
						♣展会：7号线地铁就可直达上海浦东新国际博览中心，上海世博展览馆参加展会， 其他展览中心均可换乘抵达。<br />
						♣旅游方便：可达各大景点；南京路步行街、外滩、城隍庙、东方明珠、野生动物园、
						长风公园、环球金融中心、黄浦江、迪士尼乐园、陆家嘴、人民广场、七宝古镇、
						世博园、杜莎夫人蜡像馆、科技馆等。是您到上海旅游观光和商务出行的理想下榻酒店， 期待您的光临!
					</div>
					<div>
						<span id="s">开业时间:</span>2001年
					</div>
					<div>
						<span id="s">酒店设施:</span>免费Wifi、收费停车、健身房、餐厅、游泳池
					</div>
					<div>
						<span id="s">支付方式:</span>银联、现金、微信、支付宝等
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>