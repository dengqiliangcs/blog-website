package com.tyut.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.tyut.utils.DbUtil;

/**
 * Servlet implementation class ShowBlog
 */
@WebServlet("/ShowBlog")
public class ShowBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset = utf-8");
        
        PrintWriter out = response.getWriter();
        String yname = request.getParameter("username");
        String ypass = request.getParameter("password");
        
        String sql1="select *from tb_users where username='" + yname + "'";
        ResultSet rs = DbUtil.executeQuery(sql1);
        String tpassword="";
        String timage="";
        try {
			while(rs.next())
			{
				tpassword = rs.getString("password");
				timage = rs.getString("image");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        DbUtil.close();
        HttpSession session = request.getSession();
        if(ypass.equals(tpassword)&&ypass!="")
        {
        	 session.setAttribute("usernames", yname);
        	 session.setAttribute("image", timage);
        	 response.sendRedirect("Blogs.jsp");
        }

        else 
        {
        	 out.print("你输入的用户名或密码不正确哦！");
             out.print("<br><a href = 'index.html'>回到首页</a>");
        }
	}
}
