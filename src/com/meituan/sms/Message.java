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
	 * ������λ�����֤��
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
	 * ���ŷ���ģ��
	 * @param phone
	 * @return true or false
	 */
	public static String message(String phone){
		  String rusult = null;
		  String code  = null;
		  code = getRandom();//��֤��
		 
		    // ������URL
		    String url = "http://gw.api.taobao.com/router/rest";
		    // ��Ϊ�����ߣ�����Ӧ�ú�ϵͳ�Զ�����
		    String appkey = "23616854";
		    String secret = "647b64137bb83fd4ea6be94cecc06cf6";

		    TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		    AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		    req.setExtend("1234");//���Դ����Ա��ID
		    req.setSmsType("normal");
		    req.setSmsFreeSignName("����������ҵ");
		    req.setSmsParamString("{\"code\":\""+code +"\"}");//����������ɵļ�����֤��
		    req.setRecNum(phone);//�����Ա���ֻ���
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

