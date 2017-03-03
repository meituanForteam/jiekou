<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.meituan.company.*" %>
<%
	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");
	if(action != null && action.trim().equals("cms")){
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		Company cp = null;
		cp = CompanyManager.getInstance().checkLogin(phone, password);
		if(cp.getCompanyPhone() == null){
			out.println("<script>alert('”√ªß√˚ªÚ√‹¬Î¥ÌŒÛ')</script>");
			return;
		}
		
		else{
			String strId = String.valueOf(cp.getId());
			session.setAttribute("company",strId);
			session.setMaxInactiveInterval(3600);
			response.sendRedirect("index.jsp?id=" + cp.getId());
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
    <title>µ«¬º</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="login.jsp" method="post">
            <input type="hidden" name="action" value="cms">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>∫ÛÃ®π‹¿Ì÷––ƒ</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="phone" placeholder="µ«¬º’À∫≈" data-validate="required:«ÎÃÓ–¥’À∫≈" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="µ«¬º√‹¬Î" data-validate="required:«ÎÃÓ–¥√‹¬Î" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                   
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="µ«¬º"></div>
            </div>
            </form>          
        </div>
    </div>
</div>

</body>
</html>