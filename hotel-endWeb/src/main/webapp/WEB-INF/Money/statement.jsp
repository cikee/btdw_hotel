<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../../layui/css/layui.css"  media="all">
  <style>#select1{ position: absolute; left: 410px;top: 20px;}
  .f111 span{ font-size:17px }
 
  </style>
</head>
<body>
  <div class="f111"><span>日期选择</span><input type="text" name="ss" class="layui-input" id="test1" value="" style="width: 400px;height:40px;border:1px solid green">

  <button type="button" class="layui-btn" id="select1">查询</button> </div>  	 
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
 <div id="main" style="width: 800px;height:400px;border:1px solid green"></div>	
 <table id="demo" lay-filter="test"  ></table> 
<button class="export">导出报表</button>
<script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
<script src="../../layui/layui.js"></script>
<script type="text/javascript" src="../../js/echarts.min.js"></script>
<script type="text/javascript">
function showinfo(result1,result2){
layui.use('table', function(){
	
	  var table = layui.table;
	  //第一个实例
	  var ins1=table.render({
	    elem: '#demo'
	    ,defaultToolbar: ['filter', 'print', 'exports'] 
	    ,height: 312
	    ,url: '/Money/doFindPages'
         //数据接口
        ,where:{start:result1,end:result2}
	    ,page: {//分页
	    	limit: 5,//默认几条数据一页
	    	limits: [5, 10, 15, 20, 25, 30]//可选几条一页
	    	}
	    ,method: 'post'
	    ,request: {
	    	    pageName: 'pageCurrent' //页码的参数名称，默认：page
	    	    ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
	  	    	  }
	    ,response: {
	        statusName: 'state' //规定数据状态的字段名称，默认：code
	        ,statusCode: 1 //规定成功的状态码，默认：0
	        ,msgName: 'message'
		    ,countName: 'rowCount'
	    }
	    ,done: function (res, curr, count) {
            exportData = res.data;
        }
	    ,cols: [[ //表头
	      {type: 'checkbox'}
	      ,{field: 'id', title: 'ID', width:80}
	      /* ,{field: 'roomType', title: '房间类型', width:80}
	      ,{field: 'roomBedtype', title: '床型', width:80, sort: true}
	      ,{field: 'roomBedsize', title: '床大小', width:80} 
	      ,{field: 'roomSize', title: '房间尺寸', width: 177} */
	      /* ,{field: 'roomFloor', title: '楼层', width: 80, sort: true}
	      ,{field: 'minPrice', title: 'min房价', width: 80, sort: true}
	      ,{field: 'maxPrice', title: 'max房价', width: 80} 
	      ,{field: 'storeId', title: '酒店id', width: 135, sort: true}*/
	      ,{field: 'hotelAddr', title: '酒店地址', width: 80, sort: true}
	      ,{field: 'hotelName', title: '酒店名字', width: 80}
	      ,{field: 'hotelPhone', title: '酒店电话', width: 135, sort: true}
	      /* ,{field: 'inDay', title: '入住时间', width: 80, sort: true}
	      ,{field: 'outDay', title: '离店时间', width: 80} */
	      ,{field: 'orderPrice', title: '订单价格', width: 135, sort: true}
	      ,{field: 'time', title: '入住时长', width: 135, sort: true}
	     /*  ,{field: 'roomNum', title: '房间号', width: 135, sort: true} */
	      ,{field: 'orderId', title: '订单号', width: 135, sort: true}
	      ,{field: 'userName', title: '用户名', width: 135, sort: true}
	      ,{field: 'userPhone', title: '用户电话', width: 135, sort: true}
	      /* ,{field: 'loginUser', title: '登录名', width: 135, sort: true} */
	    ]]
	    
	  });
	 
	//导出按钮
      $(".export").click(function () {
          table.exportFile(ins1.config.id, exportData, 'xls');
      });
	});}
layui.use('laydate', function(){
	  var laydate = layui.laydate;	  
	//日期范围选择
	 laydate.render({
		  elem: '#test1'
		,range: true
		,format: 'yyyy-MM-dd HH:mm:ss'
		  ,done: function(value, date, endDate){
		    //console.log(value); //得到日期生成的值，如：2017-08-18
		    //console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
		    //console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
			 doselect(date,endDate) ;
			
			 
			  }
		});
	
	  
	});
    //var choseday1=$("#test1").val.value;
    //var choseday2=$("#test1").val.endDate;
    // 基于准备好的dom，初始化echartjquery-2.1.1.min.jss实例
    function formatTen(num) { 
return num > 9 ? (num + "") : ("0" + num); 
} 
   function formatDate(date) { 
var year = date.getFullYear(); 
var month = date.getMonth(); 
var day = date.getDate(); 
var hour = date.getHours(); 
var minute = date.getMinutes(); 
var second = date.getSeconds(); 
return year + "-" + formatTen(month) + "-" + formatTen(day)+" "+hour+":"+minute+":"+second; 
} 

  
    function doselect(result1,result2){
        //console.log(result1);
        var y=result1.year;
        var m=result1.month;
        var dd=result1.date;
        var h=result1.hours;
        var mm=result1.minutes;
        var s=result1.seconds;
        var start1=new Date();
        start1.setFullYear(y,m,dd);
        start1.setHours(h,mm,s);
        var result1=formatDate(start1);
        
        var y=result2.year;
        var m=result2.month;
        var dd=result2.date;
        var h=result2.hours;
        var mm=result2.minutes;
        var s=result2.seconds;
        var end1=new Date();
        end1.setFullYear(y,m,dd);
        end1.setHours(h,mm,s)
        var result2=formatDate(end1);
        console.log(result1);
        console.log(result2);
        
    	var myChart=echarts.init(document.getElementById("main"));
    	   //console.log(choseday1)
    	    // 指定图表的配置项和数据 
    	    var countTime = [];
    	    var orderPrice = [];
    	    console.log("111")   
        $("#select1").click(function(){
        $.ajax({
			url:"/echarts/queryBarGraphList",
			type:"POST",
			data:{"start":result1,"end":result2},
			success: function(data1){
				
				 var datA=data1.data
				 
				 var option ={
				         color: ['#0AA3B5'],
				          title: {
				              text: '酒店收入'
				          },
				          tooltip: {trigger: 'axis'},
				          legend: {
				              data:['住房收入']
				          },
				          xAxis: {
				        	 type: 'category',
				            data: datA.countTime
				          },
				          yAxis: {},
				          series: [{
				              name: '元',
				              type: 'line',
				              data: datA.orderPrice,
				              itemStyle : { normal: {label : {show: true}}}
				          }]
				      };
				      myChart.setOption(option);
				}
            });

	    }                                )
	    $("#select1").click(showinfo(result1,result2));
        


	    }
    
 
</script>
</body>
</html>