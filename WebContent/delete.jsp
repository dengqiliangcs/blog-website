<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, com.tyut.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>delete</title>
</head>
<body>
<%
	String ublog = request.getParameter("blogs");
 	String muser=request.getParameter("username");
    String user=(String)session.getAttribute("usernames");
    
	if(muser.equals(user))
	{
	String sql = "delete from blogs where blogs='" + ublog +"'";
	DbUtil.executeUpdate(sql);
	String sql1 = "select * from blogs";
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	rs = DbUtil.executeQuery(sql1);
	while(rs.next()){
		String utitle = rs.getString("title");
		String blog = rs.getString("blogs");
		String username=rs.getString("username");
		sb.append("<tr><td width=50>");
		sb.append(rs.getString("username"));
		sb.append("</td><td width=100>");
		sb.append(rs.getString("title"));
		sb.append("</td><td width=500>");
		sb.append(rs.getString("blogs"));
		sb.append("</td><td width=65>");
		sb.append("<a href=delete.jsp?blogs=" + blog + "&username=" + username + ">删除博客</a></td>");
		sb.append("</td></tr>");
	}
	String users = sb.toString();

	session.setAttribute("users", users);
	response.sendRedirect("userBlogs.jsp");
	}
	else {
		out.println("您不是博主，无权删除:)");
		out.print("<br><a href = 'userBlogs.jsp'>返回</a>");
	}
%>
</body>
</html>








