<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	background-color: #ADBACE;
}
-->
</style>
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
String uid=(String)session.getValue("uid");
if(uid==null||uid=="")
{%>
<p>您还没有登陆！</p>
<p><a href="default.jsp">回到首页</a>
<%}else{%>
</p>
<form action="edit2.jsp" method="post">
  <div align="center">
    <p>
      <%
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
//生成查询的sql命令
String sql="select * from custom where uid='"+uid+"'";
//rs为返回结果的ResultSet对象
ResultSet rs=stmt.executeQuery(sql);
rs.next();
String nickname=rs.getString("nickname").trim();
String name=rs.getString("name").trim();
String gender=rs.getString("gender").trim();
String career=rs.getString("career").trim();
String address=rs.getString("address").trim();
String email=rs.getString("email").trim();
String tel=rs.getString("tel").trim();
String birth=rs.getString("birth").trim();
String year=birth.substring(0,4);
String month=birth.substring(5,7);
String date=birth.substring(8,10);
%>
    请按照下表修改您的信息！</p>
    <hr />
    <table width="527" border="0">
      <tr>
        <td width="153" height="32">用户 ID: </td>
        <td width="364" ><%=uid%>&nbsp;</td>
		<input type="hidden" name="uid" value="<%=uid%>">
      </tr>
      <tr>
        <td height="29">请设定您的密码：</td>
        <td><input type="password" name="pwd" /></td>
      </tr>
      <tr>
        <td height="34">请确认您的密码：</td>
        <td><input type="password" name="pwd1" /></td>
      </tr>
      <tr>
        <td height="27">请输入您的昵称：</td>
        <td><input type="text" name="nickname"  value="<%=nickname%>"/></td>
      </tr>
      <tr>
        <td height="31">请选择您的性别：</td>
        <td><input name="gender" type="radio" <%if(gender.compareTo("male")==0) out.print("checked");%> value="male" />
    男
      <input type="radio" name="gender" <%if(gender.compareTo("female")==0) out.print("checked");%> value="female" />
    女</td>
      </tr>
      <tr>
        <td height="25">请输入您的真实姓名：</td>
        <td><input type="text" name="name"  value="<%=name%>"/></td>
      </tr>
      <tr>
        <td height="24">请输入您的通讯地址：</td>
        <td><input type="text" name="address" value="<%=address%>"/></td>
      </tr>
      <tr>
        <td height="25">请输入电子信箱：</td>
        <td><input type="text" name="email" value="<%=email%>"/></td>
      </tr>
      <tr>
        <td height="30">请输入联系电话：</td>
        <td><input type="text" name="tel" value="<%=tel%>" /></td>
      </tr>
      <tr>
        <td height="28">请输入您的生日：</td>
        <td><input name="year" type="text" size="10"  value="<%=year%>"/>
    年
      <input name="month" type="text" size="5"  value="<%=month%>"/>
    月
    <input name="date" type="text" size="5" value="<%=date%>"/>
    日(yyyy-mm-dd)</td>
      </tr>
      <tr>
        <td height="28">职业：</td>
        <td><input type="text" name="career"  value="<%=career%>"/></td>
      </tr>
    </table>
    <hr />
    <table width="320" border="0">
      <tr>
        <td height="31"><input type="submit" name="Submit" value="确认" /></td>
        <td><input type="reset" name="Submit2" value="清除" /></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;    </p>
  </div>
</form>
<%}%>
</body>
</html>
