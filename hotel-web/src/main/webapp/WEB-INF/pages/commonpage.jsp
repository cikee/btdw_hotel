<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<ul class="compage" style="display:inline;">
    <li style=" display: inline-block;"><a class="first"><button>首页</button></a></li>
	<li style=" display: inline-block;"><a class="pre"><button>上一页</button></a></li>
	<li style=" display: inline-block;"><a class="next"><button>下一页</button></a></li>
	<li style=" display: inline-block;"><a class="last"><button>尾页</button></a></li>
	<li style=" display: inline-block;"><a class="rowCount">总记录数(0)</a></li>
	<li style=" display: inline-block;"><a class="pageCount">总页数(0)</a></li>
	<li style=" display: inline-block;"><a class="pageCurrent">当前页(1)</a></li>
</ul>
<script type="text/javascript">
    $(function(){
       
    	//在pageId对应的对象上注册事件
    	//当点击pageId对象内部的子元素firt,pre等时
    	//执行指定doJumpToPage方法
    	$("#pageId")
    	.on("click",".first,.pre,.next,.last",doJumpToPage)
    });
    //初始化页面分页信息
    function doSetPagination(pageObject){
    	//console.log("pageObject",pageObject)
    	//$(".xxx")基于css中的类选择器获取html中的对象
    	//html()函数用于向指定对象内部添加内容
    	$(".rowCount").html("总记录数("+pageObject.rowCount+")");
    	$(".pageCount").html("总页数("+pageObject.pageCount+")");
    	$(".pageCurrent").html("当前页("+pageObject.pageCurrent+")");
    	//存储pageCurrent,pageCount值,借助data函数实现
    	//data函数为jquery的一个数据绑定函数
    	//两个参数是绑定,一个参数是去值
    	$("#pageId").data("pageCurrent",pageObject.pageCurrent);
    	$("#pageId").data("pageCount",pageObject.pageCount);
    }
    //基于点击事件修改当前页码值,然后重新执行查询
    function doJumpToPage(){
    	//debugger
    	//1.获取点击对象
    	var cls=$(this).prop("class");//property
    	console.log(cls)
    	//2.基于点击对象修改当前页码值
    	//2.1获取当前页码值及总页数
    	var pageCurrent=$("#pageId").data("pageCurrent");
    	var pageCount=$("#pageId").data("pageCount");
    	//2.2修改当前页码值
    	if(cls=="first"&&pageCurrent!=1){
    		pageCurrent=1;
    	}else if(cls=="pre"&&pageCurrent>1){
    		pageCurrent--;
    	}else if(cls=="next"&&pageCurrent<pageCount){
    		pageCurrent++;
    	}else if(cls=="last"&&pageCurrent!=pageCount){
    		pageCurrent=pageCount;
    	}else{
    		return;
    	}
    	//2.3基于新的页码值,重新执行查询.
    	//2.3.1存储新的页码值
    	$("#pageId").data("pageCurrent",pageCurrent);
    	console.log(pageCurrent)
    	//2.3.2重新执行查询
    	doGetObjects();
    }
 
</script>
</html>
