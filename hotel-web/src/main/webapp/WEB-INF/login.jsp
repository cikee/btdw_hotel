<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="js/jquery-1.8.3.min.js"></script>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<form  method="post">
		<div id="b">	
		
			<h1>成为碧涛达维会员</h1>
			<div id="a">
				尊享免费Wi-Fi 网络, 手机登记入住以及会员房价。
			</div>	
		
			<div id="c">用户名</div>
			<div id="d">
				<input type="text" name="username" id="usernameId"/> 
				</div>
			
			<div id="c">电话</div>
			<div id="d">
				<input type="text" name="userPhone" id="userPhoneId"/>
			</div>
			
			<div id="c">密码</div>
			<div id="d">
				<input type="password" id="i1" name="password" id="passwordId"/>
			</div>
			<div id="c" >确认密码</div>
			<div id="d">
				<input type="password" id="i2" name="pass" />
			</div>
			<div id="d" class=".input-group-btn">
				<a id="btn" class="register">注 册</a>
                 <!--  <input type="submit" class="register" name="zhuce" value="注册"/> -->
			</div>
			
			</div>	
	</form>	
<script type="text/javascript">
  $(function(){
	 $(".register").click(function(){
		  var params={
					 userName:$("#usernameId").val(),
					 userPwd:$("#i1").val(),
					 userNewPwd:$("#i2").val(),
					 userPhone:$("#userPhoneId").val(),
				  }
		  console.log("params"+params)
		//3.ajax request
		  var url="user/doregister";
		$.post(url,params,function(result){//JsonResult
			console.log(result);
			 if(result.state==1){
				alert(result.message);
				location.href="loading?t="+Math.random();
		       }else{
		    	   $("#a").html(result.message); 
		    	   console.log("ddd");
		    	   /* $("#a").html("注册失败");  */
			   }
		
			}); 
	}); 

	 console.log("aaa");
   }); 
//1.params
 
</script>
</body>
</html>