<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.meituan.user.*,com.meituan.product.*" %>
<%@ include file="sessioncheck.jsp"%>
<%!
	private static final int PAGE_SIZE = 3;
 %>

<%
	request.setCharacterEncoding("GBK");
	String strId = (String)session.getAttribute("company");
	int cid = Integer.parseInt(strId);
	String strPageNo = request.getParameter("pageno");
	int pageNo = 1;
	if(strPageNo != null) {
		
		try{
			pageNo = Integer.parseInt(strPageNo);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	if(pageNo < 1) pageNo = 1;
					
	List<Product> products = new ArrayList<Product>();		
	int pageCount  = ProductManager.getInstance().getProducts(products,pageNo,PAGE_SIZE,cid);//������е����

	if(pageNo > pageCount) pageNo = pageCount;	
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
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> ��Ʒ�б�</strong> <a href="" style="float:right; display:none;">����ֶ�</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="productadd.jsp"> �����Ʒ</a> </li>
        <li>������</li>
        
        <if condition="$iscid eq 1">
          <li>
            <select name="cid" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
              <option value="">��ѡ�����</option>
             
            </select>
          </li>
        </if>
        <li>
          <input type="text" placeholder="�����������ؼ���" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > ����</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">��Ʒ���</th>
        
        <th>ͼƬ</th>
        <th>����</th>
        <th>�۸�</th>
        <th>��������</th>
        <th width="10%">����ʱ��</th>
        <th width="310">����</th>
      </tr>
      <%	int i = 1;
      		Product p = new Product();
      		for(Iterator<Product> it = products.iterator();it.hasNext();){
      			p = it.next();
       %>
      <volist name="list" id="vo">
        <tr>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />
           <%=i %></td>
          
          <td width="10%"><img src="images/11.jpg" alt="" width="70" height="50" /></td>
          <td><%=p.getName() %></td>
          <td>��<%=p.getNormalprice() %></td>
          <td><%=p.getCategory().getName()%></td>
          <td><%=p.getPdate() %></td>
          <td><div class="button-group"> <a class="button border-main" href="productmodify.jsp?id=<%=p.getId()%>"><span class="icon-edit"></span> �޸�</a> <a class="button border-red" href="productdelete.jsp?id=<%=p.getId()%>" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> ɾ��</a> </div></td>
        </tr>
        </volist>
        <%
        		i++;
        	} 
        %>
     <!--  <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
          ȫѡ </td>
        <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> ɾ��</a> 
         </td>
      </tr>-->
      <tr>
        <td colspan="8"><div class="pagelist"><a href="productlist.jsp?pageno=1">��ҳ</a> &nbsp;&nbsp; <a href="productlist.jsp?pageno=<%=pageCount%>">��һҳ</a> &nbsp;&nbsp;<a href="productlist.jsp?pageno=<%=pageNo + 1%>">��һҳ</a><a href="productlist.jsp?pageno=<%=pageNo - 1%>">βҳ</a> </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//����
function changesearch(){  
    
}

//����ɾ��
function del(id,mid,iscid){
  if(confirm("��ȷ��Ҫɾ����?")){
    
  }
}

//ȫѡ
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
    if (this.checked) {
      this.checked = false;
    }
    else {
      this.checked = true;
    }
  });
})

//����ɾ��
function DelSelect(){
  var Checkbox=false;
   $("input[name='id[]']").each(function(){
    if (this.checked==true) {   
    Checkbox=true;  
    }
  });
  if (Checkbox){
    var t=confirm("��ȷ��Ҫɾ��ѡ�е�������");
    if (t==false) return false;   
    $("#listform").submit();    
  }
  else{
    alert("��ѡ����Ҫɾ��������!");
    return false;
  }
}

//��������
function sorts(){
  var Checkbox=false;
   $("input[name='id[]']").each(function(){
    if (this.checked==true) {   
    Checkbox=true;  
    }
  });
  if (Checkbox){  
    
    $("#listform").submit();    
  }
  else{
    alert("��ѡ��Ҫ����������!");
    return false;
  }
}


//������ҳ��ʾ
function changeishome(o){
  var Checkbox=false;
   $("input[name='id[]']").each(function(){
    if (this.checked==true) {   
    Checkbox=true;  
    }
  });
  if (Checkbox){
    
    $("#listform").submit();  
  }
  else{
    alert("��ѡ��Ҫ����������!");    
  
    return false;
  }
}

//�����Ƽ�
function changeisvouch(o){
  var Checkbox=false;
   $("input[name='id[]']").each(function(){
    if (this.checked==true) {   
    Checkbox=true;  
    }
  });
  if (Checkbox){
    
    
    $("#listform").submit();  
  }
  else{
    alert("��ѡ��Ҫ����������!");  
    
    return false;
  }
}

//�����ö�
function changeistop(o){
  var Checkbox=false;
   $("input[name='id[]']").each(function(){
    if (this.checked==true) {   
    Checkbox=true;  
    }
  });
  if (Checkbox){    
    
    $("#listform").submit();  
  }
  else{
    alert("��ѡ��Ҫ����������!");    
  
    return false;
  }
}


//�����ƶ�
function changecate(o){
  var Checkbox=false;
   $("input[name='id[]']").each(function(){
    if (this.checked==true) {   
    Checkbox=true;  
    }
  });
  if (Checkbox){    
    
    $("#listform").submit();    
  }
  else{
    alert("��ѡ��Ҫ����������!");
    
    return false;
  }
}

//��������
function changecopy(o){
  var Checkbox=false;
   $("input[name='id[]']").each(function(){
    if (this.checked==true) {   
    Checkbox=true;  
    }
  });
  if (Checkbox){  
    var i = 0;
      $("input[name='id[]']").each(function(){
        if (this.checked==true) {
        i++;
      }   
      });
    if(i>1){ 
        alert("ֻ��ѡ��һ����Ϣ!");
      $(o).find("option:first").prop("selected","selected");
    }else{
    
      $("#listform").submit();    
    } 
  }
  else{
    alert("��ѡ��Ҫ���Ƶ�����!");
    $(o).find("option:first").prop("selected","selected");
    return false;
  }
}

</script>
</body>
</html>