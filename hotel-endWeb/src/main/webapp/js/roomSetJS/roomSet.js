function deleteRoom(obj){
	//获取点击的
	var id=$(obj).siblings("#roomid").attr("value");
	
layui.use('layer', function(){
	var layer = layui.layer;
	layer.open({
		area: ['600px', '200px'],
		title: '管理操作',
		content: '您确认删除此房间吗?',
		btn: ['确认', '取消'],
		yes:function(index){
			$.ajax({
				url:"/RoomManage/deleteRoom?id="+id,
				type:"GET"
			});
		//弹出关闭
		layer.close(index)
		//删除点击所在行
		$(obj).parents("#secondTR").remove();
		//刷新分页,但是会跳到首页
		//location.href="/RoomManage/findPageById?id";
			}
	}); 
	
});
}

function openRoom(){
	var text=$("#in").html()
	if(text=="确认修改"){
		$("#in").html("确认添加")
	}
	var value=$("input[type='text']").attr("value");
	if(value){
		$("input[type='text']").attr("value","");
	}
	$("#insert_room").toggle(200);
}

function insertRoome(){
//		//获取表单所有值
//		var formId=$("#insertRoom1");
//		var from=document.getElementById(formId);
//		var tagElements=from.getElementsByClassName('el-input');//这里我把所有我要获取值得属性都使用了同一个类来标识；
//		var tagElements=$(".el-input")
//		console.log(tagElements)
//		var json={};
//		  for (var j = 0; j < tagElements.length; j++){  
//				var name=tagElements[j].name;//这里就是要获取得name属性，将此name属性作为json对象得key；
//				var value=tagElements[j].value;
//		  		json[name] = value; 	//注意这里必须要使用这种方式给json赋值。如果使用json.name=value得话你会发现你所有的key都是一个字符串name，而不是name代表的值
//		  } 
//		console.log(json)
//		var obj=JSON.stringify(json)
//		console.log(obj)
	var text=$("#in").html()
	if(text=="确认修改"){
		console.log("进入修改方法")
		var room=$("#insertRoom1").serialize()
		$.ajax({
			url:"/RoomManage/updateRoom",
			type: "POST",
			data: room,
			success:function(data){
				if(data.status==200){
					console.log("修改房间成功")
				}
			}
		});
		//修改后将值清空
		$("input[type='text']").attr("value","");
	}else{
		//序列化表单,把name当key.value为value 以key=value&的结构传输
		var room=$("#insertRoom1").serialize()
		console.log(room)
		$.ajax({
			url:"/RoomManage/insertRoom",
			type: "POST",
			data: room,
			success:function(data){
				if(data.status==200){
					console.log("测试添加")
				}
			}
		});
		
	}
	//添加或修改后刷新查询结果
	location.href="/RoomManage/roomType_set";
}

function closeRoom(){
	$("#insert_room").hide(500);
}

function updateRoom(obj){
	var id=$(obj).siblings("#roomid").attr("value");
	$("#in").html("确认修改")
	$.ajax({
		url:"/RoomManage/findRoom?id="+id,
		type:"POST",
		dataType:"json",   //服务器返回的数据转成json   测试之后好像对json没用  效果一样  老师使用在jsonp环境下
		success:function(data){
			if(data.status==200){
				var r=data.data;  //将data数据取出
				$("input[name='id']").attr("value",r.id)
				$("input[name='roomTypename']").attr("value",r.roomTypename)
				$("input[name='roomPrice']").attr("value",r.roomPrice)
				$("input[name='roomDeposit']").attr("value",r.roomDeposit)
				$("input[name='roomHourprice']").attr("value",r.roomHourprice)
				$("input[name='roomTimeout']").attr("value",r.roomTimeout)
				$("input[name='roomRemark']").attr("value",r.roomRemark)
				$("input[name='roomImgaddr']").attr("value",r.roomImgaddr)
			}
		}
	});
	$("#insert_room").show(500);
	
}

