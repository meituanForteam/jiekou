<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.meituan.user.*" %>
<%@ include file="sessioncheck.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	String strId = request.getParameter("categoryid");
	if(strId != null && !strId.trim().equals("")){
		int id = Integer.parseInt(strId);
		boolean validate = false;
		validate = Category.delete(id);
		if(validate){
			%>
			<center>É¾³ý³É¹¦!</center>
			<%
			response.sendRedirect("categorylist.jsp");
		}
	}
 %>
