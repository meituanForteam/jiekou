<%@ page language="java" import="java.util.*" pageEncoding="GB18030" contentType="text/html; charset=GB18030"%>
<%@ page import="com.meituan.user.*" %>	
<%
	response.setContentType("text/xml");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Prama","no-cache");
	response.setDateHeader("Expires",0);
	
 %>
<%
	String Phone = request.getParameter("phone");
	if(Phone != null && !Phone.trim().equals("")){
		
		boolean valite = User.checkPhone(Phone);	
		if(valite){
			response.getWriter().write("0");//�ֻ��Ŵ���
			
			return;
			
		}	
			else{
				response.getWriter().write("1");//�û�������
				
				return;
			}
	}
	else{
		response.getWriter().write("-1");//���벻�Ϸ�
		
	}
	
 %>
