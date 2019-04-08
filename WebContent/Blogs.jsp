<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.tyut.utils.*,com.tyut.servlet.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发表博客</title>
<style type="text/css">
a{
text-decoration:none
}
</style>
</head>
<body style="background-image:url('../blogs/image/8.jpg');background-repeat:no-repeat;background-size:100%">
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charaset =utf-8");

String mname = (String)session.getAttribute("usernames");
String mimage = (String)session.getAttribute("image");
out.println("<p align=right><img src=../blogs"+mimage+" height=28 width=50  border=0>"+mname+"欢迎您:)</p>");
%>

<form action="sub.jsp" method="post">

	<table align="center" width="300" align="center" border="1" cellspacing="0">
		<tr>
			<td>用户名</td>
			<td><input type="text" name="username" value=<%=mname %> readonly="true" size=28>
		</tr>
		<tr>
			<td>标&nbsp;题</td>
			<td><input type="text" name="title"  size=28>
		</tr>
		<tr>
			<td>内&nbsp;容</td>
			<td><textarea rows="10" cols="30" name="blogs"></textarea>	
		</tr>		
	</table>
	<div align="center"><input  type="submit" value="发表"/></div>
	<p><a href="index.html">回到首页</a></p>
	<p><a href="userBlogs.jsp">博客中心</a></p>
</form>
<embed src="../blogs/video/1.mp4" width="300" height="200" autostart="false">
</body>
</html>