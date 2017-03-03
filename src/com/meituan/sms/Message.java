package com.meituan.sms;

import org.omg.CORBA.PUBLIC_MEMBER;
import javax.servlet.*;
import java.util.*;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

import jdk.internal.dynalink.beans.StaticClass;

@SuppressWarnings("unused")
public class Message {
	
	/**
	 * 产生六位随机验证码
	 * @return num
	 */
	public static String getRandom() {
		String num = "";
		for (int i = 0 ; i < 4 ; i ++) {
			num = num + String.valueOf((int) Math.floor(Math.random() * 9 + 1));
		}
			return num;
		}
	
	/**
	 * 短信发送模块
	 * @param phone
	 * @return true or false
	 */
	public static String message(String phone){
		  String rusult = null;
		  String code  = null;
		  code = getRandom();//验证码
		 
		    // 官网的URL
		    String url = "http://gw.api.taobao.com/router/rest";
		    // 成为开发者，创建应用后系统自动生成
		    String appkey = "23616854";
		    String secret = "647b64137bb83fd4ea6be94cecc06cf6";

		    TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		    AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		    req.setExtend("1234");//可以传入会员的ID
		    req.setSmsType("normal");
		    req.setSmsFreeSignName("红岩美团作业");
		    req.setSmsParamString("{\"code\":\""+code +"\"}");//传入随机生成的几个验证码
		    req.setRecNum(phone);//传入会员的手机号
		    req.setSmsTemplateCode("SMS_44285170");
		    try {
		        AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		        System.out.println(rsp.getBody());  
		        rusult = rsp.getSubMsg();
		        
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		      }
		    return code;
	}
}

