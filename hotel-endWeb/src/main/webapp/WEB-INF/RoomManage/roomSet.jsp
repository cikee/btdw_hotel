<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 引入jquery包 -->
<script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
	<!-- 引入自家css和js -->
<link rel="stylesheet" type="text/css"
	href="../../css/roomSetCSS/roomSet.css">
<script type="text/javascript" src="../../js/roomSetJS/roomSet.js"></script>
	
	
	<!-- 加入layUI的css,js路径 -->
<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
<script type="text/javascript" src="../../layui/layui.js"></script>
</head>
<body>
	<div id="content">
<!-- 		<div id="title">房间类型设置</div> -->
		<div id="selectHotel">
			<span id="s1">选择操作门店:</span> 
			<select name="stores" id="stores">
				<option value="碧涛达维酒店" selected="selected">碧涛达维酒店</option>
			</select> 
			<span id="s2">当前操作门店:<span style="color: red;">碧涛达维酒店</span></span>
		</div>
		<div id="inserRoom">
			<span><a href="#" onclick="openRoom()" id="open_room"><i class="layui-icon layui-icon-add-1"></i>增加房间类型</a></span>
			<div id="insert_room">
			<form id="insertRoom1">
			<table id="tb_insert">
				<tr>
					<td id="i1">房间类型：</td>
					<!-- 隐式的房间主键id值 -->
					<input name="id" style="display:none">
					<td id="i2"><input type="text" name="roomTypename" class="el-input">*</td>
				</tr>
				<tr>
					<td id="i1">默认房价：</td>
					<td id="i2"><input type="text" name="roomPrice" class="el-input">元/晚*</td>
				</tr>
				<tr>
					<td id="i1">预设押金：</td>
					<td id="i2"><input type="text" name="roomDeposit" class="el-input">元</td>
				</tr>
				<tr>
					<td id="i1">钟点房价格：</td>
					<td id="i2"><input type="text" name="roomHourprice" class="el-input">元/3小时<br />
					<span>超过3小时按<input type="text" name="roomTimeout" class="el-input">元/小时</span>
					</td>
				</tr>
				<tr>
					<td id="i1">订房说明：</td>
					<td id="i2"><textarea rows="5" cols="30" placeholder="房间备注" name="roomRemark" class="el-input"></textarea></td>
				</tr>
				<tr>
					<td id="i1">房间照片：</td>
					<td id="i2"><input type="file" name="roomImgaddr" class="el-input" ></td>
				</tr>
				<tr>
					<td id="i3" colspan="2"><div id="comfirm"><a href="#" onclick="insertRoome()" id="in">确认增加</a></div>
					<div id="close"><a href="#" onclick="closeRoom()">取消</a></div></td>
				</tr>
			</table>
			</form>
			</div>
		</div>
		<table id="tb_roomType">
			<tr id="firstTR">
				<th id="t1">房间类型</th>
				<th id="t2">默认单价</th>
				<th id="t3">钟点价格</th>
				<th id="t4">押金</th>
				<th id="t5">订房说明</th>
				<th id="t6">管理操作</th>
			</tr>
			<c:forEach items="${RoomType}" var="r">
			<tr id="secondTR">
				<td id="td1">${ r.roomTypename }</td>
				<td id="td2">${ r.roomPrice }元</td>
				<td id="td3">${ r.roomHourprice }元(${r.roomTimeout}元)</td>
				<td id="td4">${ r.roomDeposit }元</td>
				<td id="td5">${ r.roomRemark }</td>
				<td id="td6">
				<!-- 隐式的房间主键id值 -->
				<input id="roomid" value="${ r.id }" style="display:none">
				<a href="#" onclick="updateRoom(this)"><i class="layui-icon layui-icon-edit"></i>修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#" id="delete" onclick="deleteRoom(this)"><i class="layui-icon layui-icon-close"></i>删除</a>
				</td>
			</tr>
			</c:forEach>
		</table>
		<!-- 隐式的房间所有记录值 -->
		<input id="count" name="Count" value="${ rowCount }" style="display:none">
		<div id="page"></div>
	</div>
</body>
<!-- 分页技术  -->
<script>
function flushPage(curr){
	//$.get("/RoomManage/findPageById/"+curr)
    location.href="/RoomManage/findPageById/"+curr
}
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


layui.use('laypage', function(){
  var laypage = layui.laypage;
  
  //执行一个laypage实例
  laypage.render({
    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
    ,count: $("#count").attr("value")//数据总数，从服务端得到
    ,curr: getQueryVariable('page') || 1
    ,limit:4
    ,jump: function(obj,first){
        //obj包含了当前分页的所有参数，比如：
        //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
        //console.log(obj.limit); //得到每页显示的条数
        //首次不执行
        if(!first){
	       	/* var curr=obj.curr
        	console.log(curr);
        	flushPage(curr);	  */	//http://localhost:8082/RoomManage/findPageById?page=curr
      window.location.href = ("/RoomManage/findPageById".split("?")[0] +'?page='+obj.curr);
            }
          
      }
  });
});
</script>
</html>