<%@ page contentType="text/html;charset=gb2312"%>
<%@ page
	import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.lang.*"%>
<%
	long timePageStart = System.currentTimeMillis();
%>
<%
	class EnvServlet {
		public long timeUse = 0;
		public Hashtable htParam = new Hashtable();
		private Hashtable htShowMsg = new Hashtable();
		public void setHashtable() {
			Properties me = System.getProperties();
			Enumeration em = me.propertyNames();
			while (em.hasMoreElements()) {
				String strKey = (String) em.nextElement();
				String strValue = me.getProperty(strKey);
				htParam.put(strKey, strValue);
			}
		}
		public void getHashtable(String strQuery) {
			Enumeration em = htParam.keys();
			while (em.hasMoreElements()) {
				String strKey = (String) em.nextElement();
				String strValue = new String();
				if (strKey.indexOf(strQuery, 0) >= 0) {
					strValue = (String) htParam.get(strKey);
					htShowMsg.put(strKey, strValue);
				}
			}
		}
		public String queryHashtable(String strKey) {
			strKey = (String) htParam.get(strKey);
			return strKey;
		}
		public long test_int() {
			long timeStart = System.currentTimeMillis();
			int i = 0;
			while (i < 3000000)
				i++;
			long timeEnd = System.currentTimeMillis();
			long timeUse = timeEnd - timeStart;
			return timeUse;
		}
		public long test_sqrt() {
			long timeStart = System.currentTimeMillis();
			int i = 0;
			double db = (double) new Random().nextInt(1000);
			while (i < 200000) {
				db = Math.sqrt(db);
				i++;
			}
			long timeEnd = System.currentTimeMillis();
			long timeUse = timeEnd - timeStart;
			return timeUse;
		}
	}
%>
<%
	EnvServlet env = new EnvServlet();
	env.setHashtable();
	String action = new String(" ");
	String act = new String("action");
	if (request.getQueryString() != null && request.getQueryString().indexOf(act, 0) >= 0)
		action = request.getParameter(act);
%>
<html>
<head>
<title>JSP ̽��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>
A {
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #f58200
}

body, td, span {
	font-size: 9pt
}

.input {
	BACKGROUND-COLOR: #ffffff;
	BORDER: #f58200 1px solid;
	FONT-SIZE: 9pt
}

.backc {
	BACKGROUND-COLOR: #f58200;
	BORDER: #f58200 1px solid;
	FONT-SIZE: 9pt;
	color: white
}

.PicBar {
	background-color: #f58200;
	border: 1px solid #000000;
	height: 12px;
}

.tableBorder {
	BORDER-RIGHT: #183789 1px solid;
	BORDER-TOP: #183789 1px solid;
	BORDER-LEFT: #183789 1px solid;
	BORDER-BOTTOM: #183789 1px solid;
	BACKGROUND-COLOR: #ffffff;
	WIDTH: 760;
}

.divcenter {
	position: absolute;
	height: 30px;
	z-index: 1000;
	left: 101px;
	top: 993px;
}
</STYLE>
<script language="javascript">
	function showsubmenu(sid) {
		whichEl = eval("submenu" + sid);
		if (whichEl.style.display == "none") {
			eval("submenu" + sid + ".style.display=\"\";");
			eval("txt"
					+ sid
					+ ".innerHTML=\"<a href='#' title='�رմ���'><font face='Wingdings' color=#FFFFFF>x</font></a>\";");
		} else {
			eval("submenu" + sid + ".style.display=\"none\";");
			eval("txt"
					+ sid
					+ ".innerHTML=\"<a href='#' title='�򿪴���'><font face='Wingdings' color=#FFFFFF>y</font></a>\";");
		}
	}
