<SCRIPT language="javascript">
function backward()
{
      history.back();
}
</SCRIPT>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>请检查以下表单</title>
<style type="text/css">
<!--
body {
	background-color: #ADBACE;
}
-->
</style>
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>
<style type="text/css"><!--@import url(css/jsp.css);body,td,th {
	font-size: 12px;
}
--></style>
<body>
<%
/*Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
String url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=jsp";
String user="jsp";
String password="820728";
Connection conn=DriverManager.getConnection(url,user,password);
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);*/
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
//判断所选用户ID是否与现有ID重名
String uid=request.getParameter("uid");
//生成查询的sql命令
String sql="select * from custom where uid='"+uid+"'";
//rs 为返回结果的ResultSet对象
ResultSet rs=stmt.executeQuery(sql);
if(rs.next())
{
//用户ID已经被其他申请
rs.close();
stmt.close();
conn.close();
%>
<p>对不起！您选择的用户ID已经被其他人申请，请重新选择！</p>
<p><input name="Button2" type="button" class="button1" onClick="backward()" value="返回上一步">
</p>
<%}
else{
//用户id没有被申请，进入确认表单
rs.close();
String nickname=request.getParameter("nickname");
byte[] tmpbyte=nickname.getBytes("ISO8859_1");
nickname=new String(tmpbyte);
String gender=request.getParameter("gender");
tmpbyte=gender.getBytes("ISO8859_1");
gender=new String(tmpbyte);
String pwd=request.getParameter("psw1");
String name=request.getParameter("name");
tmpbyte=name.getBytes("ISO8859_1");
name=new String(tmpbyte);
String career=request.getParameter("career");
tmpbyte=career.getBytes("ISO8859_1");
career=new String(tmpbyte);
String address=request.getParameter("address");
tmpbyte=address.getBytes("ISO8859_1");
address=new String(tmpbyte);
String email=request.getParameter("email");
String tel=request.getParameter("tel");
String year=request.getParameter("year");
String month=request.getParameter("month");
String date=request.getParameter("date");
%>
<FORM action="reg3.jsp" method="post">
<input type="hidden" name="uid" value="<%=uid%>">
<input type="hidden" name="nickname" value="<%=nickname%>">
<input type="hidden" name="gender" value="<%=gender%>">
<input type="hidden" name="pwd" value="<%=pwd%>">
<input type="hidden" name="name" value="<%=name%>">
<input type="hidden" name="career" value="<%=career%>">
<input type="hidden" name="address" value="<%=address%>">
<input type="hidden" name="email" value="<%=email%>">
<input type="hidden" name="tel" value="<%=tel%>">
<input type="hidden" name="year" value="<%=year%>">
<input type="hidden" name="month" value="<%=month%>">
<input type="hidden" name="date" value="<%=date%>">
<div align="center"><b><font size="3">请认真检查下面的注册申请单。</font></b>
<hr width="100%">
<table width="414" border="0" cellspacing="2" cellpadding="1">
<tbody>
<tr>
  <td align="right">用户id：
  <td align="left"><%=uid%>
<tr>
  <td align="right">您的昵称：
  <td align="left"><%=nickname%>
<tr>
  <td align="right">性别：
  <td align="left"><%=gender%>
<tr>
  <td align="right">真实姓名：
  <td align="left"><%=name%>
<tr>
  <td align="right">职业：
  <td align="left"><%=career%>
<tr>
  <td align="right">通讯地址：
  <td align="left"><%=address%>
<tr>
  <td align="right">电子信箱：
  <td align="left"><%=email%>
<tr>
  <td align="right">联络电话：
  <td align="left"><%=tel%>
<tr>
 <td align="right" width="129">
   <div align="right">您的生日：</div>
   <td align="left" width="255"><%=year%>年<%=month%>月<%=date%>日
   
<tr>
   </td>
</tr>
</table>
<hr />
<table width="200" border="0">
  <tr>
    <td><input name="Submit" type="submit" class="button1" value="确认" /></td>
    <td><input name="Submit2" type="button" class="button1"  onclick="backward()" value="返回上一步"/></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
</FORM>
<%}%>
</body>
</html>
