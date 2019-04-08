package com.tyut.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import java.sql.PreparedStatement;
import com.tyut.utils.DbUtil;

/**
 * Servlet implementation class add
 */
@WebServlet("/add")
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServletConfig servletconfig;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config)throws ServletException{
    	this.servletconfig=config;
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
        
        SmartUpload su=new SmartUpload();
        su.initialize(servletconfig, request, response);
        su.setAllowedFilesList("jpg,png,jpeg");
        su.setMaxFileSize(12*1024*1024);
        try {
			su.upload();
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        PrintWriter out = response.getWriter();
        Request req=su.getRequest();
        String uname = req.getParameter("username");
    	String upass = req.getParameter("password");
    	
    	Files files=su.getFiles();
    	File file=files.getFile(0);
    	String extFile=file.getFileExt();
    	String mainFile=String.valueOf(uname);
    	String filename="/image/"+mainFile+"."+extFile;
    	try {
			file.saveAs(filename);
		} catch (SmartUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	String sql = "insert into tb_users values (?,?,?)";
    	int rows = 0;
    	try{
    		PreparedStatement ps = DbUtil.getPreparedStatement(sql);
    		ps.setString(1, uname);
    		ps.setString(2, upass);
    		ps.setString(3, filename);
    		rows = ps.executeUpdate();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	if(rows>0)
    		response.sendRedirect("index.html");
    	else
    		out.print("该用户已注册:)");
    		out.print("<br><a href = 'userAdd.html'>返回</a>");
	}

}
