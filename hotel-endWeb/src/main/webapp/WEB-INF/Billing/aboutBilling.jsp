<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/billing.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {color: #FF0000}
.STYLE1 {color: #4F4F4F}
#dh_001 {
	font-size: 15px;
	font-weight: bold;
	color: #376428;
	text-decoration: none;
	height: 30px;
	width: 100%;
	padding: 5px;
	border-bottom-width: 2px;
	border-bottom-style: solid;
	border-bottom-color: #FFFFFF;
	cursor: hand;
	background-color: #D6F8A4;
	margin: 10px 0px 10px 0px;
}
.style1 {color: #FF0000}
#a2{
	overflow-y:auto;
	overflow-x:hidden;
}
#fj {
	border-radius: 25px;
	background-color: #B0C4DE;
	height: 50px;
	width: 85px;
	float: left;
	margin-top: 3px;
	margin-left: 3px;
	margin-bottom: 3px;
	text-align: center;
	cursor: hand;
}
#fj_txt{
	height: 25px;
	width: 85px;
	font-size:15px;
	color: #0000ff;
	font-weight: bold;
	overflow: hidden;
}
#fj_b {
	background-image: url(./images/fj_12_b.gif);
	height: 50px;
	width: 85px;
	float: left;
	margin-top: 3px;
	margin-bottom: 3px;
	text-align: center;
}
#fj_txt{
	height: 25px;
	width: 85px;
	font-size:17px;
	color: #0000ff;
}
#fj_txt2{
	height: 25px;
	width: 85px;
	font-size:17px;
	color: #0000ff;
}
.checkbox{
color: #ff0000;
}

