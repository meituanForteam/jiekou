<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.meituan.user.*" %>
<%@ include file="sessioncheck.jsp"%>

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
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> δ�Ӷ���</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> ȫѡ</button>
          <button type="submit" class="button border-red"><span class="icon-trash-o"></span> �����ܵ�</button>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
       <tr>
        <th width="100">���</th>
        <th width="100">��Ʒ��</th>
        <th>��Ʒ����</th>
        <th>�ܼ�</th>
        <th>�绰</th>
        <th>����״̬</th>
        <th>��ע</th>
        <th>��ַ</th>
         <th width="120">�µ�ʱ��</th>
        <th>��������</th>       
      </tr>      
        <tr>
          <td><input type="checkbox" name="id[]" value="1" />
            1</td>
          <td>��ҹ</td>
          <td>13420925611</td>
          <td>564379992@qq.com</td>  
           <td>���������νֵ�</td> 
           <td>13420925611</td>
           
           <td>���������νֵ�</td>           
          <td>����һ�׺�̨UI��ϲ������������֧��лл��</td>
          <td>2016-07-01</td>
          <!----�����ж�״̬�ǽӵ�����δ�ӵ����԰Ѱ�ť�ĳ�ɾ��/�ӵ�-->
          <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(1)"><span class="icon-trash-o"></span> �ܵ�</a> </div></td>
        </tr>
       
        <td colspan="8"><div class="pagelist"> <a href="">��һҳ</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">��һҳ</a><a href="">βҳ</a> </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

function del(id){
	if(confirm("��ȷ��Ҫɾ����?")){
		
	}
}

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
	}
	else{
		alert("��ѡ����Ҫɾ��������!");
		return false;
	}
}

</script>
</body></html>