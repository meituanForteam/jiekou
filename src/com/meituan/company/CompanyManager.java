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
	
	public static CompanyManager getInstance(){//单例模式 
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
			 cp.setCompanyDescr("美食");
			 break;
		 case "2" :
			 cp.setCompanyDescr("酒店");
			 break;
		 case "3" :
			 cp.setCompanyDescr("电影");
			 break;
		 case "4" :
			 cp.setCompanyDescr("KTV");
			 break;
		 case "5" :
			 cp.setCompanyDescr("休闲娱乐");
			 break;
		 case "6" :
			 cp.setCompanyDescr("周边游");
			 break;
		 case "7" :
			 cp.setCompanyDescr("生活服务");
			 break;
		 case "8" :
			 cp.setCompanyDescr("购物");
			 break;
		 case "9" :
			 cp.setCompanyDescr("丽人");
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
