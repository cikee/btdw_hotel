<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 800px;height:400px;"></div>
<script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../js/echarts.min.js"></script>
<script type="text/javascript">
 
    // 基于准备好的dom，初始化echartjquery-2.1.1.min.jss实例
    var myChart=echarts.init(document.getElementById("main"));
 
    // 指定图表的配置项和数据
 
    myChart.setOption({
        title:{
            text:'echarts入门示例'
        },
        tooltip:{
 
        },
        legend:{
            data:['销量']
        },
        xAxis:{
            data:[]
        },
        yAxis:{
 
        },
        series:[
            {
                name:'销量',
                type:'bar',
                data:[]
            },
        ]
    });
 
 
    $.ajax({
        type : 'get',
        url :'/echarts/queryBarGraphList',
        async: false,
        success : function(data){
            myChart.setOption({
                xAxis:{
                    data:data.hotelName
                },
                series:[
                    {
                        name:'销量',
                        data:data.orderPrice
                    },
                ]
            });
        }
    });
</script>
</body>
</html>