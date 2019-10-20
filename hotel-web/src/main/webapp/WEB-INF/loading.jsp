<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<!-- 引入login.css文件 -->
<link rel="stylesheet" href="css/loading.css">
<script src="../js/jquery-1.8.3.min.js"></script>
</head>
<body>

	<!-- header-头部 -->
	<div id="header">

		<span class="line"></span> <span class="wel-login"></span>
	</div>


	<!-- main-主体 -->
	<div id="main">
		<!-- <img src="../img/g1.jpg" /> -->
		<form method="POST" id="form">
			<div class="login-box-msg">登录</div>

			<!-- 用户名输入框 -->
			<input type="text" name="username" id="usernameId" value="" />
			<input type="password" name="password" id="passwordId" value="" />
			<!-- 记住用户名复选框 -->
				
			<div id="rem-username">
				<input type="checkbox" name="remUsername" value="yes" />&nbsp;记住用户名
			</div>
					<!-- 验证码 -->	
					<!-- SSM
							<div class="item-inner">
					    <div class="item-title label">验证码</div>
					    <input type="text" id="j_captcha" placeholder="验证码">
					    <div class="item-input">
					        <img id="captcha_img" alt="点击更换" title="点击更换"
					             οnclick="changeVerifyCode(this)" src="../Kaptcha"/>
					    </div>
					</div> -->
					
					
				<a class="btn">登 录</a>
				<div  id="login01"><a href="login">没有账户?立即注册</a></div>
		</form>
		
		
	</div>


	<!-- footer-尾部 -->
	<div id="footer">
		
		关于我们 | 联系我们 | 人才招聘 | 我要加盟 | 客服中心 | 手机预定 | 友情连接 | 销售中心 | 酒店服务 | 酒店公益 |
		English Site<br /> Copyright © 2001 - 2019 碧涛达维酒店btdawei.com 版权所有
	</div>
<script type="text/javascript">
 $(function(){
	 /* 验证码的js函数 */
	 function changeVerifyCode(img){
			img.src="../Kaptcha?" + Math.floor(Math.random()*100);
		}
	 
 $(".btn").click(function (){
	 var params={
			 username:$("#usernameId").val(),
			 password:$("#passwordId").val(),
		  }
		  var url="user/doLogin";
		  console.log("params",params);
		  $.post(url,params,function(result){
			  if(result.state==1){
					//跳转到indexUI对应的页面
					location.href="index?t="+Math.random();
				  }else{
					/* alert("用户或密码错误") */
					$(".login-box-msg").html("用户名或密码错误"); 
					  }
			  return false;//防止刷新时重复提交
		  });

	 });
  });
 	
</script>
</body>
</html>