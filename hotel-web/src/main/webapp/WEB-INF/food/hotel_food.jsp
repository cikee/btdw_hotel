<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../css/hotel_food.css" />
		<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
		
	</head>
	
	<body>
		<!--顶部导航栏-->
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
					<li id="logo_menu_first">
						<a href="../index" id="logo_link_first">主页</a>
					</li>
					<!--菜单 -> 主页 -->
					<!--菜单 -> 主页 -->
					<li><a href="../reserve/reserve_hotel" id="logo_link">预定房间</a></li>
					<li><a href="../food/hotel_food" id="logo_link">订餐</a></li>
					<li><a href="#" id="logo_link">联系方式</a></li>
					<li><a href="../loading" id="logo_link" class="loading" style="display:blcok">登录</a></li>
					<li><a href="../login" id="logo_link" class="login" style="display:blcok">注册</a></li>
					<li style="margin-left:100px;">用户名:<a href="../myorder" id="logo_link" class="user" style="display:blcok">${username}</a></li>
				</ul>
			</div>
		</div>
	
		<!--分割线----------------------------------------->
		<div id="background-color">
			<div id="cut"/>
			<div id="welcome">
				<a href="hfood_order_pay">点击查看订单</a>
				<span>欢迎来到天上人间订餐</span>
			</div>
			<div id="container1">
				<div id="main-content">
					<div class="index-menu-list">
					<ul>
						<!--repeat504557333521:start--><li class="">
							<a href="javascript:;">折扣优惠</a>
						</li><!--repeat504557333521--><li class="">
							<a href="selectObjectByMuneId?menuId=2">炒菜系列</a>
						</li><!--repeat504557333521--><li class="">
							<a href="javascript:;">肉食套餐</a>
						</li><!--repeat504557333521--><li>
							<a href="javascript:;">其他套餐</a>
						</li><!--repeat504557333521--><li>
							<a href="javascript:;">单点主食</a>
						</li><!--repeat504557333521--><li>
							<a href="javascript:;">投食站点</a>
						</li><!--repeat504557333521--><li class="">
							<a href="javascript:;">小食</a>
						</li><!--repeat504557333521--><li class="">
							<a href="javascript:;">甜品小食</a>
						</li><!--repeat504557333521--><li class="">
							<a href="javascript:;">串点</a>
						</li><!--repeat504557333521--><li class="">
							<a href="selectObjectByMuneId?menuId=5">汤饮</a>
						</li><!--repeat504557333521--><li class="">
							<a href="selectObjectByMuneId?menuId=6">阳光早餐</a>
						</li><!--repeat504557333521--><li class="">
							<a href="javascript:;">野叶子沙拉</a>
						</li><!--repeat504557333521--><li class="active">
							<a href="javascript:;">日式煮锅</a>
						</li><!--repeat504557333521--><li>
							<a href="javascript:;">敬请期待...</a>
						</li><!--repeat504557333521--><!--repeat504557333521:end-->
					</ul>
					</div>
					<div class="store-menu-wrap">
					
						<div id="products-box">
						<form method="post" action="">
						<c:forEach items="${foods }" var="food">
							<div class="product-box">
								<div class="product-img">
								<img src="../${food.photoAddr}">
								
								</div>
								<div style="overflow: hidden;" class="product-textbox">
								    <input style="display: none;" name="id" value="${food.id}">
									<div class="product-name" title="${food.username}">${food.username}</div>
										<input style="display: none;" name="foodusername" value="${food.username}">
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>${food.price}</span>
											<input style="display: none;" name="price" value="${food.price}">
										</div>
										<%String username=(String)session.getAttribute("username"); %>
						<input type="checkbox" value="${food.id}" id="cBox" />
										<input style="display: none;" name="UserUsername" value="${username}">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										
										</a>
									
									</div>
										
								</div>
							</div>
							
							</c:forEach>
							<input type="submit" value="提交" id="sub" >
							<!-- ========================================= -->
							<!-- <div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div> -->
						<!-- 	<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="product-box">
								<div class="product-img">
								<img src="http://51wm-pic1.oss-cn-hangzhou.aliyuncs.com/product/d8cc4294-0187-4526-9b26-a7837948b053.png">
								</div>
								<div style="overflow: hidden;" class="product-textbox">
									<div class="product-name" title="酸汤肥牛锅">酸汤肥牛锅</div>
									<div class="product-pricebox">
										<div class="product-price">
											￥<span>28</span>
										</div>
										<a href="javascript:void(0)" class="orderNow">
										立即下单
										<i class="fa fa-check" style="font-size:24px"></i>
										</a>
									</div>
								</div>
							</div> -->
						</form>	
						</div>
					</div>
				</div>
			</div>
		</div>

<script src="../../js/jquery-1.8.3.min.js"></script>
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
		
		$("#products-box").on("click","#sub",doGetObject);
		$("#products-box").on("change",".cBox",doGetCheckedIds);
	//	DoChangeBox();
	})
	function doGetObject(){
		//debugger;
		 var idArray=doGetCheckedIds();
		   if(idArray.length==0){
	    	   alert("请先选中");
	    	   return;
	       }
		   var url="../../food/Hfood_order_pay";
		 var params={"ids":idArray.toString()};//1,2,3
		 $.post(url,params,function(result){
			 alert(result);
		 });

	/*   function DoChangeBox(){
			//2.获取tbody中所有checked对象
	    	$("#products-box input[type='checkbox']")
	    	//迭代所有checkbox对象
	    	.each(function(){
               var value= $(".cBox").value();
               var ids=doGetCheckedIds();
               if(ids!=null){
                   
               for(var i=0;i<ids.length;i++){
                   if (ids[i]==value){
                       $(".cBox").prop("checked",true);
                       }else{
                    	   $(".cBox").prop("checked",false);
                           }
                   }
	    	}
	    	}

			};  */ 
		// alert(params);
	       //3.2定义请求url
	       
	       
	      // var url="../../food/food_order_pay";
	     // var arr={params:params};
	 /*      var arr={params:idArray.toString()};
	       $.ajax({url:"../../food/food_order_pay",
		       async:false,
		       data:arr,
		       type:post,
		       success:function(result){
	               
	            }
		       }
	       ); */
	     
		}
	  function doGetCheckedIds(){
    	//1.定义存储选中id的数组对象
    	var array=[];//new Array();
    	//2.获取tbody中所有checked对象
    	$("#products-box input[type='checkbox']")
    	//迭代所有checkbox对象
    	.each(function(){
    		//获取checkbox对象中checked属性的值
    		var checked=$(this).prop("checked");
    		//检测checkbox对象状态
    		if(checked){
    			//假如是选中状态，则将对象的value值存储到数组
    			array.push($(this).val());
    		}
    	});
    	//3.返回数组
    	return array;
    }
	</script>
	</body>
	
	
</html>

