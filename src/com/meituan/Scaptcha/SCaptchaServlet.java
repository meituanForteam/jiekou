package com.meituan.Scaptcha;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SCaptchaServlet
 */


public class SCaptchaServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  
  
    @Override  
    protected void doGet(HttpServletRequest reqeust,  
            HttpServletResponse response) throws ServletException, IOException {  
        this.doPost(reqeust, response);  
    }  
  
    protected void doPost(HttpServletRequest reqeust,  
            HttpServletResponse response) throws ServletException, IOException {  
        // 设置响应类型格式为 图片格式  
        response.setContentType("image/jpeg");  
        // 禁止图像缓存。  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        SCaptcha instance = new SCaptcha();  
        HttpSession session = reqeust.getSession();
        session.setAttribute("scaptcha",instance.getCode());
        instance.write(response.getOutputStream());  
    }  
}  
