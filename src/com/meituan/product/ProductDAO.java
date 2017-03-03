package com.meituan.product;

import java.util.Date;
import java.util.List;

import com.meituan.user.Category;

public interface ProductDAO{
			
	
	/*
	 * 获得商品
	 */
	public List<Product> getProducts();
	/*
	 * 分页功能
	 */
	public List<Product> getProducts(int pageNo, int pageSize);
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
											 int pageSize);
		
	/**
	 * 根据商品名字查找商品
	 */
	public List<Product> findProducts(String name);
	/**
	 * 根据商品id删除商品
	 */
	public boolean deleteProductsById(int id);
	/**
	 * 更新商品
	 */
	public boolean updateProducts(Product p);
	/**
	 * 添加商品
	 */
	public boolean addProduct(Product p);
	public int getProducts(List<Product> product, int pageNo, int pageSize,int cid);
	public Product loadById(int id);
	public List<Product> getLatestProducts(int count);
	public Product getProduct(int id);

	
}
