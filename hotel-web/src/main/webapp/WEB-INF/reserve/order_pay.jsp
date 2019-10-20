<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/order_pay.css" />
<script src="../js/jquery-1.8.3.min.js">
</script>
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

	<!---------------------------------------->
		<%String money= request.getParameter("paymoney"); %>
		<%String inDay= request.getParameter("inDay"); %>
		<%String outDay= request.getParameter("outDay"); %>
		<%String time=request.getParameter("time"); %>
		<%String orderId=request.getParameter("orderId"); %>
	<div id="schedule">
			<%String id=request.getParameter("storeId"); %>
			<a href="../index"><div class="schedule_property">首页&nbsp-></div></a>
			<a href="reserve_room?id=<%=id %>"><div class="schedule_property">重新选择&nbsp-></div></a>
		<%-- 		<form action="reserve_order" method="post">
								<input style="display: none" name="id" value="<%=id %>"/>	
								<input style="display: none" name="money" value="<%=money%>"/>	
							<a href=""><input id="submit" class="schedule_property" type="submit" value="填写订单&nbsp->"></a>
				</form> --%>
			<a><div class="schedule_property">完成支付&nbsp-></div></a>
			</div>
	<div id="Allcontent">
		<div class="order-pay-content">
			<div class="order-pay-content-info w1050">
				<div class="order-detail" style="height: 582px;">
					<div class="title">
					
						<h3>订单已提交，请选择支付方式！</h3>
					</div>

					<p>支付&nbsp;￥<%=money %>&nbsp;让房间整晚保留，如未预付则只保留至<%=inDay %>的18点之前噢!</p>
					<div class="info">
						<p>您的订单信息如下：</p>
						<%String hotelName= request.getParameter("hotelName"); %>
						<h2><%=hotelName %></h2>
						<%
						SimpleDateFormat sp=new SimpleDateFormat("yyyyMMddHHmmss");
						String orderNum=sp.format(new Date());
						int r=(int)(Math.random()*100);
						%>
						<p>订单编号：<%=orderId %></p>
						<% String roomType= request.getParameter("roomType"); %>
						<p>入住房型：<%=roomType %></p>
						<%String userName= request.getParameter("userName"); %>
						<%String userPhone= request.getParameter("userPhone"); %>
						<%String roomNum= request.getParameter("roomNum"); %>
						<p>房间数量&nbsp;:&nbsp;<%=roomNum %>&nbsp;间</p>
						<p>
							入住日期：<%=inDay %>至<%=outDay %><span style="margin-left: 10px;">共<%=time %>晚</span>
						</p>
						<%String hotelAddr= request.getParameter("hotelAddr"); %>
						<p>酒店地址：<%=hotelAddr %></p>
						<%String hotelPhone= request.getParameter("hotelPhone"); %>
						<p>酒店电话：<%=hotelPhone  %></p>
						
						<p>客服电话：400-823-8823</p>
						<p>订单总价：￥<em><%=money %></em></p>
						<p>
							需要支付：￥<em><%=money %></em>
						</p>
						<!-- <form action="pay_Ok" method="post">
						<input type="submit" value="确认订单" id="pay"/> -->
						
				 <input  style="display: none;" name="userName" value="<%=userName %>" />
				 <input  style="display: none;" name="userPhone" value="<%=userPhone %>" />
				 <input  style="display: none;" name="inDay" value="<%=inDay %>" />
				 <input  style="display: none;" name="outDay" value="<%=outDay %>" />
				 <input  style="display: none;" name="hotelName" value="<%=hotelName %>" />
				 <input  style="display: none;" name="hotelPhone" value="<%=hotelPhone %>" />
				 <input  style="display: none;" name="hotelAddr" value="<%=hotelAddr %>" />
				 <input  style="display: none;" name="roomType" value="<%=roomType %>" />
				 <input  style="display: none;" name="roomNum" value="<%=roomNum %>" />
				 <input  style="display: none;" name="orderId" value="<%=orderId %>" />
				 <input  style="display: none;" name="orderPrice" value="<%=money %>" />
						<!-- </form> -->
					</div>
					
					
					<!---------------------->

					<div id="main">
						<form name=alipayment action=http://123.207.121.120/1/epayapi.php method=post
							target="_blank">
							<div id="body" style="clear: left">
								<dl class="content">

									<dd>
										<span class="null-star"></span> <input size="30"
											style="display: none;" name="WIDout_trade_no"
											value="<%=orderId %>" /> <span> </span>
									</dd>

									<dd>
										<span class="null-star"></span> <input size="30"
											style="display: none;" name="WIDsubject" value="<%= request.getParameter("roomType") %>" /> <span>
										</span>
									</dd>

									<dd>
										<span class="null-star"></span> <input size="30"
											style="display: none;" name="WIDtotal_fee" value="<%= money %>" /> <span>
										</span>
									</dd>
									<dt>支付方式：</dt>
									<dd>
										<label><input type="radio" name="type" value="alipay"
											checked="">支付宝</label>&nbsp;<label><input
											type="radio" name="type" value="qqpay">QQ钱包</label>&nbsp;<label><input
											type="radio" name="type" value="wxpay">微信支付</label>
									</dd>


									<dt></dt>
									<dd>
										<span class="new-btn-login-sp">
											<button class="new-btn-login" type="submit"
												style="text-align: center;">确 认</button>
										</span>
									</dd>
								</dl>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>