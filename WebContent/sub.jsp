<%@page import="java.sql.PreparedStatement, com.tyut.utils.*, java.sql.*"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String uname = request.getParameter("username");
	String ublogs = request.getParameter("blogs");
	String utitle = request.getParameter("title");
	
	String sql = "insert into blogs values (?,?,?)";
	int rows = 0;
	try{
		PreparedStatement ps = DbUtil.getPreparedStatement(sql);
		ps.setString(1, uname);
		ps.setString(2, ublogs);
		ps.setString(3, utitle);
		
		rows = ps.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(rows>0){
		response.sendRedirect("userBlogs.jsp");
	}
%>
</body>
</html>










