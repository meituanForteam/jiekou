<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB18030"%>
<%@ page import="com.meituan.user.*,com.meituan.product.*,com.meituan.company.*" %>
<%@ include file="sessioncheck.jsp"%>

<%
	request.setCharacterEncoding("GBK");
	String strId = (String)session.getAttribute("company");
	
	int cid = 0;
	List<Category> categories = new ArrayList<Category>();
	if(strId != null && !strId.trim().equals("")){
		cid = Integer.parseInt(strId);
        categories = Category.getCategories(cid);
	}
	String action = request.getParameter("action");
	if(action != null && action.trim().equals("add")){
		int aCid = Integer.parseInt(request.getParameter("id"));//通过提交按钮传递商家的id
		
		String name = request.getParameter("name");//商品标题
		String descr = request.getParameter("descr");//商品描述
		double normalPrice = Double.parseDouble(request.getParameter("normalprice"));
		double memberPrice = Double.parseDouble(request.getParameter("memberprice"));
		int categoryId = Integer.parseInt(request.getParameter("categoryid"));
		Company c = new Company();
		c = CompanyManager.getInstance().loadById(aCid);

		Product p = new Product();
		p.setName(name);
		p.setDescr(descr); 
		p.setNormalprice(normalPrice);
		p.setMemberprice(memberPrice);
		p.setPdate(new Timestamp(System.currentTimeMillis()));
		p.setCategoryid(categoryId);
		p.setClassify(c.getCompanyClassify());
		p.setCid(aCid);
		boolean validate = false;
		validate = ProductManager.getInstance().addProduct(p);
		if(validate){
			%>
				<center>添加商品成功</center>
			<% 
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
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加商品</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="productadd.jsp">  
    	<input type="hidden" name="action" value="add">
    	<input type="hidden" name="id" value="<%=cid%>">
      <div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="name" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
    <!--   <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
       
        <div class="field">
          <input type="text" id="url1" name="img" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
          <input type="file" class="button bg-blue margin-left" id="image1" value="浏览上传"  style="float:left;">
          <div class="tipss">图片尺寸：500*500</div>
        </div>
      </div>     
      -->
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>分类标题：</label>
          </div>
          <div class="field">
            <select name="categoryid" class="input w50">
              <option value="">请选择分类</option>
              <%
              		for(Iterator<Category> it = categories.iterator();it.hasNext();){
              			Category c = it.next();
               %>
              <option value="<%=c.getId()%>"><%=c.getName() %></option>
             <%} %>
            </select>
            <div class="tips"></div>
          </div>
        </div>
       
      </if>
      
      <div class="form-group">
        <div class="label">
          <label>内容：</label>
        </div>
        <div class="field">
          <textarea name="descr" class="input" style="height:450px; border:1px solid #ddd;"></textarea>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label>正常价：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="normalprice" value="" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>会员价：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="memberprice" value=""/>
        </div>
      </div>
      
     
       
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>