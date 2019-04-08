<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, com.tyut.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String column = request.getParameter("column");
	String key = request.getParameter("key");
	String sql = "select * from blogs";
	StringBuffer sb = new StringBuffer();
	
	if(key!=null && key!=""){	
			sql = "select * from blogs where " + column + " like '%" + key + "%'";
	}
	
	int pageSize = 4;
	int pageCount;
	int pageCurrent;
	int totalRecord;
	ResultSet rs = DbUtil.executeQuery(sql);
	rs.last();
	totalRecord = rs.getRow();
	pageCount = (totalRecord%pageSize == 0)?(totalRecord/pageSize):((totalRecord/pageSize) + 1);
	String pages;
	pages = request.getParameter("page");
	if(pages == null){
		pageCurrent = 1;
	}
	else{
		pageCurrent = Integer.parseInt(pages);
	}
	if(pageCount > 0){
		rs.absolute((pageCurrent-1) * pageSize + 1);
		int i = 0;
		while(i<pageSize && !rs.isAfterLast()){
				String utitle = rs.getString("title");
				String ublog = rs.getString("blogs");
				String username=rs.getString("username");
				sb.append("<tr><td width=50>");
				sb.append(rs.getString("username"));
				sb.append("</td><td width=100>");
				sb.append(rs.getString("title"));
				sb.append("</td><td width=500>");
				sb.append("<a href=blogcontent.jsp?blogs=" + ublog + "&username=" + username + "&title=" + utitle + ">"+rs.getString("blogs")+"</a> </td>");
				sb.append("</td><td width=65 >");
				sb.append("<a href=delete.jsp?blogs=" + ublog + "&username=" + username + ">删除博客</a> </td>");
				sb.append("</td></tr>");
				rs.next();
				i++;
			}
		sb.append("<p align=center>当前第"+pageCurrent+"页， 共"+ pageCount+"页。");
		if(pageCurrent>1)
		{
			sb.append("<a href=search.jsp?page="+(pageCurrent-1)+">上一页</a>");
		}
		else{
			sb.append("上一页");
		}
		if(pageCurrent<pageCount)
		{
			sb.append("<a href=search.jsp?page="+(pageCurrent+1)+">下一页</a>");
		}
		else{
			sb.append("下一页</P>");
		}
		String users = sb.toString();
		session.setAttribute("users", users);
		response.sendRedirect("userBlogs.jsp");
		}
%>	
</body>
</html>


