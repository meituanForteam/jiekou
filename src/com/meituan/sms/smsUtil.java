package com.meituan.sms;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class smsUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String phone = request.getParameter("phone");
		System.out.println(phone);

		String sms = Message.message(phone);
		if(sms == null){
			System.out.println("Ö´ÐÐ³ö´í");
		}
		
		else {
			HttpSession session = request.getSession();
			session.setAttribute("sms", sms);
			session.setMaxInactiveInterval(120);
		}
	}
	

}