</SCRIPT>
</head>
<body topmargin="0" leftmargin="0">
	<CENTER>

		<tr>
			<td style="" id='submenu1'>
				<table border=0 width=100% cellspacing=1 cellpadding=3
					bgcolor="#f58200">
						
					<tr bgcolor="#FFFFFF" height="22">
						<td width="130">&nbsp;��������</td>
						<td colspan="3" height="22">&nbsp;<%=request.getServerName()%>(<%=request.getRemoteAddr()%>)
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td>&nbsp;����������ϵͳ</td>
						<td colspan="3">&nbsp;<%=env.queryHashtable("os.name")%> <%=env.queryHashtable("os.version")%>
							<%=env.queryHashtable("sun.os.patch.level")%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td>&nbsp;����������ϵͳ����</td>
						<td>&nbsp;<%=env.queryHashtable("os.arch")%></td>
						<td>&nbsp;����������ϵͳģʽ</td>
						<td>&nbsp;<%=env.queryHashtable("sun.arch.data.model")%>λ
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td>&nbsp;���������ڵ���</td>
						<td>&nbsp;<%=env.queryHashtable("user.country")%></td>
						<td>&nbsp;����������</td>
						<td>&nbsp;<%=env.queryHashtable("user.language")%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td>&nbsp;������ʱ��</td>
						<td>&nbsp;<%=env.queryHashtable("user.timezone")%></td>
						<td>&nbsp;������ʱ��</td>
						<td>&nbsp;<%=new java.util.Date()%>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td>&nbsp;��������������</td>
						<td width="170">&nbsp;<%=getServletContext().getServerInfo()%></td>
						<td width="130">&nbsp;�������˿�</td>
						<td width="170">&nbsp;<%=request.getServerPort()%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td height="22">&nbsp;��ǰ�û�</td>
						<td height="22" colspan="3">&nbsp;<%=env.queryHashtable("user.name")%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td>&nbsp;�û�Ŀ¼</td>
						<td colspan="3">&nbsp;<%=env.queryHashtable("user.dir")%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td align=left bgcolor="#FFFFFF">&nbsp;���ļ�ʵ��·��</td>
						<td height="8" colspan="3" bgcolor="#FFFFFF">&nbsp;<%=request.getRealPath(request.getServletPath())%></td>
					</tr>
				</table>
		</td>
		</tr>
		</table>
		<a name="JAVAInfo" id="JAVAInfo"></a><br>

		<tr>
			<td style="" id='submenu1'>
				<table border=0 width=100% cellspacing=1 cellpadding=3
					bgcolor="#f58200">
					<tr bgcolor="#fcc79b" height="22">
						<td width="30%">&nbsp;����</td>
						<td width="50%" height="22">&nbsp;Ӣ������</td>
						<td width="20%" height="22">&nbsp;�汾</td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td width="30%">&nbsp;JAVA���л�������</td>
						<td width="50%" height="22">&nbsp;<%=env.queryHashtable("java.runtime.name")%></td>
						<td width="20%" height="22">&nbsp;<%=env.queryHashtable("java.runtime.version")%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td width="30%">&nbsp;JAVA���л���˵��������</td>
						<td width="50%" height="22">&nbsp;<%=env.queryHashtable("java.specification.name")%></td>
						<td width="20%" height="22">&nbsp;<%=env.queryHashtable("java.specification.version")%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td width="30%">&nbsp;JAVA���������</td>
						<td width="50%" height="22">&nbsp;<%=env.queryHashtable("java.vm.name")%></td>
						<td width="20%" height="22">&nbsp;<%=env.queryHashtable("java.vm.version")%></td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td width="30%">&nbsp;JAVA�����˵��������</td>
						<td width="50%" height="22">&nbsp;<%=env.queryHashtable("java.vm.specification.name")%></td>
						<td width="20%" height="22">&nbsp;<%=env.queryHashtable("java.vm.specification.version")%></td>
					</tr>
					<%
						float fFreeMemory = (float) Runtime.getRuntime().freeMemory();
						float fTotalMemory = (float) Runtime.getRuntime().totalMemory();
						float fPercent = fFreeMemory / fTotalMemory * 100;
					%>
					<tr bgcolor="#FFFFFF" height="22">
						<td height="22">&nbsp;JAVA�����ʣ���ڴ棺</td>
						<td height="22" colspan="2"><img align=absmiddle class=PicBar
							width='<%=0.85 * fPercent%>%'>&nbsp;<%=fFreeMemory / 1024 / 1024%>M
						</td>
					</tr>
					<tr bgcolor="#FFFFFF" height="22">
						<td height="22">&nbsp;JAVA����������ڴ�</td>
						<td height="22" colspan="2"><img align=absmiddle class=PicBar
							width='85%'>&nbsp;<%=fTotalMemory / 1024 / 1024%>M</td>
					</tr>
				</table>

			</td>
		</tr>
		</table>
		<a name="Paramter" id="Paramter"></a><br>
		<form action="?action=query" method="post" name="queryform">

			<table border=0 width=100% cellspacing=1 cellpadding=3
				bgcolor="#f58200">
				<%
					if (action.equals("query")) {
						String query = request.getParameter("query");
						env.getHashtable(query);
						if (env.htShowMsg.size() > 0)
							out.println(
									"<tr bgcolor=\"#fcc79b\" height=\"22\">\n<td>&nbsp;��������</td>\n<td>&nbsp;������Ϣ</td>\n</tr>");
						else
							out.println(
									"<tr bgcolor=\"#fcc79b\" height=\"22\">\n<td>&nbsp;<font color=red>������Ϣ��</font></td>\n<td>&nbsp;<font color=red>û���ҵ�������ѯ�����ݣ���������Ҫ��ѯ�Ĳ����������ȷ�ϣ����Խ��г����ѯ��������������ĸ��</font></td>\n</tr>");
						Enumeration em = env.htShowMsg.keys();
						while (em.hasMoreElements()) {
							String strParam = (String) em.nextElement();
							String strParamValue = (String) env.htShowMsg.get(strParam);
							if (strParam.indexOf(".path", 0) >= 0) {
								strParamValue = strParamValue.replaceAll(env.queryHashtable("path.separator"),
										env.queryHashtable("path.separator") + "<br>&nbsp;");
							}
							out.println("<tr bgcolor=\"#FFFFFF\" height=\"22\"><td width=\"30%\">&nbsp;" + strParam
									+ "</td><td width=\"70%\">&nbsp;" + strParamValue + "</td></tr>");
						}
					}
				%>
			</table>
			</td>
			</tr>
			</table>
		</form>
		<a name="ServerAbility" id="ServerAbility"></a>

		<%
			long timePageEnd = System.currentTimeMillis();
			long timePageUse = timePageEnd - timePageStart;
		%>

	</CENTER>
</body>
</html>