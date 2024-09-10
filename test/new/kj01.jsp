<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>操作演示</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<link href="frame/CSS/aa.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY BGCOLOR=#CCCCCC LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<!-- ImageReady Slices (demo_2.psd) -->
<TABLE WIDTH=102 height="100" BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
  <TR>
  <%!
int i=0;
int rightcount=0;
int times=0;
%>
<%
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
int id=Integer.parseInt(request.getParameter("id"));
ResultSet rs=stmt.executeQuery("SELECT * FROM avi where id="+id);
%>
		
    <TD> <IMG SRC="frame/images/index_01.gif" WIDTH=774 HEIGHT=65 ALT=""></TD>
	</TR>
	
  <TR> 
    <TD bgcolor="#FFFFFF"><div align="center"> 
        <table width=90% height="100%" border=0 align="center" cellpadding=0 cellspacing=0>
          <tr> 
            <td height="22" bordercolor="0"  class="P1"><span class="bar1">教学案例<b><font color="#800000">【请输入】</font></b></span> 
            </td>
          </tr>
          <tr> 
            <td height="30" bordercolor="0" class="P1"><b><font color="#800000">【请添加有现实指导意义和教学意义的代表性的视频。】</font></b></td>
          </tr>
          <tr> 
            <td height="15" valign="top" bordercolor="0" class="P1"> <div align="center"> 
                <table width="100%" border="0" align="center">
                  <tr> 
                    <td width="174" align="left" valign="top" bordercolor="#111111"> 
                      <p class="title02"><b><font color="#003399">教学案例：</font></b> 
                      <div align="center"> 
					  <%
					    String dabiaoti;
					    String description;
						int zhang;
						String html;
					    while(rs.next()){
		    			i++;
						id=Integer.parseInt(rs.getString("id"));
						html=rs.getString("html");
						zhang=Integer.parseInt(rs.getString("zhang"));
						dabiaoti=rs.getString("dabiaoti");
						description=rs.getString("description");
					  %>
                        <p class="P1"><h3><%=dabiaoti%></h3></div>
                      <p class="P1"><b><font color="#800000">【案例的说明:</font></b><font color="#800000"><span class="P1"><%=description%></span><font color="#800000">，<span class="bar1"><b><font color="#800000">】</font></b></span></font></font></td>
                    <td width="467"><div align="center"> 
                        <%=html%></div></td>
                  </tr><%}%>
                </table>
              </div></td>
          </tr>
        </table>
      </div></TD>
	</TR>
	<TR>
		
    <TD> <IMG SRC="images/bq.gif" WIDTH=774 HEIGHT=34 ALT=""></TD>
	</TR>
</TABLE>
<!-- End ImageReady Slices -->
</BODY>
</HTML>