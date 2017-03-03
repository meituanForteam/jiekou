package com.meituan.company;

import java.sql.*;

public class Company {
	int id;
	String companyLogname;
	String companyPassword;
	String companyPhone;
	
	String companyDescr;//商铺类型
	String companyAddr;
	Timestamp companyPdate;//商铺注册时间
	String companyName;//商铺名字
	String companylocation;
	int companyClassify;
	
	public String getCompanylocation() {
		return companylocation;
	}
	public void setCompanylocation(String companylocation) {
		this.companylocation = companylocation;
	}
	public int getCompanyClassify() {
		return companyClassify;
	}
	public void setCompanyClassify(int companyClassify) {
		this.companyClassify = companyClassify;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompanyLogname() {
		return companyLogname;
	}
	public void setCompanyLogname(String companyLogname) {
		this.companyLogname = companyLogname;
	}
	public String getCompanyPassword() {
		return companyPassword;
	}
	public void setCompanyPassword(String companyPassword) {
		this.companyPassword = companyPassword;
	}
	public String getCompanyPhone() {
		return companyPhone;
	}
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	
	public String getCompanyDescr() {
		return companyDescr;
	}
	public void setCompanyDescr(String companyDescr) {
		this.companyDescr = companyDescr;
	}
	public String getCompanyAddr() {
		return companyAddr;
	}
	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}
	public Timestamp getCompanyPdate() {
		return companyPdate;
	}
	public void setCompanyPdate(Timestamp companyPdate) {
		this.companyPdate = companyPdate;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
}
