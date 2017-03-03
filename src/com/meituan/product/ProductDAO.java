package com.meituan.product;

import java.util.Date;
import java.util.List;

import com.meituan.user.Category;

public interface ProductDAO{
			
	
	/*
	 * �����Ʒ
	 */
	public List<Product> getProducts();
	/*
	 * ��ҳ����
	 */
	public List<Product> getProducts(int pageNo, int pageSize);
	/*
	 * ������Ʒ
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
	 * ������Ʒ���ֲ�����Ʒ
	 */
	public List<Product> findProducts(String name);
	/**
	 * ������Ʒidɾ����Ʒ
	 */
	public boolean deleteProductsById(int id);
	/**
	 * ������Ʒ
	 */
	public boolean updateProducts(Product p);
	/**
	 * �����Ʒ
	 */
	public boolean addProduct(Product p);
	public int getProducts(List<Product> product, int pageNo, int pageSize,int cid);
	public Product loadById(int id);
	public List<Product> getLatestProducts(int count);
	public Product getProduct(int id);

	
}
