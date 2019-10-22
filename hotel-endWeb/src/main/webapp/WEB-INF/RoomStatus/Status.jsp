<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../A8hotel/css/right.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<head>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>
<style type="text/css">
<!--
.style3 {
	color: #FF0000;
	font-weight: bold;
	text-decoration: underline;
}

.ts {
	font-size: 14px;
	color: #FF7200;
	text-decoration: none;
	height: 40px;
	width: 480px;
	background-color: #FDF7CB;
	border-top: 1px solid #6FB16E;
	border-right: 1px solid #6FB16E;
	border-bottom: 1px solid #6FB16E;
	border-left: 1px solid #6FB16E;
	padding-left: 5px;
	padding-right: 5px;
	letter-spacing: 0em;
	margin-left: 10px;
	word-spacing: 0em;
	margin-bottom: 20px;
	margin-top: 10px;
}

.big {
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #333333;
}

#dhbt1 {
	background-image: url(../A8hotel/an_1.gif);
	background-repeat: no-repeat;
	height: 20px;
	width: 130px;
	font-size: 12px;
	color: #000000;
	text-decoration: none;
	float: left;
	text-align: center;
	padding-top: 5px;
}

#dhbt1 a {
	font-size: 13px;
	line-height: 20px;
}

#dhbt2 a {
	font-size: 13px;
	line-height: 20px;
}

#dhbt1 a:hover {
	color: #F66200;
	text-decoration: none
}

#dhbt1 a:link {
	color: #000000;
	text-decoration: none
}

#dhbt1 a:visited {
	color: #000000;
	text-decoration: none
}

#dhbt2 {
	background-image: url(../A8hotel/an_2.gif);
	background-repeat: no-repeat;
	height: 20px;
	width: 130px;
	font-size: 12px;
	color: #F66200;
	text-decoration: none;
	float: left;
	text-align: center;
	padding-top: 5px;
	font-weight: bold;
}

#dhbt2 a:hover {
	color: #F66200;
	text-decoration: none
}

#dhbt2 a:link {
	color: #F66200;
	text-decoration: none
}

#dhbt2 a:visited {
	color: #F66200;
	text-decoration: none
}

#fj_new01 {
	background-image: url(../A8hotel/fj_new01.gif);
	height: 90px;
	width: 90px;
	float: left;
	margin-top: 3px;
	margin-bottom: 15px;
}

#fj_new02 {
	background-image: url(../A8hotel/fj_new02.gif);
	height: 90px;
	width: 90px;
	float: left;
	margin-top: 3px;
	margin-bottom: 15px;
}

#fj_new02_s {
	background-image: url(../A8hotel/fj_new02_s.gif);
	height: 90px;
	width: 90px;
	float: left;
	margin-top: 3px;
	margin-bottom: 15px;
}

#fj_new03 {
	background-image: url(../A8hotel/fj_new03.gif);
	height: 90px;
	width: 90px;
	float: left;
	margin-top: 3px;
	margin-bottom: 15px;
}

#fj_new04 {
	background-image: url(../A8hotel/fj_new04.gif);
	height: 90px;
	width: 90px;
	float: left;
	margin-top: 3px;
	margin-bottom: 15px;
}

#ps {
	height: 60px;
	font-size: 25px;
	width: 90px;
	text-align: center;
	overflow: hidden;
}

.ps_txt_div {
	padding-top: 20px;
}

.ps_txt {
	height: 50px;
	font-size: 27px;
	width: 90px;
	text-align: center;
	line-height: 20px;
	overflow: hidden;
}

.ps_txt:link {
	font-family: "宋体";
	font-size: 27px;
	line-height: 20px;
	color: #000000;
	text-decoration: none;
}

.ps_txt:visited {
	font-family: "宋体";
	font-size: 27px;
	line-height: 20px;
	color: #000000;
	text-decoration: none;
}

.ps_txt:active {
	font-family: "宋体";
	font-size: 27px;
	line-height: 20px;
	color: #000000;
	text-decoration: none;
}

.ps_txt:hover {
	font-family: "宋体";
	font-size: 27px;
	line-height: 20px;
	color: #666666;
	text-decoration: none;
}

