<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="../../A8hotel/css/right.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="../../A8hotel/js/xzcd.js"></script>
		<script language="javascript" src="../../A8hotel/js/sk_ts.js"></script>
		<script language="javascript" src="../../A8hotel/js/Calendar.js"></script>
		<script language="javascript" src="../../A8hotel/js/initajax.js"></script>
		<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
		<style type="text/css">
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
			
		</style>
		
		<script language="javascript" src="../A8hotel/js/initajax.js"></script>
		<script language="javascript" src="../A8hotel/js/show_rzr.js"></script>
		<script language="javascript">
			function check() {
				if(document.form1.alipay_no.value != "") {
					var theObj = document.getElementById("esave");
					theObj.style.visibility = "visible";
				}
				if(document.form1.name.value == "") {
					alert("请正确输入主客姓名!!");
					document.form1.name.focus();
					return false;
				}
				if(document.getElementById("alipay_dmf_value").checked && document.form1.alipay_no.value == "") {
					dmf_pay.style.display = 'block';
					document.getElementById('alipay_no').focus();
					return false;
				}

			}

			function change() {
				var num_sl = form1.ts.value;
				var num_dj = form1.sjdj.value;
				if(num_sl == 0) {
					num_sl = 1;
				}
				var hj_num = parseFloat(num_sl) * parseFloat(num_dj);
				document.form1.ysfk.value = hj_num;
			}

			function gel(a) {
				return document.getElementById ? document.getElementById(a) : null;
			}

			function checkUsername(x) {
				var timerand = Math.ceil(Math.random() * 100000000);
				var ts = form1.ts.value;
				var fjbh = form1.fjbh.value;
				if(ts != "") {
					var url = "RoomStatus/reg_check2.html?fjbh=" + fjbh + "&ts=" + ts + "&time=" + timerand;
					//gel(x).innerHTML = "<font color='#0000ff'>正在检测房间预订系统，请稍候...</font>";
					var ajax = InitAjax();
					ajax.open("GET", url, true);
					ajax.onreadystatechange = function() {　　
						if(ajax.status == 200) {
							gel(x).innerHTML = ajax.responseText;
						}
					}
				}
				ajax.send(null);
				return false;
			}

			function check_user() {
				if(document.user.pass.value == "" && document.user.member.value != "") {
					document.user.pass.focus();
					return false;
				}
			}

			function check_mumber() {
				if(document.user.pass.value == "" && document.user.member.value != "") {
					document.user.pass.focus();
					return false;
				}
			}

			function add_rzr_get() {
				var name_rz2 = document.form1.name_rz2.value;
				var sex_rz2 = document.form1.sex_rz2[0].checked;
				if(sex_rz2 == true) {
					sex_rz2 = "男";
				} else {
					sex_rz2 = "女";
				}
				var zjmc_rz2 = document.form1.zjmc_rz2.value;
				var zjhm_rz2 = document.form1.zjhm_rz2.value;
				var add_rz2 = document.form1.add_rz2.value;
				var fj_fjbh = "02";
				add_rzr(fj_fjbh, name_rz2, sex_rz2, zjmc_rz2, zjhm_rz2, add_rz2);
				downloadPanel.style.display = 'none';
			}

			function add_rzr_get_del(fj_fjbh, m_id) {
				var fj_fjbh = "02";
				var m_id = m_id;
				add_rzr_del(fj_fjbh, m_id);
			}

			function alipay_sf() {
				if(document.getElementById("alipay_dmf_value").checked) {
					document.alipay_img.src = "../A8hotel/alipay_dmf.png";
					ylk_fk_xs.style.display = 'block';
					document.getElementById("alipay_dmf_value").checked = false;
				} else {
					document.alipay_img.src = "../A8hotel/alipay_dmf2.png";
					ylk_fk_xs.style.display = 'none';
					document.getElementById("alipay_dmf_value").checked = true;
				}
			}
		</script>

	</head>

	<body onload="add_rzr_get_del('02',0);document.user.member.focus();">
		<div id="a2">
			<div id="b1">宾客入住办理
				<div id="previewImage" style="position:absolute; width:100px; height:80px; z-index:1; left: 149px; top: 44px; " align="center"></div>
			</div>
			<div id="t1">

				<form action="./fj_kd_post.php" method="post" enctype="multipart/form-data" name="form1" onsubmit="return check()" id="form1">

					<div id="dmf_pay" style="position:absolute;top:30%;left:30%;width:300px;z-index:999;padding:6px 2px 6px 10px;border:1px solid #ff9900;background-color: #FBF7AE;font-size: 16px;display:none;" class="infobar">
						<div align="right"><img src="./images/close.gif" width="13" height="13" border="0" onclick="dmf_pay.style.display='none';return false;" style="cursor: hand;"></div>
						<div align="left">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" id="myTable">
								<tbody>
									<tr>
										<td>客户手机出示付款条码(支付宝或微信-&gt;付款)<br>请使用条码枪扫取客户手机付款条码<br><input name="alipay_no" id="alipay_no" type="text" class="biaod_txt" maxlength="20" style="width:280px" onblur="this.focus();"></td>
									</tr>
								</tbody>
							</table>
							<div id="esave" align="center" style="position:absolute; left:50px; z-index:10; background-color: #FFFF00; layer-background-color: #FFFF00; border: 1px none #000000; visibility:hidden;width:200px"><br> 正在接入支付接口...
								<br></div>

							<hr size="1" noshade="" color="#ff9900">

						</div>
					</div>

					<div id="downloadPanel" style="position:absolute;top:100px;left:350px;width:500px;z-index:999;padding:6px 2px 6px 10px;border:1px solid #ff9900;background-color: #FBF7AE;font-size: 16px;display:none;" class="infobar">
						<div align="right"><img src="./images/close.gif" width="13" height="13" border="0" onclick="downloadPanel.style.display='none'" style="cursor: hand;"></div>
						<div align="left">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" id="myTable">
								<tbody>
									<tr>
										<td>
											<ul>
												<li class="li_rzr_z">姓名：</li>
												<li class="li_rzr_y"><input name="name_rz2" id="name_rz2" type="text" class="biaod_txt" maxlength="20" style="width:150px"> <input type="button" value="读身份证" onclick="ReadSAMID_onclick_rz2()" class="btn_out"></li>
											</ul>
											<ul>
												<li class="li_rzr_z">性别：</li>
												<li class="li_rzr_y"><label><input type="radio" value="男" name="sex_rz2" checked="">男</label>&nbsp;<label><input type="radio" value="女" name="sex_rz2">女</label></li>
											</ul>
											<ul>
												<li class="li_rzr_z">证件类型：</li>
												<li class="li_rzr_y">
													<select name="zjmc_rz2" size="1" id="zjmc_rz2">
														<option value="身份证" selected="">身份证</option>
														<option value="学生证">学生证</option>
														<option value="驾驶证">驾驶证</option>
														<option value="军官证">军官证</option>
														<option value="其他证件">其他证件</option>
													</select>
												</li>
											</ul>
											<ul>
												<li class="li_rzr_z">证件号码：</li>
												<li class="li_rzr_y"><input name="zjhm_rz2" type="text" class="biaod_txt" id="zjhm_rz2" style="width:200px"></li>
											</ul>
											<ul>
												<li class="li_rzr_z">住址：</li>
												<li class="li_rzr_y"><input name="add_rz2" type="text" class="biaod_txt" id="add_rz2" style="width:300px"></li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
							<hr size="1" noshade="" color="#ff9900">
							<div align="center"><img src="../A8hotel/an2.gif" width="69" height="22" border="0" onclick="add_rzr_get()" style="cursor: hand; ">
							</div>
						</div>
					</div>
					<table width="90%" height="45" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#DADADA">
						<tbody>
							<tr>
								<td bgcolor="#DADADA" width="100%" align="center">
									房间号：<span class="bg_bt">${ r.roomNumber }</span>
									<input name="fjbh" type="hidden" id="fjbh" value="${ r.roomNumber }"> &nbsp;&nbsp; &nbsp;&nbsp;房间类型：<span class="bg_bt">${ r.roomName }</span> &nbsp;&nbsp;&nbsp;&nbsp;单价：<span class="bg_bt" style="color:#ff0000;font-size: 20px;">￥${ r.roomPrice }</span> 元
									<font color="#0000ff"></font>
								</td>
							</tr>
						</tbody>
					</table>
					<script type="text/javascript">
						document.write("<audio autoplay='autoplay'><source src='http://tsn.baidu.com/text2audio?tex=%E6%AC%A2%E8%BF%8E%E5%85%A5%E4%BD%8F%E7%A2%A7%E6%B6%9B%E8%BE%BE%E7%BB%B4%E5%A4%A7%E9%85%92%E5%BA%97+%2C%E8%AF%B7%E5%87%BA%E7%A4%BA%E6%82%A8%E7%9A%84%E8%BA%AB%E4%BB%BD%E8%AF%81%E4%BB%B6&lan=zh&tok=24.0f25afade8d7ad89ece83c4590153356.2592000.1574483357.282335-16896945&ctp=1&cuid=A0:8C:FD:C7:64:5D&spd=4&pit=5&vol=5&per=4'> </audio>");
					</script>
					<!-- <audio autoplay="autoplay">
						<source src="http://fanyi.baidu.com/gettts?lan=zh&amp;ie=GB2312&amp;spd=6&amp;text=%E6%AC%A2%E8%BF%8E%E5%85%A5%E4%BD%8F%E5%90%9B%E6%9D%A5%E5%A4%A7%E9%85%92%E5%BA%97+%2C%E8%AF%B7%E5%87%BA%E7%A4%BA%E6%82%A8%E7%9A%84%E8%BA%AB%E4%BB%BD%E8%AF%81%E4%BB%B6" type="audio/mpeg"><embed height="0" width="0" src="http://fanyi.baidu.com/gettts?lan=zh&amp;ie=GB2312&amp;spd=6&amp;text=%E6%AC%A2%E8%BF%8E%E5%85%A5%E4%BD%8F%E5%90%9B%E6%9D%A5%E5%A4%A7%E9%85%92%E5%BA%97+%2C%E8%AF%B7%E5%87%BA%E7%A4%BA%E6%82%A8%E7%9A%84%E8%BA%AB%E4%BB%BD%E8%AF%81%E4%BB%B6"> </audio> -->
					<table width="90%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#DADADA">
						<tbody>
							<tr>
								<td colspan="6" bgcolor="#E6E6E6">
									<div id="nameajax" style="background-color: #FFFFCC;border: 1px solid #66CCCC;color:#ff0000;font-weight: bold;">
										<font id="cnm" color="#1E5807">√ 房间检测正常，您可以开单!</font><input type="hidden" name="ok" value="1"></div>
								</td>
							</tr>
							<tr>
								<td bgcolor="#EAEAEA">
									<div align="right">预住天数：</div>
								</td>
								<td bgcolor="#FFFFFF">
									<input name="ts" type="text" class="biaod_txt" id="ts" style="width:50px" value="1" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onkeyup="change()" onblur="checkUsername('nameajax');"></td>
								<td bgcolor="#EAEAEA">
									<div align="right">实际单价：</div>
								</td>
								<td bgcolor="#FFFFFF">
									<input name="sjdj" type="text" class="hs_bd" id="sjdj" style="width:70px;color: #0000ff;" value="${ r.roomPrice }" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" onkeyup="change()" title="可关闭更改房价权限"> 元

									<input name="sjdjb" type="hidden" id="sjdjb" value=" ${ r.roomPrice } ">
									<input name="spyh" type="hidden" id="spyh" value=""></td>
								<td bgcolor="#EAEAEA">
									<div align="right">营销人员：</div>
								</td>
								<td bgcolor="#FFFFFF">
									<select name="tcywy" id="select">
										<option value="0" selected="">===选 择===</option>
										<option value="88888">爸爸兰zx</option>
										<option value="0001">儿子陈Q</option>
									</select>
									<input name="ywy" type="hidden" id="ywy" value=""></td>
							</tr>
							<tr>
								<td bgcolor="#EAEAEA">
									<div align="right">宾客人数：</div>
								</td>
								<td bgcolor="#FFFFFF"><input name="rs" type="text" class="biaod_txt" id="rs" style="width:50px" value="" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"></td>
								<td bgcolor="#EAEAEA">
									<div align="right">实收押金：</div>
								</td>
								<td bgcolor="#FFFFFF"><input name="yj" type="text" class="hs_bd" id="yj" style="width:70px" value="${ r.roomDeposit }" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" maxlength="5"> 元
									<select name="ylk_yj" id="ylk_yj">
										<option value="0">现金</option>
										<option value="3">银行卡</option>
										<option value="4">微信</option>
										<option value="5">去哪儿</option>
										<option value="6">携程</option>
										<option value="7">美团</option>
										<option value="8">飞猪预授权</option>
										<option value="9">支付宝</option>
									</select>
									<input name="yf_yj" type="hidden" id="yf_yj" value="${ r.roomDeposit }">
									<input name="sf_yd" type="hidden" id="sf_yd" value=""></td>
								<td bgcolor="#EAEAEA">
									<div align="right">预收房款：</div>
								</td>
								<td bgcolor="#FFFFFF" width="250px;">
									<div style="width:250px;">
										<div style="float: left;"><input name="ysfk" type="text" class="hs_bd" id="ysfk" style="width:70px" onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" value="${ r.roomPrice+r.roomDeposit }" maxlength="6"> 元 </div>
										<div id="ylk_fk_xs" style="float: left;margin-top: 10px;margin-left: 10px;">
											<select name="ylk_fk" id="ylk_fk">
												<option value="0">现金</option>
												<option value="3">银行卡</option>
												<option value="4">微信</option>
												<option value="5">去哪儿</option>
												<option value="6">携程</option>
												<option value="7">美团</option>
												<option value="8">飞猪预授权</option>
												<option value="9">支付宝</option>
											</select>
										</div>
									</div>
									<input style="display:none" name="alipay_dmf_value" type="checkbox" id="alipay_dmf_value" value="1" class="clsCheckBox">
									<img src="../A8hotel/alipay_dmf.png" align="middle" onclick="alipay_sf()" name="alipay_img" style="cursor:hand;">
								</td>
							</tr>
						</tbody>
					</table>
					<table width="90%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#DADADA">
						<tbody>
							<tr>
								<td height="35" colspan="4" bgcolor="#ffffff">
									<div align="center"><strong>宾客信息</strong> </div>
								</td>
							</tr>

							<tr bgcolor="#FFFFFF">
								<td bgcolor="#EAEAEA">
									<div align="right">宾客类型：</div>
								</td>
								<td>普通客户
									<input name="member" type="hidden" id="member" value=""></td>
								<td bgcolor="#EAEAEA">
									<div align="right">主客姓名：</div>
								</td>
								<td bgcolor="#FFFFFF"><input name="name" type="text" class="biaod_txt" id="name" style="width:150px" value="">
									<font color="#ff0000"> *</font> <input type="button" value="读身份证" onclick="ReadSAMID_onclick()" class="btn_out"></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td bgcolor="#EAEAEA">
									<div align="right">证件类型：</div>
								</td>
								<td>
									<select name="zjmc" size="1" id="zjmc">
										<option value="身份证" selected="">身份证</option>
										<option value="学生证">学生证</option>
										<option value="驾驶证">驾驶证</option>
										<option value="军官证">军官证</option>
										<option value="其他证件">其他证件</option>
									</select>
								</td>
								<td bgcolor="#EAEAEA">
									<div align="right">证件号码：</div>
								</td>
								<td bgcolor="#FFFFFF"><input name="zjhm" type="text" class="biaod_txt" id="zjhm" style="width:200px" value=""></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td bgcolor="#EAEAEA">
									<div align="right">主客性别：</div>
								</td>
								<td><label><input type="radio" value="男" name="sex" checked="">男</label>&nbsp;<label><input type="radio" value="女" name="sex">女</label></td>
								<td bgcolor="#EAEAEA">
									<div align="right">联系手机：</div>
								</td>
								<td bgcolor="#FFFFFF"><input name="tel" type="text" class="biaod_txt" id="tel" style="width:150px" value=""></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td bgcolor="#EAEAEA">
									<div align="right">单位名称：</div>
								</td>
								<td bgcolor="#FFFFFF"><input name="gsname" type="text" class="biaod_txt" id="gsname" style="width:150px" value=""></td>
								<td bgcolor="#EAEAEA">
									<div align="right">联系地址：</div>
								</td>
								<td bgcolor="#FFFFFF">
									<div align="left">
										<input name="add" type="text" class="biaod_txt" id="add" style="width:330px" value="">
									</div>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td bgcolor="#EAEAEA">
									<div align="right">备注信息：</div>
								</td>
								<td colspan="3" bgcolor="#FFFFFF">
									<div align="left">
										<input name="text" type="text" class="biaod_txt" id="text" style="width:500px" value="">
									</div>
								</td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td colspan="4">
									<div id="addtjr_ok"></div>
									<img src="../A8hotel/fjkd_rzr.jpg" onclick="downloadPanel.style.display='block';document.getElementById('name_rz2').focus();" style="cursor: hand;">
								</td>
							</tr>
							<!--
	      <tr bgcolor="#FFFFFF">
	        <td bgcolor="#EAEAEA"><div align="right">上传证件照片：</div></td>
	        <td colspan="3" bgcolor="#FFFFFF"><input name="photo" type="file" id="photo" onChange="document.getElementById('previewImage').innerHTML = '<img src=\''+this.value+'\' width=100 height=80  onload=\'ResizeImage(this, 100, 80);\' align=absmiddle>';" size="35"></td>
          </tr>
		  -->
						</tbody>
					</table>

					<table width="90%" border="0" align="center" cellspacing="0" bgcolor="#DADADA">
						<tbody>
							<tr bgcolor="#FFFFFF">
								<td>
									<div align="center">
										<input name="Submit" id="Submit" type="image" src="../A8hotel/kf_an.gif" width="162" height="59" border="0">
										<a href="Status.html"><img src="../A8hotel/fh.gif" border="0">返回</a>
										<input name="post_2" type="hidden" id="post_2" value="2">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<script language="javascript">
					form1.ts.focus();
				</script>
			</div>
		</div>
		
		<script language="javascript">
		
		$(function(){
			var timerand = Math.ceil(Math.random() * 100000000);
			var ts = form1.ts.value;
			var fjbh = form1.fjbh.value;
			var url = "reg_check2.html?fjbh=" + fjbh + "&ts=" + ts + "&time=" + timerand;
			$("#cnm").load(url);
			
			});
		
		</script>
		<script language="javascript">
			function ReadSAMID_onclick() {
				alert("无法识别您的身份证阅读器,请联系客服");
			}
		</script>

		<script language="javascript">
			window.onload = pass;

			function pass() {
				checkUsername('nameajax');
			}
		</script>

	</body>

</html>