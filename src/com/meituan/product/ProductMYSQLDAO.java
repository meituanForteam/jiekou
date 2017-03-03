package com.meituan.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.meituan.user.Category;
import com.meituan.util.DB;

public class ProductMYSQLDAO implements ProductDAO{
	
	
	/*
	 * 获得所有商品
	 */
	public List<Product> getProducts(){
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product ";
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				p.setCid(rs.getInt("cid"));
				list.add(p);
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
			
		}
		return list;
	}
	/*
	 * 分页功能
	 */
	public List<Product> getProducts(int pageNo, int pageSize){
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product limit " + (pageNo - 1)*pageSize + "," + pageSize;
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				list.add(p);
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
			
		}
		return list;
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
		
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = 0;
		conn = DB.getConn();
		String sql = "select * from product where 1=1 ";
		String strId = "";
		if(categoryid != null && categoryid.length > 0){
			strId += "(";
			for(int i = 0; i < categoryid.length; i++){
				if(i < categoryid.length){
					strId += categoryid[i] + ",";
				}else{
					strId += categoryid[i];
				}
			}
			strId += ")";
			sql += " and category in " + strId;
		}
		if(keyWord != null && !keyWord.trim().equals("")){
			sql += " and name like '%" + keyWord + "%' or descr like '%" + keyWord + "%' ";
		}
		if(lowNormalPrice >= 0){
			sql += " and normalprice > " + lowNormalPrice;
		}
		if(highNormalPrice > 0) {
			sql += " and normalprice < " + highNormalPrice;
		}
		if(lowMemberPrice >= 0) {
			sql += " and memberprice > " + lowMemberPrice;
		}
		if(highMemberPrice >0) {
			sql += " and memberprice < " + highMemberPrice;
		}
		if(startDate != null){
			sql += " and pdate >= '" + new SimpleDateFormat("yyyy-MM-dd").format(startDate) + "'";
		}
		if(endDate != null){
			sql += " and pdate <= '" + new SimpleDateFormat("yyyy-MM-dd").format(endDate) + "'";
		}
		
		String sqlCount = sql.replaceFirst("select \\*", "select count(*)");//加两个反斜杠是因为在此函数中MYsql会把*当作正则表达式
		
		sql += " limit " + (pageNo - 1)*pageSize + "," + pageSize;
		
		try {
			rsCount = DB.executeQuery(conn, sqlCount);
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			//String sql = "select * from product limit " + (pageNo - 1)*pageSize + "," + pageSize;
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				list.add(p);
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		finally{
			DB.closeRs(rs);
			DB.closeRs(rsCount);
			DB.closeConn(conn);
			
		}
		return pageCount;

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
	public static boolean deleteProductsByCategoryId(int categoryid){
		return false;
	}
	/**
	 * 更新产品
	 * return true or false
	 */
	public boolean updateProducts(Product p){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			String sql = "update product set name = ?, descr = ?, normalprice = ?, memberprice = ?, categoryid = ? where id = ?";
			pstmt = DB.getPstmt(conn, sql);
			
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormalprice());
			pstmt.setDouble(4, p.getMemberprice());
			pstmt.setInt(5,p.getCategoryid());
			pstmt.setInt(6,p.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			DB.closepStmt(pstmt);
			DB.closeConn(conn);
			  
		}
		return true;
	}
	@Override
	public boolean deleteProductsById(int id) {
		Connection conn = null;
		
		try {
			conn = DB.getConn();
			String sql = "delete from product where id = " + id;
			DB.executeUpdate(conn, sql);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			DB.closeConn(conn);
		}
		return true;
	}
	public boolean addProduct(Product p){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			String sql = "insert into product values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = DB.getPstmt(conn, sql);
			
			pstmt.setString(1,p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3,p.getNormalprice());
			pstmt.setDouble(4,p.getMemberprice());
			pstmt.setTimestamp(5,p.getPdate());
			pstmt.setInt(6,p.getCategoryid());
			pstmt.setString(7,"");
			pstmt.setInt(8, p.getCid());
			pstmt.setInt(9, p.getClassify());
			pstmt.executeUpdate();
			
		} catch (Exception e) {

			return false;
		}finally{
			DB.closepStmt(pstmt);
			DB.closeConn(conn);
		}
		return true;
		
		
	}
	public int getProducts(List<Product> products, int pageNo, int pageSize,int cid){
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = 0;
		try {
			String sql = "select product.id, product.name, product.descr, product.normalprice, product.memberprice, " + 
			 "product.pdate, product.categoryid, product.imgaddr, product.cid, category.id cateid, category.name cname, category.descr cdescr, "
		   + "category.pcategory, category.pdate cpdate from product join category on (product.categoryid = category.id) where product.cid = " + cid + " order by product.pdate desc limit " + (pageNo - 1)*pageSize + "," + pageSize;;
			
			//String sql = "select * from product where cid = " + cid + " order by pdate desc limit "
			//		   + (pageNo - 1)*pageSize + "," + pageSize;
			conn = DB.getConn();
			System.out.println(sql);
			rsCount = DB.executeQuery(conn, "select count(*) from product ");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize -1) / pageSize;
			rs = DB.executeQuery(conn,sql);
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				p.setCid(rs.getInt("cid"));
				
				Category c = new Category();
				c.setName(rs.getString("cname"));
				p.setCategory(c);
				products.add(p);
				
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		finally{
			DB.closeRs(rs);
			DB.closeRs(rsCount);
			DB.closeConn(conn);
			
		}
		return pageCount;
		
		
	}
	
	
	private Product getProductFromRs(ResultSet rs) {
		Product p = null;
		try {	
			p = new Product();
			p.setId(rs.getInt("id"));
			p.setName(rs.getString("name"));
			p.setDescr(rs.getString("descr"));
			p.setNormalprice(rs.getDouble("normalprice"));
			p.setMemberprice(rs.getDouble("memberprice"));
			p.setPdate(rs.getTimestamp("pdate"));
			p.setCategoryid(rs.getInt("categoryid"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public Product loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		
		Product p = null;

		try {
			String sql = "select product.id, product.name, product.descr, product.normalprice, product.memberprice, " + 
						 "product.pdate, product.categoryid, category.id cid, category.pid cpid, category.name cname, category.descr cdescr, "
					   + "category.isleaf cisleaf, category.grade cgrade from product join category on (product.categoryid = category.id) where product.id = " + id;
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			if (rs.next()) {
				p = getProductFromRs(rs);
				Category c = new Category();
				c.setId(rs.getInt("cid"));
				
				c.setName(rs.getString("cname"));
				c.setDescr(rs.getString("cdescr"));
				
				p.setCategory(c);	
				 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return p;
	}
	/**
	 * 查询最新商品
	 */
	public List<Product> getLatestProducts(int count){
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		try {
			conn = DB.getConn();
			String sql = "select * from product order by pdate desc limit 0," + count;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				
				list.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn );
		}
		
		return list;
	}
	@Override
	
	public Product getProduct(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Product p = null;
		try {
			conn = DB.getConn();
			String sql = "select * from product where id = " + id;
			rs = DB.executeQuery(conn, sql);
			if (rs.next()) {
				p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalprice(rs.getDouble("normalprice"));
				p.setMemberprice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryid(rs.getInt("categoryid"));
				p.setImgAddr(rs.getString("imgaddr"));
				p.setCid(rs.getInt("cid"));
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return p;
	}
}	
	
