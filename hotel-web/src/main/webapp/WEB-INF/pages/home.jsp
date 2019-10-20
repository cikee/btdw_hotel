<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的首页</title>
		<style type="text/css">
			
			.grade .title h3{
				font-size: 18px ;
				color: #da004c;
			}
			#clubcard{
				color: #FFCE14;
			}
			
			.grade .grade-info .right {
				position: absolute;
				top: 300px;
				margin-left: 500px;
			}
			#clubcard{
				position: absolute;
				top: 70px;
				margin-left: 100px;
				
			}
		</style>
	</head>
	<body>
		<div class="rightpages">
			<div class="grade">
				<div class="title">
					<h3>我的等级</h3>
				</div>
				<div class="grade-info">
					<div class="left">
						<p> <span > 您的会员级别是: </span> <span> 普通会员 </span> </p>
						<p> <span > 您的信用等级: </span> <span> 信用普通 </span> <span> (350分) </span></p>	
						<p> <span > 您已加入会员: </span> <span> 7天 </span> </p>
						<div class="rights">
							<p>我的权益</p>
							<p>1、享受最低门市价9折优惠。</p>
							<p>2、享受本人入住最高1.7倍房费积分。</p>
							<p>3、享受预订保留至18:00，延迟退房至12:00。</p>
						</div>
					</div>
					<div class="right">
						<div class="img">
							<img src="img/01.png" />
							<p id="clubcard">20190916001</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</body>
	<script type="text/javascript">
	$(function(){
        var url="doFindUserInfo";
        var params={"username":"jin"};
        $.get(url,params,function(result){
        //console.log(result);
        doHandleResponseResult(result.data);
        })});
     function doHandleResponseResult(data){
   	 //debugger
   	  var clubcard=$("#clubcard");
   	clubcard.empty();
    	var format=data.userdatetime;
    	
 
    	Date.prototype.format = function(format) {
            var o = {
                "M+" : this.getMonth() + 1,// month
                "d+" : this.getDate(),// day
                "h+" : this.getHours(),// hour
                "m+" : this.getMinutes(),// minute
                "s+" : this.getSeconds(),// second
                "q+" : Math.floor((this.getMonth() + 3) / 3),// quarter
                "S" : this.getMilliseconds()
                // millisecond
            };
            if (/(y+)/.test(format) || /(Y+)/.test(format)) {
                format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            }
            for ( var k in o) {
                if (new RegExp("(" + k + ")").test(format)) {
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
                }
            }
            return format;
    };
        	
    var cd=(new Date(parseFloat(format))).format("yyyyMMddhhmmss")
	
   	 $("#clubcard").html(cd);
   	
         }
	</script>
</html>
