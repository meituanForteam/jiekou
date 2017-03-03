package com.meituan.product;

import java.util.Date;
import java.util.List;

import com.meituan.user.Category;

public class ProductManager {
//面向接口的编程
//严格分层 控制反转 DAO分MYSQLDAO 和ORACLEDAO 方便以后接入不同的数据库
//以后接入不同的数据库只需要在setdao 中设置即可
	private static ProductManager pm = null;
	static {
		if(pm == null) {
			pm = new ProductManager();
			pm.setDao(new ProductMYSQLDAO());
			
		}
	}
	
	
	private ProductManager(){}
	
	public static ProductManager getInstance(){//单例模式 为什么这么用我也不懂 反正就是比较方便
		return pm;
		
	}
	ProductDAO dao = null;
	
	public ProductDAO getDao() {
		return dao;
	}
	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}
	/*
	 * 获得商品
	 */
	public List<Product> getProducts(){
		return dao.getProducts();
	}
	/*
	 * 分页功能
	 */
	public List<Product> getProducts(int pageNo, int pageSize){
		return dao.getProducts(pageNo, pageSize);
	}
	/**
	 * 
	 * @return pageCount
	 */
	public int getProducts(List<Product> product, int pageNo, int pageSize,int cid) {
			return dao.getProducts(product,pageNo,pageSize,cid);
		
	}
	
	
	/*
	 * 搜索商品
	 */
	public int findProducts(List<Product> list,int[] categoryid, 
											 String keyWord, 
											 double lowNormalPrice,
											 double highNormalPrice,
											 double lowMemberPrice, 
											 double highMemberPrice,
											 Date startDate,
											 Date endDate,
											 int pageNo,
											 int pageSize){
		return dao.findProducts(list,categoryid, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, pageSize);
		
	}
	/**
	 * 根据商品名字查找商品
	 */
	public List<Product> findProducts(String name){
		return null;
	}
	/**
	 * 根据商品id删除商品
	 */
	public boolean deleteProductsById(int id){
		return dao.deleteProductsById(id);
	}
	/**
	 * 更新商品
	 */
	public boolean updateProducts(Product p){
		return dao.updateProducts(p);
	}
	/**
	 * 添加商品
	 * @param p
	 * @return
	 */
	public boolean addProduct(Product p){
		return dao.addProduct(p);
	}
	public Product loadById(int id){
		return dao.loadById(id);
	}
	public List<Product> getLatestProducts(int count){
		return dao.getLatestProducts(count);
	}
	/**
	 * 
	 */
	public Product getProduct(int id){
		return dao.getProduct(id);
	}
	
	  
}

