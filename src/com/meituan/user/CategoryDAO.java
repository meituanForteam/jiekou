package com.meituan.user;
import java.sql.*;
import java.util.List;

import com.meituan.product.Product;
import com.meituan.user.*;
import com.meituan.util.*;

public class CategoryDAO {
	public static void save(Category c){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = DB.getConn();
			String sql = "insert into category values (null, ?, ?, ?, ?, ?)";
			pstmt = DB.getPstmt(conn, sql);
			
			pstmt.setString(1,c.getName());
			pstmt.setString(2,c.getDescr());
			pstmt.setInt(3,c.getCid());
			pstmt.setString(4,c.getpCategory());
			pstmt.setTimestamp(5,c.getPdate());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {

			DB.closepStmt(pstmt);
			DB.closeConn(conn);
		}

	}

	
	public static void getCategories(List<Category> list, int cid) {
		Connection conn = null;
		
		try {
			conn = DB.getConn();
			getCategories(conn,list,cid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DB.closeConn(conn);
		}

		
	}
	
	private static void getCategories(Connection conn,List<Category> list, int cid) {
		
		ResultSet rs = null;
		String sql = "select * from category where cid = " + cid;
		
		try {
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setCid(cid);
				c.setpCategory(rs.getString("pcategory"));
				list.add(c);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {

			DB.closeRs(rs);
			
		}

		
	}

	public static void addChildCategory(int pid, String name, String descr) {
		Connection conn  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = DB.getConn();
			
			conn.setAutoCommit(false);
			rs = DB.executeQuery(conn, "select * from category where id = " + pid);
			rs.next();
			int parentGrade = rs.getInt("grade");
			/**
			 * 更新category
			 */
			String sql = "insert into category values (null, ?, ?, ?, ?, ?)";
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2,name);
			pstmt.setString(3,descr);
			pstmt.setInt(4,0);
			pstmt.setInt(5,parentGrade + 1);
			pstmt.executeUpdate();
			/**
			 * 更新父结点为非叶子结点
			 */
			DB.executeUpdate(conn,"update category set isleaf = 1 where id = " + pid);
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally{
			DB.closepStmt(pstmt);
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		
	}

	public static boolean delete(int id) {
		Connection conn = null;

		try {
			conn = DB.getConn();
			DB.executeUpdate(conn, "delete from category where id = " + id);
		} catch (Exception e) {			
			e.printStackTrace();
			return false;
		}
		finally{
			DB.closeConn(conn);
		}
		return true;
	}

	private static Category getCategoryFromRs(ResultSet rs) {
		Category c = new Category();
		try {
			c.setId(rs.getInt("id"));
			c.setName(rs.getString("name"));
			c.setDescr(rs.getString("descr"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public static Category loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		
		Category c = null;

		try {
			String sql = "select * from product where id = " + id;
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			if (rs.next()) {
				c = getCategoryFromRs(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return c;
	}

	public static boolean isLeaf(int id) {
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select count(*) from category where id = " + id;
			rs = DB.executeQuery(conn, sql);
			rs.next();
			if(rs.getInt("isLeaf") == 0){
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return false;
	}


	public static boolean updateCategory(Category c) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			String sql = "update category set name = ?, descr = ?, pdate = ? where id = ?";
			pstmt = DB.getPstmt(conn, sql);
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setTimestamp(3,c.getPdate());
			pstmt.setInt(4,c.getId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		finally{
			DB.closepStmt(pstmt);
			DB.closeConn(conn);
			
		}
		return true;
	}


	public static Category getCategory(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Category c = null;
		try {
			conn = DB.getConn();
			String sql = "select * from category where id = " + id;
			rs = DB.executeQuery(conn, sql);
			if(rs.next()){
				c = new Category();
				c.setId(id);
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setCid(rs.getInt("cid"));
				c.setpCategory(rs.getString("pcategory"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {

			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return c;
	}
}
