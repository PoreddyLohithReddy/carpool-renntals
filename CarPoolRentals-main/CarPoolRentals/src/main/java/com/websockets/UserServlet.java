package com.websockets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/login")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


   
	
	public UserServlet() {
    	super();
    	
    }

	
	
	
	static RequestDispatcher rd;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter printWriter=response.getWriter();
		
		HttpSession session=request.getSession(true);
		String username=request.getParameter("username");
		session.setAttribute("username",username);
		
		
		if(username!=null && username.equals("superadmin"))
		{
			rd=request.getRequestDispatcher("/superadmin.jsp");
			rd.forward(request, response);
		}
		
		
		else if(username!=null && username.equals("application"))
		{
			rd=request.getRequestDispatcher("/application.jsp");
			rd.forward(request, response);
		}
		
		
		else if(username!=null)
		{
			rd=request.getRequestDispatcher("/Carowner.jsp");
			rd.forward(request,response);
		}
		
		
		
	}

}
