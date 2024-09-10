<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>选择题</title>
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>

<body>
<hr>
<p align="center">&nbsp;</p>
<span class="chinese">
<%!
int i=0;
int zhang=1;//Integer.parseInt(request.getParameter("zhang"));
int rightcount=0;
int times=0;
String uid="fafa";
%>
<%
session.setAttribute("uid",uid);
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM xuanzeti");

//判断request对象是否获得窗体数据
//若未获得则产生题目，若有获得数据，则将计算成绩
if(request.getParameter("submit1")==null)
{i=0;

 rightcount=0;%>
<!--下面的窗体将以post方法，将数据传送给xuanze.jsp文件-->
<!-- 此为隐藏字段，其默认值为系统时间-->

</span>
<form name="allmyans" action="xuanzeti.jsp" method="post">
<span class="chinese">
<input type="hidden" name="zhang" value="<%=zhang%>">
</span>
<table width="85%" border=0>
<%
String answer;
String answer1;
String answer2;
String answer3;
String answer4;
while(rs.next()){
i++;
%>

<tr>
   <td class="chinese"><%=i%>、
       <%String Qus=rs.getString("tigan");
       System.out.println(Qus);%>
       <%=Qus%>
       <%//session.setAttribute("i",i);
     answer=rs.getString("daan");
     answer1=rs.getString("a");
	 answer2=rs.getString("b");
	 answer3=rs.getString("c");
	 answer4=rs.getString("d");
     session.setAttribute("Qus"+i,Qus);
	 session.setAttribute("Ans"+i,answer);
	 session.setAttribute("Ansa"+i,answer1);
	 session.setAttribute("Ansb"+i,answer2);
	 session.setAttribute("Ansc"+i,answer3);
	 session.setAttribute("Ansd"+i,answer4);

	%>
   </td>
</tr>
<table>
<tr>
   <td class="chinese">
   <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     A.<%=answer1%></td>
   <td class="chinese">
     <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     B.<%=answer2%></td>
   <td class="chinese">
        <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     C.<%=answer3%></td>
   <td class="chinese">
       <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     D.<%=answer4%></td>
    
</tr>
<tr>
<a href="" target="_blank">查看答案</a>
</tr>
</table>
<tr>
<td></td>
</tr>
<tr></tr>
<%}
if(i!=0)
{
%>
</table>
<table width="294" border="0">
      <tr>
        <td width="147" class="chinese">
        <input name="submit1" type="submit" class="button1" value="提交" />
        </td>
        <td width="137" class="chinese">
        <input name="submit2" type="reset" class="button1" value="清除" />
        </td>
      </tr>
  </table>
</form>

<span class="chinese">
<%}
if(i==0){
%>
本章暂时没有题目……


<%
}
}
else
{

	//int i=(int)session.getAttribute("i");
//	String zhang1=request.getParameter("zhang");
	int j=1;
	for(j=1;j<=i;j++)
	{%>
</span>
<p class="chinese">第<%=j%>题您
  <%
	//从session对象中获得题目与答案
	String Ans=(String)session.getAttribute("Ans"+j);
	String UserAns=request.getParameter("myans"+j);
	%>

  <%
	if(UserAns==null)
	{%>
  <FONT size="4" color="RED">未作答</FONT><BR>
  题目是
	<font color="green"><B>
	<!--输出题目-->
	<%=session.getAttribute("Qus"+j)%>
	</B></font><br>
  答案是<font color="brown"><B>
  <!--输出答案-->
  [<%=Ans%>]、<%=session.getAttribute("Ans"+Ans+j)%></B></font>
  <%
	}else if(UserAns.equals(Ans))
	{
	//System.out.println(UserAns);
	 rightcount++;
	 %>
  答<font size="4" color="blue" >对</font>了

</p>
	<span class="chinese">
	<%
	}
	else {
	%>
	答<font size="4" color="red">错</font>了
	</p>
		题目是
	    <font color="green"><B>
	<!--输出题目-->
	<%=session.getAttribute("Qus"+j)%>
	    </B></font><br>
	    答案是<font color="brown"><B>
	<!--输出答案-->
	[<%=Ans%>]、<%=session.getAttribute("Ans"+Ans+j)%></B></font>
	    <%}
	}
	
	%>
	</span>
	<h3 class="chinese"><%=i%>题中您共答对了<%=rightcount%>题</h3>
	<p class="chinese"><a href=xuanzeti.jsp?zhang=<%=request.getParameter("zhang")%>>不甘心！再来一次</a>
      <%
String uid=(String)session.getAttribute("uid");
String career=null;
int id=0;
//int zhang1=zhang;
times++;
java.util.Date today;
String dateOut,dateOut1;
Locale currentLocale=new Locale("zh","CN");
DateFormat formatter;
formatter = DateFormat.getDateInstance(DateFormat.LONG,currentLocale);
DateFormat formatter1;
formatter1=DateFormat.getTimeInstance(DateFormat.LONG,currentLocale);
today = new java.util.Date();
dateOut = formatter.format(today);
dateOut1=formatter1.format(today);
//System.out.println(dateOut + " " + currentLocale.toString());
//System.out.println(dateOut1 + " " + currentLocale.toString());
dateOut=dateOut+dateOut1;
String sql="insert into students_xuanze values('"+uid+"','"+career+"',"+zhang+","+rightcount+","+times+",'"+dateOut+"')";
stmt.executeUpdate(sql);
}
//rs.close();
stmt.close();
conn.close();
%>
</p>
	<p class="chinese"><a href="xuanzeti_view.jsp">查看我以往做过的情况</a></p>
	<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
</body>
</html>