#wz {
	height: 30px;
	text-align: center;
	overflow: hidden;
}

.wz_txt {
	height: 30px;
	font-size: 13px;
	line-height: 30px;
	width: 90px;
	text-align: center;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	overflow: hidden;
}

.wz_txt:link {
	height: 30px;
	font-size: 13px;
	line-height: 30px;
	width: 90px;
	text-align: center;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	overflow: hidden;
}

.wz_txt:visited {
	height: 30px;
	font-size: 13px;
	line-height: 30px;
	width: 90px;
	text-align: center;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	overflow: hidden;
}

.wz_txt:active {
	height: 30px;
	font-size: 13px;
	line-height: 30px;
	width: 90px;
	text-align: center;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	overflow: hidden;
}

.wz_txt:hover {
	height: 30px;
	font-size: 13px;
	line-height: 30px;
	width: 90px;
	text-align: center;
	font-weight: bold;
	color: #ffff00;
	text-decoration: none;
	overflow: hidden;
}
-->
</style>
<script>
			function goUrl(obj) {
				location.href = obj.value;
			}
		</script>
<script language="JavaScript">

		</script>

<script type="text/javascript">
			function changeText() {
				document.getElementById("wz").innerHTML = "***";
			}
		</script>
</head>

<body onLoad="document.form1.ss_title.focus();">
	<tr>
		<td class="big">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<div id='dhbt2' class="all" onclick="LzxClick(this)"
							style='cursor: hand'>
							<a href='?dqfx=all'>所有房间</a>
						</div>
						<div id='dhbt1' class="jjx" onclick="LzxClick(this)"
							style='cursor: hand'>
							<a href='?dqfx=jjx'>经济型</a>
						</div>
						<div id='dhbt1' class="ssx" onclick="LzxClick(this)"
							style='cursor: hand'>
							<a href='?dqfx=ssx'>舒适型</a>
						</div>
						<div id='dhbt1' class="gdx" onclick="LzxClick(this)"
							style='cursor: hand'>
							<a href='?dqfx=gdx'>高档型</a>
						</div>
						<div id='dhbt1' class="hhx" onclick="LzxClick(this)"
							style='cursor: hand'>
							<a href='?dqfx=hhx'>豪华型</a>
						</div>

					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td>
			<c:forEach items="${status}" var="s">
			<div id="fj_new0${ s.roomStatus }"
				onClick="javascript:window.location.href='fj_kd.html?tid=574' ">
				<div id="ps">
					<div style="height:16px;overflow:hidden;position:absolute; width:90px; line-height:16px;z-index:100;float: left;color: #ffffff;cursor:hand;font-size: 12px;background-image: url(../A8hotel/yd_tb.gif);" onclick="javascript:window.location.href='fj_kd.html?tid=136' ">${ s.roomZt }</div>
					<div class='ps_txt_div'>
						<a href='fj_kd.html?tid=574' class='ps_txt'>${ s.roomNumber }<br> <span
							style='font-size: 12px; color: #666666;'>${ s.roomName }</span></a>
					</div>
				</div>
				<div id="wz">
					<a href='fj_kd.html?tid=574' class='wz_txt'>${ s.roomPrice }</a>
				</div>
			</div>
		</c:forEach>

		</td>
	</tr>

	</table>
</body>
<script type="text/javascript">

	//获取url 参数
	//调用此函数传入一个参数名 获取参数名的value值
	function getQueryVariable(variable){
	      var query = window.location.search.substring(1);
	      var vars = query.split("&");
	      for (var i=0;i<vars.length;i++) {
	             var pair = vars[i].split("=");
	             if(pair[0] == variable){return pair[1];}
	      }
	      return(false);
}
		 
		    var zx = getQueryVariable('dqfx');
		    console.log(zx);
		    //将所有标题设置绿色
		    $("div.all").attr('id','dhbt1');
		    $("div.jjx").attr('id','dhbt1');
		    $("div.ssx").attr('id','dhbt1');
		    $("div.gdx").attr('id','dhbt1');
		    $("div.hhx").attr('id','dhbt1');

		    //获取url参数dqfx的值设置为橙色
		    $("div."+zx).attr('id','dhbt2');
		    	

</script>

</html>