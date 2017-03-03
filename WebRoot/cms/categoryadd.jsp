<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%@ include file="sessioncheck.jsp"%>
<%@ page import="com.meituan.company.*,com.meituan.user.*" %>
<%
	request.setCharacterEncoding("GBK");
	String strId = (String)session.getAttribute("company");
	out.println(strId);
	int cid = 0;
	Company cp = null;
	if(strId != null && !strId.trim().equals("")){
		cid = Integer.parseInt(strId);
        cp = CompanyManager.getInstance().loadById(cid);
	}
	String action = request.getParameter("action");
	if(action != null && action.trim().equals("add")){
		//int aCid = Integer.parseInt(request.getParameter("cid"));//ͨ���ύ��ť�����̼ҵ�id
		String name = request.getParameter("name");//������
		String descr = request.getParameter("descr");//�������
		Category c = new Category();
		c.setName(name);
		c.setDescr(descr); 
		c.setCid(cid);
		c.setpCategory(cp.getCompanyDescr());//���ø������
		c.setPdate(new Timestamp(System.currentTimeMillis()));
		Category.add(c);
		out.println(c.getCid());
		out.println(c.getName());
		out.println(c.getDescr());
		out.println(c.getPdate());
		
		
		%>
		<center>��ӷ���ɹ�</center>
		<%
		response.sendRedirect("categorylist.jsp");
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>��ӷ���</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="categoryadd.jsp">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="cid" value=<%=cid%>>
      <div class="form-group">
        <div class="label">
          <label>�ϼ����ࣺ</label>
        </div>
        <div class="field">
          <select name="pid" class="input w50">
            <option value=""><%=cp.getCompanyDescr() %></option>
            
            
            
          </select>
          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>������⣺</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="name" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>���������</label>
        </div>
        <div class="field">
          <textarea type="text" class="input w50" name="descr" style="height:150px;"></textarea>
          <div class="tips"></div>
        </div>
      </div>
     
     
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> �ύ</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>