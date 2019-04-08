<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, com.tyut.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>博客内容</title>
<link rel="stylesheet" href="../blogs/css/kandi.css" type="text/css" media="screen">
<style type="text/css">
a{
text-decoration:none;
}
.user{margin:0px auto;width:500px;height:20px;text-align:right;font-size:80%;}
.blog{align:center;margin:0px auto;width:500px; height:100px;}</style>
</head>
<body style="background-image:url('../blogs/image/9.jpg');background-repeat:no-repeat;background-size:100%">
<%
String ublog = request.getParameter("blogs");
String muser=request.getParameter("username");
String utitle=request.getParameter("title");
%>
<p style="text-align:center;font-size:150%;"><%=utitle %></p><br>
<p class="user">作者:<%=muser %></p><br>
<p class="blog">&nbsp;&nbsp;&nbsp;&nbsp;<%=ublog %></a></p>
<p><a href="userBlogs.jsp">回到博客中心</a></p>
<br><br>
<h4 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无聊了？玩玩游戏:)[按空格键跳跃]</h4>
<div class="wrapper " >
<canvas id="canvas" width="800" height="480">
  <p>You're browser does not support the required functionality to play this game.</p>
  <p>Please update to a modern browser such as <a href="www.google.com/chrome/‎">Google Chrome</a> to play.</p>
</canvas>
<div id="game-over" >
  <a href="javascript:void(0);" class="restart" id="restart">再试一次？</a>
</div>
</div>
<script type="text/javascript" src="../blogs/js/kandi.js"></script>
</body>
</html>