.checkbox2{
color: #000000;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function toggle(targetid){
	var target=document.getElementById(targetid);  
	var chks=target.getElementsByTagName("input");
	if (chks[0].checked==true)
	{
		for(var i=0;i<chks.length;i++){
			if (chks[i].type == 'checkbox') { 			
				chks[i].checked=false;
			} 
		}
	}else{
		for(var i=0;i<chks.length;i++){
			if (chks[i].type == 'checkbox') { 			
				chks[i].checked=true;
			} 
		}
	}
}
-->
</script>
<script language="javascript" src="/js/billing.js"></script>
<script type="text/javascript">
function doit()
{  
var n=0;
                var objs = document.getElementsByName("fj[]"); 
                for(var i=0; i<objs.length; i++)   
                {
                  if(objs[i].checked) 
                  {
                  n++;
                  } 
                }
                document.getElementById("yx_fj").innerText="已选 "+n+" 间";
}
</script>
</head>
<body onload="document.getElementById('bz1').innerHTML=' <span id=bz$i style=color:#666666>(单击关闭或显示)</span>';">
<script type='text/javascript'>document.write("<audio autoplay='autoplay'><source src='http://fanyi.baidu.com/gettts?lan=zh&ie=GB2312&spd=6&text=%E6%AC%A2%E8%BF%8E%E5%85%A5%E4%BD%8F%E5%90%9B%E6%9D%A5%E5%A4%A7%E9%85%92%E5%BA%97+%2C%E8%AF%B7%E5%87%BA%E7%A4%BA%E6%82%A8%E7%9A%84%E8%BA%AB%E4%BB%BD%E8%AF%81%E4%BB%B6' type='audio/mpeg'><embed height='0' width='0' src='http://fanyi.baidu.com/gettts?lan=zh&ie=GB2312&spd=6&text=%E6%AC%A2%E8%BF%8E%E5%85%A5%E4%BD%8F%E5%90%9B%E6%9D%A5%E5%A4%A7%E9%85%92%E5%BA%97+%2C%E8%AF%B7%E5%87%BA%E7%A4%BA%E6%82%A8%E7%9A%84%E8%BA%AB%E4%BB%BD%E8%AF%81%E4%BB%B6'> </audio>");</script>
<script language="javascript">
window.onload=function(){
     document.getElementById("cx_mumber").focus();
} 
</script>
<div id="a2">
	<div id="b1"> 团队开单 </div>
	<div id="t1">	  
	    <table width="100%"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#DADADA">
		<form name="form1" method="post" action="./ttkd.php" id="form1">
          <tr bgcolor="#FFFFFF">
            <td  align="center" bgcolor="#FDDB79" style="font-size: 15px;line-height:30px;"> 

	
			  			 <span class="style1">VIP客户请先刷卡或输入</span><font color="#0000ff">会员卡号或手机号：</font>	
                <input name="cx_mumber" type="text" class="biaod_txt" id="cx_mumber"  style="width:180px;">
					<input name="Submit" type="submit" id="Submit" value="确定"   onSubmit="return check()"  onMouseOver="this.className='btn_over'"  onMouseOut="this.className='btn_out'" class="btn_out">	
 			  			    </td>
          </tr>
	 </form>	
	  <form name="form1" method="post" action="./fjkd">  
          <tr bgcolor="#FFFFFF">
            <td>
			<div id='dh_001' onClick=toggle('d1');doit();>高档型 <span id='bz1' style='color:#0000ff;font-weight: normal;'>全选</span></div>
			<div id=d1 style='table-layout:fixed; word-break: break-all; overflow:hidden;font-size: 15px;display=block;width:100%;'>该类下暂无可开房间</div>
			<div id='dh_001' onClick=toggle('d2');doit();>经济型单间 <span id='bz2' style='color:#0000ff;font-weight: normal;'>全选</span></div>
			<div id=d2 style='table-layout:fixed; word-break: break-all; overflow:hidden;font-size: 15px;display=block;width:100%;height:100px'>
				<c:forEach items="${ecRoomList}" var="room" varStatus="status">
					<label class='checkbox2'><li id='fj'><div id='fj_txt2'>${room.id}</div></span>开房:<input name='fj[]' type='checkbox' onclick='doit();' id='fj[]' value=${room.id}></li></label>
				</c:forEach>
			</div>
			<div id='dh_001' onClick=toggle('d3');doit();>经济双人间 <span id='bz3' style='color:#0000ff;font-weight: normal;'>全选</span></div>
			<div id=d3 style='table-layout:fixed; word-break: break-all; overflow:hidden;font-size: 15px;display=block;width:100%;height:100px'>
				<c:forEach items="${ecDoubleRoomList}" var="room" varStatus="status">
					<label class='checkbox2'><li id='fj'><div id='fj_txt2'>${room.id}</div></span>开房:<input name='fj[]' type='checkbox' onclick='doit();' id='fj[]' value=${room.id}></li></label>
				</c:forEach>
			</div>
			
			<div id='dh_001' onClick=toggle('d4');doit();>豪华单人房 <span id='bz4' style='color:#0000ff;font-weight: normal;'>全选</span></div>
			<div id=d4 style='table-layout:fixed; word-break: break-all; overflow:hidden;font-size: 15px;display=block;width:100%;height:100px'>
				<c:forEach items="${ecDoubleRoomList}" var="room" varStatus="status">
					<label class='checkbox2'><li id='fj'><div id='fj_txt2'>${room.id}</div></span>开房:<input name='fj[]' type='checkbox' onclick='doit();' id='fj[]' value=${room.id}></li></label>
				</c:forEach>
			</div>
			</td>

          </tr>  <tr bgcolor="#FFFFFF">
            <td>
              <div align="center">
			  <span id="yx_fj" style="color: #ff0000;font-size: 19px;"></span>
                <input name="g_mumber" type="hidden" id="g_mumber" value=""> 
				<input type="submit" name="Submit" value=" 下一步 " onMouseOver="this.className='btn_over'"  onMouseOut="this.className='btn_out'" class="btn_out">
              </div></td>
          </tr>
		  </form>
        </table>
      
	</div>
</div>
</body>
</html>
