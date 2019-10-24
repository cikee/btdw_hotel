<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../../A8hotel/css/right.css" rel="stylesheet"
	type="text/css">
<script language="javascript" src="../../A8hotel/js/initajax.js"></script>
<script language="javascript" src="../../A8hotel/js/show_rzr.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #0000FF;
	font-size: 20px;
	font-weight: bold;
}

.bk_css {
	padding-right: 5px;
	padding-left: 5px;
	font-size: 15px;
	background-color: #04a0a1;
	height: 28px;
	cursor: hand;
	color: #ffffff;
	font-weight: normal;
	border: 1px solid #006261;
}

.bk_css2 {
	padding-right: 5px;
	padding-left: 5px;
	font-size: 15px;
	background-color: #06bcbd;
	height: 28px;
	cursor: hand;
	color: #ffffff;
	font-weight: normal;
	border: 1px solid #006261;
}

#xs_rz2 {
	height: 30px;
	background-color: #CDFCF0;
	border: 1px solid #9EEDD9;
	float: left;
	margin-right: 10px;
	padding: 5px;
	color: #000000;
	text-align: left;
}

#addtjr_ok {
	float: left;
}

.bg_bt_new {
	font-size: 19px;
	color: #0000FF;
	text-decoration: none;
	font-weight: bold;
}
-->
</style>
<script language="javascript">
function add_rzr_get_del(fj_fjbh,m_id,del_zt){
var fj_fjbh =03;
var m_id = m_id;
add_rzr_del(fj_fjbh,m_id,"okdel");
}
function add_rzr_get(){
var fj_fjbh =03;
add_rzr_del(fj_fjbh,"ok");
}
function change_jfdx(){
var num_jf = parseFloat(form1.jf_dx_sl.value);
document.all.money.innerHTML = num_jf;
	if (num_jf >=0)
	{
	var num_bl = parseFloat(form1.dxbl.value);
	var num_csjf = parseFloat(form1.dqcsjf.value);
	var hj_num = parseFloat(num_jf)/parseFloat(num_bl);
	var hj_num2 = parseInt(hj_num);   
		if (num_jf > num_csjf)
		{
		alert ("可用积分不足,请重新输入");
		document.all.money.innerHTML = "0";
		document.form1.jf_dx_sl.value = "";
		}else{
		document.all.money.innerHTML = hj_num2;
		}
	}
}
function CheckAll()
{	
	var tocheck = document.form1.gz.checked;
	eval("document.form1.gz_yj.checked = tocheck;");
	if (tocheck==true)
	{
	document.form1.gz_yj.disabled='';
	document.form1.tk_bjs.disabled='disabled';
	document.form1.tk_bjs.checked='';	
	document.form1.xjzf.style.background='#ececec';	
	document.form1.xjzf.value='';
	document.form1.xjzf.disabled='disabled';	
	//document.form1.ylk.disabled='disabled';	
	document.form1.tfzz.style.background='#ececec';	
	document.form1.tfzz.value='';
	document.form1.tfzz.disabled='disabled';
	}else{
	document.form1.gz_yj.disabled='disabled';
	if ("" != "disabled")
	{
		document.form1.tk_bjs.disabled='';
	}	
	document.form1.xjzf.style.background='#ffffff';
	document.form1.xjzf.disabled='';	
	//document.form1.ylk.disabled='';	
	document.form1.tfzz.style.background='#ffffff';
	document.form1.tfzz.disabled='';
	}	
}
function CheckAllb()
{	
	var tk_bjs = document.form1.tk_bjs.checked;
	if (tk_bjs==true)
	{
	document.form1.tfzz.style.background='#ececec';	
	document.form1.tfzz.value='';
	document.form1.tfzz.disabled='disabled';	
	}else{
	document.form1.tfzz.style.background='#ffffff';
	document.form1.tfzz.disabled='';
	}	
}
function Check_zf()
{	
	var tk_zf = document.form1.tfzz.value;
	if (tk_zf!="")
	{
	document.form1.xjzf.style.background='#ececec';	
	document.form1.xjzf.value='';
	document.form1.xjzf.disabled='disabled';	
	}else{
	document.form1.xjzf.style.background='#ffffff';
	document.form1.xjzf.disabled='';
	}	
}
function local(){ 
var i=window.confirm("确定要将该房进行拆单独立结算？"); 
	if(i!=0){
	window.location="./fj_df.php?cdfj_bh=03&&tid=129";
	}
}
</script>
</head>
<body onLoad="add_rzr_get();document.form1.xjzf.focus();">

	<div id="downloadPanel"
		style="position: absolute; top: 200px; left: 30%; width: 400px; height: 70px; z-index: 999; padding: 6px 2px 6px 10px; border: 1px solid #ff9900; background-color: #FBF7AE; font-size: 16px; display: none;"
		class="infobar">
		<div align="right">
			<img src="./images/close.gif" width="13" height="13" border="0"
				onclick="downloadPanel.style.display='none'" style="cursor: hand;">
		</div>
		<div align="left">
			<form action="./fj_df.php" method="post"
				enctype="multipart/form-data" name="form_dzq"
				onSubmit="return check()" id="form_dzq">
				电子优惠券号：<input name="dzj_jh" type="text" class="biaod_txt"
					id="dzj_jh"
					onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
					value=""
					style="font-size: 22px; font-weight: bold; height: 35px; width: 140px;color=#0000ff"
					maxlength="9" onblur="this.focus();"> <input type="Submit"
					name="dzj_qr" id="dzj_qr" value="确认" class="btn_out"> <input
					name="tid" type="hidden" id="tid" value="128"> <input
					name="fj_je_nz" type="hidden" id="fj_je_nz" value="399">
			</form>
		</div>
	</div>


	<div id="a2">
		<div id="b1">收银结账</div>
		<div id="t1">
			<form action="./fj_df_post.php" method="post"
				enctype="multipart/form-data" name="form1" onSubmit="return check()"
				id="form1">
				<table width="90%" border="0" align="center" cellpadding="0"
					cellspacing="0" bgcolor="#DADADA">
					<tr height="60">
						<td bgcolor="#DADADA" width="100%" align="center"
							class="bg_bt_new" title="">
							<div id="addtjr_ok"></div> <font color="#000000">结账房间：</font>02 <span
							style='font-size: 14px; color: #000000;'>豪华单人房</span>&nbsp;&nbsp;&nbsp;&nbsp;<font
							color="#000000">主客姓名：</font><span style='color: #ed4997'>魏巍
						</span> <a href="tjbb_lbxx_xd2.php?go_id=2860" class="font_cz"
							title="修改宾客信息"><img src="../../A8hotel//xg.gif" width="22"
								height="24" border="0" alt="修改宾客信息"></a>&nbsp;&nbsp;&nbsp;&nbsp;<font
							color="#000000">入住：</font>10月23日 11:15 &nbsp;&nbsp;&nbsp;&nbsp;<font
							color="#000000">预离：</font>10月24日 13:00 <input name="p_fjbh"
							type="hidden" id="p_fjbh" value="02"> <input name="p_ddh"
							type="hidden" id="p_ddh" value="191023155120128"> <input
							name="p_ysxj" type="hidden" id="p_ysxj" value="399"> <input
							name="p_tid" type="hidden" id="p_tid" value="128"><br />
						</td>
					</tr>
					<tr>
						<td><div
								style='background-color: #FFFF99; text-align: center; padding: 15px;'>
								请输入转付或关联的<b>房间号</b>: <input name='tfzz' type='text' id='tfzz'
									class='biaod_txt' style='width: 100px;' onBlur=Check_zf()><font
									color='#ff0000'> (不使用该功能请留空)</font> <input type='button'
									onclick="javascript:location.href='fj_df.php?tid=128&&y_fjbh=02&&fj_zf='+document.getElementById('tfzz').value "
									value='关联结算(不退房)' class='bk_css' title='不退房,将该房合并结算'
									onMouseOver="this.className='bk_css2'"
									onMouseOut="this.className='bk_css'" />
							</div></td>
					</tr>
				</table>
				<table width="90%" border="0" align="center" cellpadding="3"
					cellspacing="1" bgcolor="#DADADA">


					<tr>
						<td bgcolor="#DBFCB4"><div align="right">
								<strong>消费总额：</strong>
							</div></td>
						<td colspan="5" bgcolor="#DBFCB4" class="bg_bt"><font
							color="#ff0000">399 元 <input name="all_xf" type="hidden"
								id="all_xf" value="399"> <input name="z_je_md5"
								type="hidden" id="z_je_md5"
								value="f0f1992ad226dfcb0872dcf00de64e1b"> <input
								name="jf_sphj_je" type="hidden" id="jf_sphj_je" value="399">
						</font><font color="#000000"></font> <a href="./fj_xf_jf.php?okdl=02"><img
								src="../../A8hotel/an_zjxf2.png" border=0 alt="续住" /></a> <img
							src="../../A8hotel/an_zjxf_dzq.png" border=0 alt="使用优惠券"
							onclick="downloadPanel.style.display='block';document.getElementById('dzj_jh').focus();"
							style="cursor: hand;" /></td>
					</tr>
					<td bgcolor="#EAEAEA"><div align="right">已收房款：</div></td>
					<td bgcolor="#FFFFFF" class="bg_bt">0 元</td>
					<td bgcolor="#EAEAEA"><div align="right">已收押金：</div></td>
					<td bgcolor="#FFFFFF" class="bg_bt"><span class="bg_bt">0
							元</span></td>
					<td bgcolor="#EAEAEA"><div align="right">优惠金额：</div></td>
					<td bgcolor="#FFFFFF">0 元</td>
					</tr>
					<tr>
						<td bgcolor="#EAEAEA"><div align="right">
								<strong><font color="#ff0000">应收金额：</font></strong>
							</div></td>
						<td bgcolor="#FFFFFF" class="bg_bt"><span class="bg_bt"><font
								color="#ff0000">399</font></span><input name='ysje_all' type='hidden'
							id='ysje_all' value='399'></td>

						<td bgcolor="#EAEAEA" align="right"><font color="#ff0000">实收金额：</font></td>
						<td bgcolor="#FFFFFF"><input name="xjzf" type="text"
							class="biaod_txt" id="xjzf"
							onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
							value=""
							style="font-size: 27px; font-weight: bold; color: #000000; height: 40px; width: 100px"
							maxlength="8"> 元 <select name="ylk" id="ylk"><option
									value='0'>现金</option>
								<option value='3'>银行卡</option>
								<option value='4'>微信</option>
								<option value='5'>去哪儿</option>
								<option value='6'>携程</option>
								<option value='7'>美团</option>
								<option value='8'>飞猪预授权</option>
								<option value='9'>支付宝</option></select></span></td>
						<td bgcolor="#ffffff" colspan="2"></td>

					</tr>

					<tr>
						<td bgcolor="#EAEAEA"><div align="right">结账备注：</div></td>
						<td colspan="5" bgcolor="#FFFFFF" align="left"><input
							name="jzbz" type="text" id="jzbz" class="biaod_txt"
							style="width: 425px;"></td>
					</tr>
				</table>
				<table width="90%" border="0" align="center" cellpadding="5"
					cellspacing="1" bgcolor="#DADADA">
					<tr>
						<td height="35" colspan="10" bgcolor="#F2DEDE"><div
								align="center">
								<strong><font color="#A94442">消费清单</font></strong>
							</div></td>
					</tr>
					<tr bgcolor="#EAEAEA">
						<td><div align="center">消费项目</div></td>
						<td><div align="center">单价优惠</div></td>
						<td><div align="center">折后单价</div></td>
						<td><div align="center">数量</div></td>
						<td><div align="center">合计</div></td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td align="center">02 房间费 <font color='#999999'>管理员</font><input
							name="all_zffj" type="hidden" id="all_zffj" value="02 转付房间费"></td>

						<td align="center">0 元<span class="bg_bt"><font
								color="#ff0000"> <input name="all_yh" type="hidden"
									id="all_yh" value="0">
							</font></span></td>
						<td align="center">399 元<span class="bg_bt"><font
								color="#ff0000"> <input name="all_dj" type="hidden"
									id="all_dj" value="399">
							</font></span></td>
						<td align="center">1天<span class="bg_bt"><font
								color="#ff0000"> <input name="all_sl" type="hidden"
									id="all_sl" value="1"> <font color="#ff0000"> <input
										name="all_sl2" type="hidden" id="all_sl2" value="1天">
								</font>
							</font></span></td>
						<td align="center">399 元<span class="bg_bt"><font
								color="#ff0000"><font color="#ff0000"> <input
										name="all_hjje" type="hidden" id="all_hjje" value="399">
								</font></font></span></td>
					</tr>



				</table>
				<table width="90%" border="0" align="center" cellpadding="5"
					cellspacing="1" bgcolor="#DADADA">

					<tr bgcolor="#FFFFFF">
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								align="center">
								<tr>
									<td width="33%" align="left"><a href="Status.html"><img
											src="../../A8hotel/fh.gif" border="0">返回</a>
										&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td width="34%" align="center"><input name="all_sl"
										type="hidden" id="all_sl" value="1"> <input
										name='Submit' type='image' src='../../A8hotel/jz_an.gif'
										border='0' onclick='javascript:return confirm(" 确认要退房结账？");'></td>
									<td width="33%" align="right"></td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
