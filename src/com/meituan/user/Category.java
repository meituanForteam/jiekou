package com.meituan.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Category {
	int id;
	String name;
	String descr;
	int cid;
	String pCategory;
	Timestamp pdate;
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
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
	
	/*
	 * 添加类别接口1
	 */
	public static void add(Category c){
		CategoryDAO.save(c);
	}
	/*
	 * 添加类别接口2
	 */
	public static void addTopCategory(String name, String descr){
		Category c = new Category();
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		
		CategoryDAO.save(c);
	}
	
	public static void addChildCategory(int pid, String name, String descr){
		CategoryDAO.addChildCategory(pid,name,descr);
		
	}
	public static List<Category> getCategories(int cid){
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list,cid); 
		return list;
	}
	public static boolean delete(int id){
		return CategoryDAO.delete(id);
	}
	public static Category loadById(int id){
		return CategoryDAO.loadById(id);	
	}
	public static boolean isLeaf(int id){
		return CategoryDAO.isLeaf(id);
	}
	public static boolean updateCategory(Category c){
		return CategoryDAO.updateCategory(c);
	}
	public static Category getCategory(int id){
		return CategoryDAO.getCategory(id);
	}
}
