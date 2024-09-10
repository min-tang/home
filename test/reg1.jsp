<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="css/site.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #ADBACE;
}
.style1 {color: #FF0000}
-->
</style></head>
<script language="JavaScript">
function check()
{
	fr = document.form1;
	if(fr.uid.value=="")
	{
		alert("用户ID必须要填写！");
		fr.uid.focus();
		return;
	}
	if(fr.nickname.value == "")
	{
		alert("昵称必须要填写！");
		fr.nickname.focus();
		return;
	}
	if((fr.psw1.value != "") || (fr.psw2.value != ""))
	{
		if(fr.psw1.value!=fr.psw2.value)
		{
			alert("密码不一致,请重新输入并验证密码！");
			fr.psw1.focus();
			return;
		}
	}
	else {
		alert("密码不能为空！");
		fr.psw1.focus();
		return;
	}
	if(fr.name.value == "")
	{
		alert("真实姓名必须要填写！");
		fr.name.focus();
		return;
	}
	if(fr.gender.value == "")
	{
		alert("性别必须要填写！");
		fr.name.focus();
		return;
	}
/*		if(fr.mobilephone.value=="")
	{
		alert("你的移动电话必须要填写！");
        fr.mobilephone.focus();
		return;
	}
	else {
		if(!isMobile(fr.mobilephone.value))
		{
			alert("你的移动电话输入有错（此站点只为联通用户提供服务)！");
			fr.mobilephone.focus();
			return;
		}
	}*/
	if(fr.tel.value!="")
		if(!isPhone(fr.tel.value)) {
			alert("你的电话输入有错!");
				fr.tel.focus();
				return;
		}
	if(fr.year.value!="")
		if(!isYear(fr.year.value)) {
			alert("你的出生年份输入有错!");
				fr.year.focus();
				return;
		}
	if(fr.email.value != "")
	{
		if(!isEmail(fr.email.value)) {
			alert("请输入正确的信箱名称！");
			fr.email.focus();
			return;
		}
	}
	fr.submit();
}
function isYear(theStr) {
    var flag = true;
	var trimStr = Trim(theStr);
	var trimlen = trimStr.length;
	var nextStr = trimStr;

	if(trimStr.charAt(0) == '0') {
		nextStr = trimStr.substring(1,trimlen);
	}
	var len  = nextStr.length;
	if(len != 4)
		flag = false;
	for(var i = 0; i < len; i++) {
		if((nextStr.charAt(i) > '9') || (nextStr.charAt(i) < '0'))
		flag = false;
	}
	if((nextStr.charAt(0) != '1') || (nextStr.charAt(1) != '9'))
		flag = false;
	return flag;
}

function isEmail(theStr){
    var atindex=theStr.indexOf('@');
    var dotindex=theStr.indexOf('.',atindex);
    var flag=true;
    thesub=theStr.substring(0,dotindex+1);
    if((atindex<1)||(atindex!=theStr.lastIndexOf('@'))||(dotindex<atindex+2)||(theStr.length<=thesub.length)){
      flag=false;
    }else{
      flag=true;
    }
    return(flag);
}
function isPhone(theStr) {
	var flag = true;
	var trimStr = Trim(theStr);
	var theindex = trimStr.indexOf('-',0);
	var trimlen = trimStr.length;
	var nextStr = trimStr;

	if(theindex != -1) {
		var firstStr = trimStr.substring(0, theindex);
		nextStr = trimStr.substring(theindex+1, trimlen);
		if((theindex != 3) && (theindex != 4))
		flag = false;
		var len = firstStr.length;
		for(var j = 0; j < len; j++) {
			if((nextStr.charAt(i) > '9') || (nextStr.charAt(i) < '0'))
			flag = false;
		}
		if(nextStr.length == 0)
		flag = false;
		if(nextStr.indexOf('-',0) != -1)
		flag = false;
	}
	else {
		var nextLen = nextStr.length;
		if(nextLen == 0)
		flag = false;
		if(nextStr.indexOf('-',0) != -1)
		flag = false;
		if((nextLen != 7) && (nextLen != 8))
		flag = false;
		for(var i = 0; i < nextLen; i++) {
			if((trimStr.charAt(i)>'9') || (trimStr.charAt(i) <'0'))
			flag = false;
		}
	}
	return flag;
}
function isMobile(theStr) {
	var flag = true;
	var trimStr = Trim(theStr);
	var trimlen = trimStr.length;
	var nextStr = trimStr;

	if(trimStr.charAt(0) == '0') {
		nextStr = trimStr.substring(1,trimlen);
	}
	var len  = nextStr.length;
	if(len != 11)
		flag = false;
	for(var i = 0; i < len; i++) {
		if((nextStr.charAt(i) > '9') || (nextStr.charAt(i) < '0'))
		flag = false;
	}
	if((nextStr.charAt(0) != '1') || (nextStr.charAt(1) != '3') || (nextStr.charAt(2) > '3') || (nextStr.charAt(2) < '0'))
		flag = false;
	return flag;
}
function Trim(TheString)
{
	var len;

	len = TheString.length;
 	while(TheString.substring(0,1) == " "){ //trim left
 		TheString = TheString.substring(1, len);
  		len = TheString.length;
	}

 	while(TheString.substring(len-1, len) == " "){ //trim right
 		TheString = TheString.substring(0, len-1);
  		len = TheString.length;
 	}
 	return TheString;
}
</script>
<body>

<div align="center">
  <p>请如实填写下面的注册申请单</p>
  <hr />
  <form name="form1" id="form1" method="post" action="reg2.jsp">
    <table width="519" border="0">
      <tr>
        <td width="197">&nbsp;</td>
        <td width="312">&nbsp;</td>
      </tr>
      <tr>
        <td height="25">请输入一个用户id：</td>
        <td><input name="uid" type="text" class="input1" />
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="29">请设定您的密码：</td>
        <td><input name="psw1" type="password" class="input1" />
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="30">请确认您的密码：</td>
        <td><input name="psw2" type="password" class="input1" />
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="27">请输入您的昵称：</td>
        <td><input name="nickname" type="text" class="input1" />
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="31">请选择您的性别：</td>
        <td><input name="gender" type="radio" value="male" checked="checked" />
          男     
          <input name="gender" type="radio" value="female" />
          女<span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="25">请输入您的真实姓名：</td>
        <td><input name="name" type="text" class="input1" />
          <span class="style1">*</span></td>
      </tr>
      <tr>
        <td height="24">请输入您的通讯地址：</td>
        <td><input name="address" type="text" class="input1" />
        </td>
      </tr>
      <tr>
        <td height="25">请输入电子信箱：</td>
        <td><input name="email" type="text" class="input1" /></td>
      </tr>
      <tr>
        <td height="30">请输入联系电话：</td>
        <td><input name="tel" type="text" class="input1" /></td>
      </tr>
      <tr>
        <td height="28">请输入您的生日：</td>
        <td><input name="year" type="text" class="input1" size="10" />          
          年
          
          <select name="month" class="input1">
            <option value="01" selected="selected">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="4">04</option>
            <option value="5">05</option>
            <option value="6">06</option>
            <option value="7">07</option>
            <option value="8">08</option>
            <option value="9">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
          </select>
月

<select name="date" class="input1">
  <option value="01" selected="selected">01</option>
  <option value="02">02</option>
  <option value="03">03</option>
  <option value="4">04</option>
  <option value="5">05</option>
  <option value="6">06</option>
  <option value="7">07</option>
  <option value="8">08</option>
  <option value="9">09</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
  <option value="13">13</option>
  <option value="14">14</option>
  <option value="15">15</option>
  <option value="16">16</option>
  <option value="17">17</option>
  <option value="18">18</option>
  <option value="19">19</option>
  <option value="20">20</option>
  <option value="21">21</option>
  <option value="22">22</option>
  <option value="23">23</option>
  <option value="24">24</option>
  <option value="25">25</option>
  <option value="26">26</option>
  <option value="27">27</option>
  <option value="28">28</option>
  <option value="29">29</option>
  <option value="30">30</option>
  <option value="31">31</option>
</select>
日(yyyy-mm-dd)</td></tr>
      <tr>
        <td height="28">职业：</td>
        <td><select name="career" class="input1" />
        <option value="student" selected="selected">学生</option>        </td>
      </tr>
    </table>
    <p>&nbsp;
    </p>
    <hr />
    <table width="294" border="0">
      <tr>
        <td width="147"><input name="Submit" type="button" class="button1" value="确认" onClick="check()"/></td>
        <td width="137"><input name="Submit2" type="reset" class="button1" value="清除" /></td>
      </tr>
    </table>
  </form>
  <p>&nbsp;</p>
</div>
</body>
</html>
