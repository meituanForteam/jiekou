package com.meituan.product;

import java.sql.Timestamp;

import com.meituan.user.Category;

public class Product {
	int id;
	String name;
	String descr;
	double normalprice;
	double memberprice;
	Timestamp pdate;//上货日期
	int categoryid;
	Category category;
	int cid;
	String imgAddr;
	int classify;
	public int getClassify() {
		return classify;
	}
	public void setClassify(int classify) {
		this.classify = classify;
	}
	public String getImgAddr() {
		return imgAddr;
	}
	public void setImgAddr(String imgAddr) {
		this.imgAddr = imgAddr;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public double getNormalprice() {
		return normalprice;
	}
	public void setNormalprice(double normalprice) {
		this.normalprice = normalprice;
	}
	public double getMemberprice() {
		return memberprice;
	}
	public void setMemberprice(double memberprice) {
		this.memberprice = memberprice;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Category getCategory() {
		return category;
	}
	
}
