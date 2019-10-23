<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="./css/right.css" rel="stylesheet" type="text/css">
<SCRIPT language="javascript" src="./js/xzcd.js"></SCRIPT>
<script language="javascript" src="./js/sk_ts.js"></script>
<script language="javascript" src="./js/Calendar.js"></script>
<script language="javascript" src="./js/initajax.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #FF0000
}

.li_rzr_z {
	line-height: 20px;
	list-style-type: none;
	float: left;
	width: 80px;
	text-align: right;
}

.li_rzr_y {
	line-height: 20px;
	list-style-type: none;
}

ul {
	height: 25px;
}

#xs_rz2 {
	width: 160px;
	height: 65px;
	color: #000000;
	background-color: #CDFCF0;
	border: 1px solid #9EEDD9;
	float: left;
	margin-right: 10px;
	padding: 5px;
}

#addtjr_ok {
	float: left;
}

.bg_bt {
	font-size: 20px;
	color: #0000FF;
	text-decoration: none;
	font-weight: bold;
}

.bg_bt_new {
	font-size: 19px;
	color: #0000FF;
	text-decoration: none;
	font-weight: bold;
}

.clsCheckBox {
	display: none;
}
-->
</style>
<script language="javascript" src="./js/initajax.js"></script>
<script language="javascript" src="./js/show_rzr.js"></script>
<script language="javascript">
function check(){
	if (document.form1.alipay_no.value != "" ){
	var theObj = document.getElementById("esave");
	theObj.style.visibility="visible";
	}
if (document.form1.name.value == ""){
	alert("请正确输入主客姓名!!");
	document.form1.name.focus();
	return false;
	}
if (document.getElementById("alipay_dmf_value").checked && document.form1.alipay_no.value == "" ){
	dmf_pay.style.display='block';
	document.getElementById('alipay_no').focus();
	return false;
	}

}
function change()
{	
var num_sl = form1.ts.value;
var num_dj = form1.sjdj.value;
if (num_sl==0)
{
	num_sl=1;
}
var hj_num = parseFloat(num_sl)*parseFloat(num_dj);
document.form1.ysfk.value = hj_num;
}
function gel(a){
	return document.getElementById?document.getElementById(a):null;
}
function checkUsername(x){
var timerand = Math.ceil(Math.random()*100000000);
var ts = form1.ts.value;
var fjbh = form1.fjbh.value;
	if (ts != "")
	{
		var url = "./reg_check2.php?fjbh="+fjbh+"&ts="+ts+"&time="+timerand;
		gel(x).innerHTML = "<font color='#0000ff'>正在检测房间预订系统，请稍候...</font>";
		var ajax = InitAjax();
		ajax.open("GET", url, true);
		ajax.onreadystatechange = function() { 
	　　	if (ajax.readyState == 4 && ajax.status == 200) {
				gel(x).innerHTML = ajax.responseText;
			}
		}
	}
ajax.send(null); 
return false;
}
function check_user(){
if (document.user.pass.value == "" && document.user.member.value != ""){
	document.user.pass.focus();
	return false;
	}
}
function check_mumber(){
if (document.user.pass.value == "" && document.user.member.value != ""){
	document.user.pass.focus();
	return false;
	}
}
function add_rzr_get(){
var name_rz2 = document.form1.name_rz2.value;
var sex_rz2 = document.form1.sex_rz2[0].checked;
if (sex_rz2 == true)
{
sex_rz2 = "男";
}else{
sex_rz2 = "女";
}
var zjmc_rz2 = document.form1.zjmc_rz2.value;
var zjhm_rz2 = document.form1.zjhm_rz2.value;
var add_rz2 = document.form1.add_rz2.value;
var fj_fjbh ="02";
add_rzr(fj_fjbh,name_rz2,sex_rz2,zjmc_rz2,zjhm_rz2,add_rz2);
downloadPanel.style.display='none';
}

function add_rzr_get_del(fj_fjbh,m_id){
var fj_fjbh ="02";
var m_id = m_id;
add_rzr_del(fj_fjbh,m_id);
}

function alipay_sf(){
	if (document.getElementById("alipay_dmf_value").checked)
   {
    document.alipay_img.src = "./images/alipay_dmf.png";
	ylk_fk_xs.style.display='block';
   document.getElementById("alipay_dmf_value").checked=false;
   }else{
   document.alipay_img.src = "./images/alipay_dmf2.png";
   ylk_fk_xs.style.display='none';
   document.getElementById("alipay_dmf_value").checked=true;
   }
}
</script>

</head>

<body onLoad="add_rzr_get_del('02',0);document.user.member.focus();">
	<div id="a2">
		<div id="b1">
			宾客入住办理
			<div id="previewImage"
				style="position: absolute; width: 100px; height: 80px; z-index: 1; left: 149px; top: 44px;"
				align="center"></div>
		</div>
		<div id="t1">
			<form action="./fj_kd.php" method="post" name="user"
				onSubmit="return check_mumber()" autocomplete="off">
				<table width="90%" border="0" align="center" cellpadding="5"
					cellspacing="1" bgcolor="#DADADA">
					<tr>
						<td height="35" bgcolor="#ffffff"><div align="center">
								<strong>选择客户类型</strong>
							</div></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="60">
						<td bgcolor="#EAEAEA"><div align="center">
								房间号：<span class="bg_bt">${ r.roomNumber }</span><a href="fj_zt.php?kzf=02"><font
									color="#197d6e"> =>置脏房</font></a> &nbsp;&nbsp; 房间类型：<span
									class="bg_bt">${ r.roomName }</span> &nbsp;&nbsp;单价：<span class="bg_bt"
									style="color: #ff0000; font-size: 28px;">￥${ r.roomPrice }</span> 元 <font
									color="#0000ff"></font>
							</div></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td bgcolor="#EAEAEA"><div align="center">
								<br />
								<span style="font-size: 17px; cursor: hand;"><input
									name='zdw_xz' type='checkbox' id='zdw_xz' value='1'> <label
									for='zdw_xz'>是否开钟点房？单价：<b>￥ 60 元/3 小时</b> (超时:40 元/小时)
								</label></span><br />
								<br /> <span class="style1">VIP客户请先刷卡或输入</span><font
									color="#0000ff">会员卡号或手机号：</font> <input name="member"
									type="text" class="biaod_txt" id="member" value=""
									autocomplete="off" style="width: 180px;"> <br> <br>
								提示: 非会员客户请直接点击下一步办理; <br> <br>
							</div></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td bgcolor="#ffffff" height="70"><div align="center">
								<input type="submit" name="Submit" value=" 下一步 "
									onMouseOver="this.className='btn_over'"
									onMouseOut="this.className='btn_out'" class="btn_out"
									style="padding-left: 30px; padding-right: 30px; font-size: 17px; height: 40px;">
								<input name="go1" type="hidden" id="go1" value="2"> <input
									name="tid" type="hidden" id="tid" value="128"> <input
									name="fj_fjlx" type="hidden" id="fj_fjlx" value="${ r.roomName }">
							</div></td>
					</tr>
				</table>
			</form>

		</div>
	</div>
</body>
</html>
