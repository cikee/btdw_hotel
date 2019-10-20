<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>我的订餐</title>
			<style type="text/css">
				
				.grade .title h3{
					font-size: 18px ;
					color: #da004c;
				}
				.grade .grade-info .left > p{
					color: #807f7f;
				}
				
				.grade .grade-info .right {
					position: absolute;
					top: 300px;
					margin-left: 600px;
				}
				.grade .grade-info .right .img > p{
					position: absolute;
					top: 70px;
					margin-left: 100px;
				}
				.rightpages .grade .order-list table{
					width: 900px;
					height:300px;
					 text-align:center;
				} 
				#tbodyId{
				font-size:5px;
				
				}
					.th1{
					font-size:12px;
					border: 1px solid black; 
				}
				#pageId{
					margin-top: 10px;
				}
			</style>
		</head>
		<body>
			<div class="rightpages">
				<div class="grade">
					<div class="title">
						<h3>我的订餐</h3>
						<div class="box-tools" style="position: relative;">
							<div class="input-group" style="position:relative;left: 500px;width: 350px;height: 30px;">
								<input type="text" name="table-search" id="searchNameId" placeholder="用户名"/>
							</div>
							<div class="input-group-btn" style="position:relative;width: 200px;left: 700px;height: 30px;">
								<button type="button" class="btn-search">
									<i class="btn-search-log">查询</i>
								</button>
								<button type="button" class="btn btn-default btn-delete">取消订单</button>
							</div>
						</div>
					</div>
					<div class="order-list">
						<table class="order-table">
							<thead id="first-thead">
								<tr><th><input type="checkbox" id="checkAll">全选</th>
									<th class="th1">用户姓名</th>
									<th class="th1">菜单名称</th>
									<th class="th1">价格(元)</th>
									<th class="th1">订餐编号</th>
									<th class="th1">用户电话</th>
									<th class="th1">下单时间</th>
									
								</tr>
							</thead>
							<tbody  id="tbodyId">
								 <tr>
						       <td colspan="3">数据正在加载中...</td>
						       </tr>
							</tbody>
						</table>
						</div>
						<div id="pageId" class="box-footer clearfix">
			      
			       </div>
					</div>
				</div>
		</body>
		 <script type="text/javascript">
		$(function(){
			  //页面加载完成异步加载doPageUI对应的资源
			  //并将资源添加在pageId对应的位置.
			  //function(){}异步加载结束以后调用
			  //$("#pageId").load("doPageUI",function(){
			   //加载数据并呈现数据
			   // doGetObjects();
			  //});
			  //如下写法等价于上面的写法.
			  $("#pageId").load("doPageUI",doGetObjects);
			  $(".input-group-btn")
			  .on("click",".btn-search",doQueryObjects)
			  .on("click",".btn-delete",doDeleteObjects) 
			  //基于tbody中checkbox状态,修改thead中checkbox状态
			  $("#checkAll").change(doChangeTBodyCheckBoxState)
			  $("#tbodyId").on("change",".cBox",doChangeTHeadCheckBoxState)
		   });
		 function doChangeTBodyCheckBoxState(){
			 //1.获取点击对象的状态
                 var flag=$(this).prop("checked");
                 //2.修改tbody中checkbox的状态
                 $("#tbodyId input[type='checkbox']")
                 .each(function(){
                        $(this).prop("checked",flag);
                     })
			   }
		   function doChangeTHeadCheckBoxState(){
                   var flag=true;
                   $("#tbodyId input[type='checkbox']")
                   .each(function(){
                       flag=flag&&$(this).prop("checked")
                       });
                   $("#checkAll").prop("checked",flag)
     			   }
		   //点击删除按钮时执行删除操作
		   function doDeleteObjects(){
			 
			   //1.获取选中记录对象的checkbox的值并进行判定
			   var idArray=doGetCheckedIds();
			   //console.log(idArray.toString());//37,38
			   if(idArray.length==0){
				   alert("请先选中");
				   return;
			   }
			   if(!confirm("确认删除吗?"))return;
			   //2.构建请求参数
			 var params={"ids":idArray.toString()};
			   //3.构建请求url
			  var url="doDeletelunchOrders";
				  
			   //4.发送异步请求执行删除操作.
			  $.post(url,params,function(result){
                 if(result.state==1){alert(result.message);
                 doSetPageCurrent();
                 doGetObjects();
                 
                 }else{alert(result.message);}
				  })
			   }
		 //删除以后刷新
		   function doSetPageCurrent(){
               var pageCurrent=$("#pageId").data("pageCurrent");
               var pageCount=$("#pageId").data("pageCount");
               var checked=$("#checkAll").prop("checked");
               if(checked&&pageCurrent==pageCount&&pageCurrent>1){
                      pageCurrent--;
                      $("#pageId").data("pageCurrent",pageCurrent)}
		  }
		   function doGetCheckedIds(){
                var idArray=[];
                $("#tbodyId input[type='checkbox']")
                .each(function(){
                    if($(this).prop("checked")){idArray.push($(this).val())}
                    })
                    return idArray;
			   }
		   
		 //基于条件username进行日志查询
		   function doQueryObjects(){
			   //1.初始化当前页码
			   $("#pageId").data("pageCurrent",1);
			   //2.基于条件进行查询
			   doGetObjects();//重用
		   }
		 
		   //异步(底层启动工作线程)加载服务端数据
		   function doGetObjects(){
			//debugger
			var pageCurrent=$("#pageId").data("pageCurrent");
			if(!pageCurrent)pageCurrent=1;
			var params={"pageCurrent":pageCurrent};
			 var url="dofindUserLunchOrderInfo";
			 var usename=$("#searchNameId").val();
			 if(usename)params.username=usename;
			 $.get(url,params,function(result){
				 //console.log(result);
				 doHandleResponseResult(result);
				 });
		   }
		 function doHandleResponseResult(result){
            if(result.state==1){
                   doSetTableBodyRows(result.data.records);
                   //debugger
                   doSetPagination(result.data);
                }else{alert(result.message);
                }
			 }
		 function doSetTableBodyRows(records){
			 var tBody=$("#tbodyId");
			 tBody.empty();
			 for(var i=0;i<records.length;i++){
                    var tr=$("<tr></tr>");
                            
                    var tds=doCreateTds(records[i]);
                    tr.append(tds);
                    tBody.append(tr);
				 }
			 }
		 function doCreateTds(data){
			 var tds="<td><input type='checkbox' class='cBox' name='cItem' value='"+data.id+"'></td>"+
			 "<td>"+data.username+"</td>"+
		     "<td>"+data.ordername+"</td>"+
		     "<td>"+data.price+"</td>"+
		     "<td>"+data.orderid+"</td>"+
		     "<td>"+data.userphone+"</td>"+
		     "<td>"+data.ordertime+"</td>";
			 return tds;	
			 }
		 
		</script>  
	</html>
