<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	background-image: url(images/bg.gif);
}
body,td,th {
	font-size: 14px;
	color: #666666;
}
-->
</style>
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div align="center">
  <%
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
String uid=request.getParameter("uid");
if(uid==null)
uid=(String)session.getAttribute("uid");
String sql="SELECT * FROM students_xuanze where uid like '"+uid+"'";
System.out.println(uid);
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
%>
</div>
<TABLE style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 11pt; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none; BORDER-COLLAPSE: collapse" 
      cellSpacing=0 cellPadding=0 width=800 align=center border=1>
        <TBODY>
        <TR align=middle bgColor=#CCCCFF>
<p align="center"><%=rs.getString("uid")%>同学，做对了<%=rs.getString("rightcount")%>题,做题时间为<%=rs.getString("dayntime")%>。</p>
</TR>
</tbody>
<div align="center">
  <p>
    <%
}
%>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p align="center"> </p>
  <table height="4" cellspacing="0" width="640" align="center" border="0">
    <tbody>
      <tr>
        <td valign="bottom" width="787" bgcolor="#0b5a7e" height="4"></td>
      </tr>
    </tbody>
  </table>
  <div align="center">
    <div align="center"><font color="#333333" face="Tahoma" style="FONT-SIZE: 9pt">Zhejiang University 2004-2005年版权所有&copy;<br />
    如果你有任何意见或建议请联系我们的 <a 
href="mailto:fafa37@163.com">软件维护人员</a><br />
    设计者：方帆<br />
    建议使用IE4.0以上，1024×768浏览 </font>
        <p></p>
    </div>
  </div>
  <p>&nbsp;    </p>
</div>
</body>
</html>
