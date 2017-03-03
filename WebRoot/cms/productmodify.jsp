<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB18030"%>
<%@ page import="com.meituan.user.*,com.meituan.product.*" %>
<%@ include file="sessioncheck.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	String strId = request.getParameter("id");
	Product product = new Product();
	int id = 0;
	List<Category> categories = new ArrayList<Category>();
	if(strId != null && !strId.trim().equals("")){
		id = Integer.parseInt(strId);
		product = ProductManager.getInstance().getProduct(id);//��ȡ���̼ҵ�һ����Ʒ
		categories = Category.getCategories(product.getCid());//��ȡ���̼����еķ���	
	}
	String action = request.getParameter("action");
	if(action != null && action.trim().equals("modify")){
		int pid = Integer.parseInt(request.getParameter("productid")); 
		String name = request.getParameter("name");//��Ʒ����
		String descr = request.getParameter("descr");//��Ʒ����
		double normalPrice = Double.parseDouble(request.getParameter("normalprice"));
		double memberPrice = Double.parseDouble(request.getParameter("memberprice"));
		int categoryId = Integer.parseInt(request.getParameter("categoryid"));
		Product p = new Product();
		p.setId(pid);
		p.setName(name);
		p.setDescr(descr); 
		p.setNormalprice(normalPrice);
		p.setMemberprice(memberPrice);
		p.setPdate(new Timestamp(System.currentTimeMillis()));
		p.setCategoryid(categoryId);
		out.println(p.getId());
		boolean validate = ProductManager.getInstance().updateProducts(p);
		if(validate){
			%>
				<center>�޸ĳɹ�</center>			
			<%
			response.sendRedirect("productlist.jsp");
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>�����Ʒ</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="productmodify.jsp">  
      <input type="hidden" name="action" value="modify">
      <input type="hidden" name="productid" value="<%=id%>">
      
      <div class="form-group">
      
        <div class="label">
          <label>���⣺</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="<%=product.getName() %>" name="name" data-validate="required:���������" />
          <div class="tips"></div>
        </div>
      </div>
      <!--
      <div class="form-group">
        <div class="label">
          <label>ͼƬ��</label>
        </div>
         <div class="field">
          <input type="text" id="url1" name="img" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
          <input type="file" class="button bg-blue margin-left" id="image1" value="+ ����ϴ�"  style="float:left;">
          <div class="tipss">ͼƬ�ߴ磺500*500</div>
        </div>
      </div>     
      -->
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>������⣺</label>
          </div>
          <div class="field">
            <select name="categoryid" class="input w50">
              <option value="">��ѡ�����</option>
        <%
            Category c = new Category();
            
        	for(Iterator<Category> it = categories.iterator();it.hasNext();){
        		 c = it.next();
        		
         %>
              <option value="<%=c.getId()%>"<%=c.getId() == product.getCategoryid() ? "selected" : "" %>><%=c.getName() %></option>
             <%
          		   }
           %>
            </select>
            <div class="tips"></div>
          </div>
        </div>
       
      </if>
      
      <div class="form-group">
        <div class="label">
          <label>���ݣ�</label>
        </div>
        <div class="field">
          <textarea name="descr" class="input" style="height:450px; border:1px solid #ddd;"><%=product.getDescr() %></textarea>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="clear"></div>
      <div class="form-group">
        <div class="label">
          <label>�����ۣ�</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="normalprice" value="<%=product.getNormalprice() %>" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>��Ա�ۣ�</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="memberprice" value="<%=product.getMemberprice()%>" />
        </div>
      </div>
     
       
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> �ύ</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>