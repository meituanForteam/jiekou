<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="sessioncheck.jsp"%>
<%@ page import="com.meituan.company.*,com.meituan.user.*" %>
<%
	request.setCharacterEncoding("GBK");
	String strId = (String)session.getAttribute("company");
	int cid = 0;
	List<Category> categories = new ArrayList<Category>();
	if(strId != null && !strId.trim().equals("")){
		cid = Integer.parseInt(strId);
        categories = Category.getCategories(cid);
	}
	
 %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>�����Ϣ</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> ����б�</strong></div>
  <div class="padding border-bottom">  
  <a class="button border-yellow" href="categoryadd.jsp"><span class="icon-plus-square-o"></span> ������</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th>���</th>     
      <th>�������</th>  
      <th>�������</th>     
      <th width="250">����</th>
    </tr>
   
    <%
            Category c = null;
            int i = 1;
        	for(Iterator<Category> it = categories.iterator();it.hasNext();){
        		 c = it.next();
        		
         %>
    
    <tr>
      <td><%=i%></td>
      <td><%=c.getName() %></td>  
      <td><%=c.getDescr() %></td>      
      <td>
      <div class="button-group">
      <a type="button" class="button border-main" href="categorymodify.jsp?categoryid=<%=c.getId()%>"><span class="icon-edit"></span>�޸�</a>
       <a class="button border-red" href="javascript:void(0)" onclick="return del(17)"><span class="icon-trash-o"></span> ɾ��</a>
      </div>
      </td>
    </tr> 
    <%		i++;
    	}
     %>
    <tr>  
    <td colspan="8"><div class="pagelist"> <a href="">��һҳ</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">��һҳ</a><a href="">βҳ</a> </div></td>
  </tr>
  </table>
</div>
<script>
function del(id){
  if(confirm("��ȷ��Ҫɾ����?")){
    	location.href="categorydelete.jsp?categoryid=<%=c.getId()%>"
  }
}
</script>

</body></html>