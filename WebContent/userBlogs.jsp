<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.tyut.utils.*,com.tyut.servlet.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>博客中心</title>
<style type="text/css">
a{
text-decoration:none;
}
#aa{
width:100%;
word-break:keep-all;
white-space:nowrap;
text-overflow:ellipsis;
overflow:hidden;
}
</style>
</head>
<body style="background-image:url('../blogs/image/7.jpg');background-repeat:no-repeat;background-size:100%">
<audio src="../blogs/music/1.mp3" controls preload="auto" > </audio>
<br><br>
<form action="search.jsp" method="post">
	查找方式：<select name="column">
		<option value="username">用户名</option>
		<option value="title">标题</option>
	</select>   
	关键字：<input type="text" name="key" />   
	<input type="submit" value="查找"/>   
	<a href="index.html">回到首页</a>  <a href="Blogs.jsp">写博客</a>
	当前在线人数：<%= OnlineCounter.getCounter() %>
</form><br/><br/><br/>
<table align="center" border="1" cellspacing="0" >
	<tr>
		<th>用户名</th>
		<th>标题</th>
		<th>博客</th>
		<th>操作</th>
	</tr>
<%
String users = (String)session.getAttribute("users");
out.print(users);
%>
</table>
</body>
</html>



