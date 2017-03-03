package com.meituan.product;

import java.util.Date;
import java.util.List;

import com.meituan.user.Category;

public class ProductManager {
//����ӿڵı��
//�ϸ�ֲ� ���Ʒ�ת DAO��MYSQLDAO ��ORACLEDAO �����Ժ���벻ͬ�����ݿ�
//�Ժ���벻ͬ�����ݿ�ֻ��Ҫ��setdao �����ü���
	private static ProductManager pm = null;
	static {
		if(pm == null) {
			pm = new ProductManager();
			pm.setDao(new ProductMYSQLDAO());
			
		}
	}
	
	
	private ProductManager(){}
	
	public static ProductManager getInstance(){//����ģʽ Ϊʲô��ô����Ҳ���� �������ǱȽϷ���
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
	 * �����Ʒ
	 */
	public List<Product> getProducts(){
		return dao.getProducts();
	}
	/*
	 * ��ҳ����
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
											 int pageSize){
		return dao.findProducts(list,categoryid, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, pageSize);
		
	}
	/**
	 * ������Ʒ���ֲ�����Ʒ
	 */
	public List<Product> findProducts(String name){
		return null;
	}
	/**
	 * ������Ʒidɾ����Ʒ
	 */
	public boolean deleteProductsById(int id){
		return dao.deleteProductsById(id);
	}
	/**
	 * ������Ʒ
	 */
	public boolean updateProducts(Product p){
		return dao.updateProducts(p);
	}
	/**
	 * �����Ʒ
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

