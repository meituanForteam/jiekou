<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.meituan.user.*,com.meituan.product.*" %>
<%@ include file="sessioncheck.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	String strId = request.getParameter("id");
	if(strId != null && !strId.trim().equals("")){
		int id = Integer.parseInt(strId);
		boolean validate = false;
		validate = ProductManager.getInstance().deleteProductsById(id);	
		if(validate){
			%>
			<center>ɾ���ɹ�!</center>
			<%
			response.sendRedirect("productlist.jsp");
		}
	}
 %>
