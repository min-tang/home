<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
String uid=(String)session.getValue("uid");
if(uid==null||uid=="")
{%>
对不起，您还没有登陆！
<%}else{
session.invalidate();
%>
<SCRIPT language="javascript">alert("你已经成功注销！");
self.location="default.jsp"</SCRIPT>
<%}%>
</body>
</html>
