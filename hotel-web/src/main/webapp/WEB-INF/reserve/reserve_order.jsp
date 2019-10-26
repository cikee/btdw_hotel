<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reserve_order.css" />
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../laydate/laydate.js"></script>
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


		
		var i=$("#roomNum").val();
		
		$(".minus").click(function(){
			if(i>1){
			$("#roomNum").val(--i)
			var a=$("#roomNum").val();
			var money=$("#singleton").html()
			var time=$(".number").html()
			var all=a*money*time;
			//给显示的金额设置计算后的值
			$("#balance").html(all);
			$("#final_balance").html(all);
			var paymoney=$("#final_balance").html();
			//给带参金额设置计算后的值
			$("#endmoney").prop("value",paymoney);
			}
			}) 
		$(".add").click(function(){
			if(i<10){
			$("#roomNum").val(++i)
			var a=$("#roomNum").val();
			var money=$("#singleton").html()
			var time=$(".number").html()
			//计算总价
			var all=a*money*time;
			//给显示的金额设置计算后的值
			$("#balance").html(all);
			$("#final_balance").html(all);
			var paymoney=$("#final_balance").html();
			//给带参金额设置计算后的值
			$("#endmoney").prop("value",paymoney);
			}
			})
			
			
		$('form#order button[type="submit"]').click(function (e) {
		    let event = e || window.event;
		    event.preventDefault(); // 兼容标准浏览器
		    window.event.returnValue = false; // 兼容IE6~8
			 // 验证代码，可验证表单项或添加表单项等...
			   //获取入住离店时间,判断是否为空
		    var inday=$(".inDay").html()
		    var outday=$(".outDay").html()
		    if(!inday){
			    alert("请选择入住时间")
			    return false;
			}else if(!outday){
				alert("请选择离店时间")
				return false;
			}
		       //获取用户名和手机号码,判断是否为空
		    var userName=$("#guestName").prop("value");   
			var userPhone=$("#tel").prop("value"); 
			if(!userName){
				alert("请填写入住人姓名")
				return false;
			}else if(!userPhone){
				alert("请填写入住人手机号码")
				return false;
			}
		    //放行代码:
		    //要提交表单可以： $('form#form_id').submit(); 提交
			if(userName){
					debugger
					var name=$("#guestName").prop("value");
					if(!(/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/.test(name))){
								alert("请填写真实姓名");
								$("#guestName").prop("value","")
						        return false; 
						}
				if(userPhone){
					var tel=$("#tel").prop("value")
					 if(!(/^1(3|4|5|6|7|8|9)\d{9}$/.test(tel))){ 
					        alert("手机号码格式不正确，请重填");  
					        //清除手机号码框内容
					        $("#tel").prop("value","")
					        return false; 
					    } 
					 if($("#date").css("display")=="block"){
				            alert("请检查入住离店时间是否确认修改")
				            return false;
				        }
					$('form#order').submit();
				}
			}
		    
		  });


		$("#updateTime").click(function(){
			//获取当前页面上的入住离店时间
			var inday=$(".inDay").html()
			var outday=$(".outDay").html()
			//将获取到的时间设置给时间选择器
			$("#date1").prop("value",inday)
			$("#date2").prop("value",outday)
			
			$("#date").css("display","block")
			})
			
			//点击保存修改发生的事件
		$("#dateBtn").click(function(){
			//获取时间选择器上的时间
			var inday=$("#date1").prop("value")
			var outday=$("#date2").prop("value")
			//将选择的时间设置给当前页面显示
			if(inday>outday){
				alert("时间选择有误,请重写选择")
				return false;
			}
			if(inday==outday){
				alert("时间选择有误,请重写选择")
				return false;
			}
			$(".inDay").html(inday)
			$(".outDay").html(outday)
						
/*			比较时间的逻辑判断,没有成功,卡在无法将时间毫秒值转换为2019-2-5格式的日期格式.  待完善
 			//比较入住时间和离店时间,提示
			//格式化时间格式
			var outday = outday.replace(/-/g,'/');
			var inday = inday.replace(/-/g,'/');
			//当前时间
			var localday=new Date().getTime();
			//离店时间和入住时间
			var outday = new Date(outday).getTime();
			var inday = new Date(inday).getTime();
			var t= inday<localday;
			var r = outday < inday;
			if(t){
				alert("时光不能倒流,请重新选择")
				return false;
			}else{
				//将入住的时间显示到页面上
				var inday=new Date(inday)
				$(".inDay").html(inday)
			}
			if (r){
				alert("离店时间不能小于入住时间,请重新选择!")
				return false;
			}else{
				//将离店的时间显示到页面上
				var outday=new Date(outday)
				$(".outDay").html(outday)
				} */
			
			//带参时间
			$("#inDay").prop("value",inday)
			$("#outDay").prop("value",outday)



			var inTime = new Date(inday);
			var outTime = new Date(outday); 
			// 计算时间差, 单位是毫秒
			var minus = Math.abs(outTime.getTime() - inTime.getTime());
			// 计算入住天数
			var time=minus/1000/60/60/24
			//设置显示时间
			$(".number").html(time)
			//设置需要带到其他页面参数时间
			$("#mathTime").prop("value",time)
			
			//获取单价,房间数
			var money=$("#singleton").html()
			var a=$("#roomNum").val();
			var all=a*money*time
			//给显示的金额设置计算后的值
			$("#balance").html(all);
			$("#final_balance").html(all);
			var paymoney=$("#final_balance").html();
			//给带参金额设置计算后的值
			$("#endmoney").prop("value",paymoney);

			
			//关闭修改时间的样式框
			$("#date").css("display","none")
			})
			  
		
 			/* 	var params={
				inTime:$(".inDay").val(),
				outTime:$(".outDay").val(),
				roomType:$(".items>span").val(),
				roomNum:$("#roomNum").val(),
				userName:$("#guestName").val(),
				userPhone:$("#tel").val(),
				money:$(".money").val(),
				hotelName:$(".coci-right .name").val(),
				hotelAddr:$(".coci-right .addr").val()
			}*/
 			
	 		//入住日历
			laydate.render({
				  elem: '#date1'
				,min: 'new Date()'
				});
			//离店日历
			laydate.render({
				  elem: '#date2'
				,min: 'new Date()'
				});
 
		
	});
		

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
	<!--分割线------------------------------------------------------->
	<% String money=request.getParameter("money"); %>
	<% Double paymoney=Double.parseDouble(money); %>
	<% String id=request.getParameter("id"); %>
	<div class="warapper" id="warapper">
		<div id="schedule">
			<a href="../index"><div class="schedule_property">首页&nbsp-></div></a>
			<a href="reserve_room?id=<%=id %> "><div class="schedule_property">重新选择&nbsp-></div></a>
			<a><div class="schedule_property">填写订单&nbsp-></div></a>
			<!-- <a><div class="schedule_property">完成支付&nbsp-></div></a> -->
		</div>
		<form id="order" action="order_pay" method="post" >
			<input style="display: none;" name="storeId" value="<%=id %>" />
		<div class="confirm-order-content">
			<c:forEach items="${ result }" var="r">
				<div class="confirm-order-content-info w1050">
					<div class="coci-left">
						<div class="book-info">
							<div class="title">
								<h2>预订信息</h2>
							</div>
							<div class="items">
							<% 
							SimpleDateFormat sp=new SimpleDateFormat("yyyy-MM-dd");
							String inDay=sp.format(new Date());
							Date s=new Date();
							long t = s.getTime();
							t+=(24*60*60*1000);
							s.setTime(t);
							String outDay=sp.format(s);
							%>
							<%
							SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
							String orderNum=sdf.format(new Date());
							int r=(int)(Math.random()*100);
							%>
							<!-- 隐式的自动生成的订单编号 -->
							<input  style="display: none;" name="orderId" value="<%=orderNum+r %>" />
							<input  style="display: none;" name="orderPrice" value="<%=paymoney %>" />
							<!-- 隐式保存当前登录用户的账号名字 -->
							<input  style="display: none;" name="loginUser" value="${ username }" />
							
							<input size="30" id="inDay"
									style="display: none;" name="inDay" 
									value="<%=inDay %>" />
							<input size="30" id="outDay"
									style="display: none;" name="outDay" 
									value="<%=outDay %>" />
								<em>入住日期：</em> 
								<span>
								<time class="inDay"><%=inDay %></time>
								<i>至</i>
								<time class="outDay"><%=outDay %></time> 
								共
								<time class="number">1</time>
								晚
								</span>
								<input id="mathTime" name="time" value="" style="display:none"/>
								<a href="javascript:;" id="updateTime">修改日期</a>
								<div id="date">
								<div id="time1"><em>入住时间:</em><input type="text" class="layui-input" id="date1"></div>
								<div id="time1"><em>离店时间:</em><input type="text" class="layui-input" id="date2"></div>
									 
							<div id="time1"><em>入住时间:</em><input type="date" id="date1" value="年月日"></input></div>
						 <div id="time2"><em>离店时间:</em><input type="date" id="date2" value="年月日" /></div> 
									<a href="javascript:;" id="dateBtn">确认修改</a>
								</div>
							</div>
							<div class="items">
								<em>入住房型：</em><span>${ r.roomType }--${ r.roomBedtype }</span>
								<input size="30"
									style="display: none;" name="roomType" 
									value="${ r.roomType }--${ r.roomBedtype }" />
				
							</div>
							<div class="items">
								<em>房 间 数 ：</em>
								<div class="room-num">
									<i class="minus">-</i> <label> <input type="text" name="roomNum"
										id="roomNum" value="1" readonly="">
									</label> <i class="add on">+</i>
								</div>
							</div>

						</div>
						<div class="live-info">
							<div class="title">
								<h2>入住信息</h2>
							</div>
							<div class="items">
								<em><i>*</i> 入 住 人 ：</em> 
								<label> <input type="text"
									placeholder="入住人姓名" id="guestName" value="" name="userName">
								</label> <span>必须与入住时所持有效证件姓名保持一致</span>
							</div>
							<div class="items">
								<em><i>*</i> 手机号码： </em> <label><input type="text"
									maxlength="11" placeholder="入住人手机号" id="tel" value="" name="userPhone">
								</label> <span>预订成功后会向您发送短信通知</span>
								
							</div>
							<!-- 登陆后以下class items 是不显示的，未登录才显示的 begin-->

							<!-- 登陆后以下class items 是不显示的，未登录才显示的 end-->
						</div>
						<div class="order-price">
							<div class="title">
								<h2>订单价格</h2>
							</div>
							<p>
								<em>订单单价&nbsp;:&nbsp;</em>
								<i>¥</i><span id="singleton"><%=paymoney %></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<em>订单总额：</em> 
								<i>¥</i><span id="balance"><%=paymoney %></span>
							</p>

							<p>
								<em>实际支付：</em><i>¥</i><span class="money" id="final_balance"> <%=paymoney %></span>
								<input size="30" type="text" style="display:none"
									 name="paymoney" id="endmoney"
									value=" <%=paymoney %>" />
							</p>
							<div class="btn">
								<button type="submit" id="orderCommit">提交订单</button>
							</div>
						</div>
					</div>
					<div class="coci-right" style="height: 777px;">
						<div class="img">
							<img src="../img/order_img01.jpg">
						</div>
						<h2 class="name">${ r.hotelName }</h2>
						<input size="30"
									style="display: none;" name="hotelName" 
									value="${ r.hotelName }" />		
						
						<p class="addr">${ r.hotelAddr }</p>
						<input size="30"
									style="display: none;" name="hotelAddr" 
									value="${ r.hotelAddr }" />		
				
						
						<h2>${ r.roomBedtype }</h2>
						<p>床型：${ r.roomBedsize }</p>
						<p>早餐：无早</p>
						<p>上网 ：WIFI、有线宽带（免费）</p>
						<h2>订单政策</h2>
						<div id="orderPolicy">
							<p class="policy">1、酒店于入住当天14:00办理入住，早到可能需要等待。如需在0:00-6:00入住，入住日期请选择前一天；</p>
							<p class="policy">
								3、本订单最晚保留时间为入住当天<span class="keepTime">18:00</span>，如未能及时到店，请提前联系酒店；
							</p>
						</div>
						<h2>联系电话</h2>
						<p>客服电话：400-823-8823</p>
						<p>酒店电话：${ r.hotelPhone }</p>
						<input size="30"
									style="display: none;" name="hotelPhone" 
									value="${ r.hotelPhone }" />	
					</div>
				</div>
			</c:forEach>
		</div>
		</form>
	</div>
</body>
</html>