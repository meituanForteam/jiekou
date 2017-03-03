<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%
	String user = (String)(session.getAttribute("user"));
	if(user == null || user.trim().equals("")){
		response.sendRedirect("login.jsp");
	}
 %>
