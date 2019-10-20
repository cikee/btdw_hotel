<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人基础信息</title>
		<link rel="stylesheet"  href="css/basic-info.css"/>
	</head>
	<body>
		<div class="rightpages" id="gradee">
		
			<div class="grade" >
				<div class="title">
					<h3>基础信息</h3>
				</div>
				<div class="myinfo">
					<div class="mybasic">
						<span >
							姓名:
						</span>
						<label><input type="text"  id="myname" value="username"/></label>
						<!-- <input type="button" name="" id="modify-name" value="修改" /> -->
					</div>
					<div class="mybasic">
						<span>
							身份证编号:
						</span>
						<label><input type="text"  id="mycard" value="ID card" /></label>
						<!-- <input type="button" name="" id="modify-id" value="修改" /> -->
					</div>
						<div class="mybasic">
						<span >
							联系电话:
						</span>
						<label><input type="text"  id="myphone" value="telephone" /></label>
						<!-- <input type="button" name="" id="modify-phone" value="修改" /> -->
					</div>
						<div class="mybasic">
						<span >
							邮箱:
						</span>
						<label><input type="text"  id="myemail" value="Email" /></label>
						<!-- <input type="button" name="" id="modify-email" value="修改我的信息" /> -->
					</div>
					 <input type="button" name="" id="modify-email" value="修改我的信息"  
					 /> 
				</div>
			</div>	
	</body>
	<script type="text/javascript">
      $(function(){
         var url="doFindUserInfo";
         var params={"username":"${ username }"};
         $.get(url,params,function(result){
         console.log(result);
         doHandleResponseResult(result.data);
         })});
      function doHandleResponseResult(data){
    	  console.log(data.username);
    	  var myname=$("#myname");
    	  myname.empty();
    	  $("#myname").val(data.username);
    	  $("#myphone").val(data.userphone);
    	  $("#mycard").val(data.useridcard);
    	  $("#myemail").val(data.useremail);
    	  
          }
      $(function(){
			doLoadUI("modify-email","pages/basicinfoedit")
		})
		function doLoadUI(id,url){
			$("#"+id).click(function(){
				$("#rightpagee").load(url);
			})
		}
	</script>
</html>
