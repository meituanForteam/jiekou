package com.meituan.company;

import com.meituan.company.*;
import com.meituan.user.PasswordNotCorrectException;
import com.meituan.user.UserNotFoundException;

public class CompanyManager {
	private static CompanyManager cm = null;
	static {
		if(cm == null) {
			cm = new CompanyManager();
			cm.setDao(new CompanyMYSQLDAO());
			
		}
	}
	
	
	private CompanyManager(){}
	
	public static CompanyManager getInstance(){//����ģʽ 
		return cm;
		
	}
	CompanyDAO dao = null;
	
	public CompanyDAO getDao() {
		return dao;
	}
	public void setDao(CompanyDAO dao) {
		this.dao = dao;
	}
	public int save(Company cp){
		String comCate = cp.getCompanyDescr();
		switch(comCate){
		 case "1" :
			 cp.setCompanyDescr("��ʳ");
			 break;
		 case "2" :
			 cp.setCompanyDescr("�Ƶ�");
			 break;
		 case "3" :
			 cp.setCompanyDescr("��Ӱ");
			 break;
		 case "4" :
			 cp.setCompanyDescr("KTV");
			 break;
		 case "5" :
			 cp.setCompanyDescr("��������");
			 break;
		 case "6" :
			 cp.setCompanyDescr("�ܱ���");
			 break;
		 case "7" :
			 cp.setCompanyDescr("�������");
			 break;
		 case "8" :
			 cp.setCompanyDescr("����");
			 break;
		 case "9" :
			 cp.setCompanyDescr("����");
			 break;
		}
		return dao.save(cp);
	}
	public boolean checkCompany(String phone){
		return dao.checkCompany(phone);
	}
	public Company checkLogin(String phone, String password){
		return dao.checkLogin(phone, password);
	}
	public Company loadById(int cid){
		
		return dao.loadById(cid);
		
	}
}
