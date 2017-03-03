<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%@ include file="sessioncheck.jsp"%>
<%@ page import="com.meituan.company.*,com.meituan.user.*" %>
<%
	request.setCharacterEncoding("GBK");
	String strCId = request.getParameter("categoryid");
	
	int id = 0;
	Category category = new Category();
	if(strCId != null && !strCId.trim().equals("")){
		id = Integer.parseInt(strCId);
		category = Category.getCategory(id);
	}
	String action = request.getParameter("action");
	if(action != null && action.trim().equals("modify")){
		int aId = Integer.parseInt(request.getParameter("id"));//通过提交接受的ID
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");
		
		
		Category c = new Category();
		boolean validate = false;
		c.setName(name);
		c.setDescr(descr);
		c.setId(aId);
		c.setPdate(new Timestamp(System.currentTimeMillis()));
		validate = Category.updateCategory(c);
		if(validate){
			%>
				<center>更新成功</center>
			<%
			out.println(c.getName());
			out.println(c.getDescr());
			out.println(c.getId());
			response.sendRedirect("categorylist.jsp");
		}
		
	}
 %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>

<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改分类</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="categorymodify.jsp">
    <input type="hidden" name="action" value="modify">
 	<input type="hidden" name="id" value=<%=id %>>
      <div class="form-group">
        <div class="label">
          <label>分类标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="name" value="<%=category.getName()%>"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>类别描述：</label>
        </div>
        <div class="field">
          <textarea class="input w50" name="descr" style="height:150px;"><%=category.getDescr()%></textarea>
          <div class="tips"></div>
        </div>
      </div>
     
     
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>