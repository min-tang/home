<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>注册成功</title>
</head>
<style type="text/css"></style>
<body>

<%
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
//读取表单内容
String uid=request.getParameter("uid");
String nickname=request.getParameter("nickname");
byte [] tmpbyte=nickname.getBytes("ISO8859_1");
nickname=new String(tmpbyte);
String gender=request.getParameter("gender");
tmpbyte=gender.getBytes("ISO8859_1");
gender=new String(tmpbyte);
String pwd=request.getParameter("pwd");
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
String birth=year+"-"+month+"-"+date;
String sql="insert into custom values('"+uid+"','"+pwd+"','"+nickname+"','"+name+"','"+gender+"','"+career+"','"+address+"','"+email+"','"+tel+"','"+birth+"')";
//String sql="select * from custom";
//将记录添加到数据库中

stmt.executeUpdate(sql);
%>
<p><font color="#CC0033"><%=uid%></font>:祝贺您！您的信息已经添加到数据库中。</p>
<p align="center"><a href="default.html">回到首页</a></p>
</body>
</html>
