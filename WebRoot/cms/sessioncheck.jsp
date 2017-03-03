<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%
	Object company = session.getAttribute("company");
	if(company == null || company.equals("")){
		response.sendRedirect("login.jsp");
	}
 %>
