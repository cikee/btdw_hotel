<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
				<li id="logo_menu_first"><a href="#" id="logo_link_first">主页</a>
				</li>
				<!--菜单 -> 主页 -->
				<li><a href="reserve_hotel" id="logo_link">预定房间</a></li>
					<li><a href="hotel_food" id="logo_link">订餐</a></li>
					<li><a href="#" id="logo_link">联系方式</a></li>
					<li><a href="../loading" id="logo_link" class="loading" style="display:blcok">登录</a></li>
					<li><a href="../login" id="logo_link" class="login" style="display:blcok">注册</a></li>
					<li style="margin-left:100px;">用户名:<a href="../myorder" id="logo_link" class="user" style="display:blcok">${username}</a></li>
			</ul>
		</div>
	</div>

	<!---------------------------------------->
	<div id="schedule">
			<a href="#"><div class="schedule_property">首页&nbsp-></div></a>
			<a href="#"><div class="schedule_property">天上人间酒店预定&nbsp-></div></a>
			<a href="#"><div class="schedule_property">填写订单&nbsp-></div></a>
			<a><div class="schedule_property">完成支付&nbsp-></div></a>
			</div>
	<div id="Allcontent">
		<div class="order-pay-content">
			<div class="order-pay-content-info w1050">
				<div class="order-detail" style="height: 582px;">
					<div class="title">
					
						<h3>订单已提交，请选择支付方式！</h3>
					</div>
					
				
					<div class="info">
						<p>您的订单信息如下：</p>
						
						<%
						String foodnames=(String)session.getAttribute("foodnames");
						double prices=(Double)session.getAttribute("prices");
					    %>
						<h2>菜品信息</h2>
						<%
						SimpleDateFormat sp=new SimpleDateFormat("yyyyMMddHHmmss");
						String orderNum=sp.format(new Date());
						int r=(int)(Math.random()*100);
						%>
						<p>订单编号：<%=orderNum+r %></p>
						<% String username=(String) session.getAttribute("username"); %>
						<p>用户名:<%=username %></p>
					<%
					%>
					
						<p>菜名&nbsp;:&nbsp;<%=foodnames%></p>
					
					
						
						<p>客服电话：400-823-8823</p>
						
					
						<p>订单总价：<%=prices %></p>
						<p>
							需要支付：<em><%=prices %></em>
						</p>
						<%int[] idss= (int [])session.getAttribute("idss");
						String ids= Arrays.toString(idss);
						%>
						<form action="pay_Ok" method="post">
						<input type="submit" value="确认订单" id="pay"/>
				 <input  style="display: none;" name="OrderId" value="<%=orderNum+r %>" />		
				 <input  style="display: none;" name="UserUsername" value="<%=username %>" />
				 <input  style="display: none;" name="OrderFoodName" value="<%=foodnames%>" />
				 <input  style="display: none;" name="price" value="<%=prices %>" />
				 <input  style="display: none;" name="foodId" value="<%=ids %>" />
						</form>
						<form action="update_Order" method="post">
					
						<% int[] in= (int [])session.getAttribute("idss"); %>
						<input  style="display: none;" value=<%=in %> name="ins"> 
						<input type="submit" value="修改订单"  id="pay">
						</form>
					</div>
					
					
					<!---------------------->

					<div id="main">
						<form name=alipayment action= "" method=post
							target="_blank">
							<div id="body" style="clear: left">
								<dl class="content">

									<dd>
										<span class="null-star">*</span> <input size="30"
											style="display: none;" name="WIDout_trade_no"
											value="20190911021020358" /> <span> </span>
									</dd>

									<dd>
										<span class="null-star">*</span> <input size="30"
											style="display: none;" name="WIDsubject" value="" /> <span>
										</span>
									</dd>

									<dd>
										<span class="null-star">*</span> <input size="30"
											style="display: none;" name="WIDtotal_fee" value="" /> <span>
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