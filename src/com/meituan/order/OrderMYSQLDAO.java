package com.meituan.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.meituan.cart.Cart;
import com.meituan.cart.CartItem;
import com.meituan.product.Product;
import com.meituan.user.Category;
import com.meituan.user.User;
import com.meituan.util.DB;

public class OrderMYSQLDAO {

	public void saveOrder(SaleOrder so) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsKey = null;
		try {
			
			conn = DB.getConn();
			conn.setAutoCommit(false);
			String sql = "insert into salesorder values (null, ?, ?, ?, ?)";
			pstmt = DB.getPstmt(conn,sql,true);
			
			pstmt.setInt(1,so.getUser().getId());
			pstmt.setString(2,so.getAddr());
			pstmt.setTimestamp(3,so.getoDate());
			pstmt.setInt(4,so.getStatus());
			pstmt.executeUpdate();
			/**
			 * 获取当前订单id --start--
			 */
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			int key = rsKey.getInt(1);
			/**
			 * 获取当前订单id --end--
			 */
			String sqlItem = "insert into salesitem values (null,?,?,?,?,?)";
			pstmt = DB.getPstmt(conn,sqlItem);
			Cart c = so.getCart();//拿到购物车
			List<CartItem> items = c.getItems();//用容器放购物车中的items
			for(int i = 0; i < items.size(); i++){
				CartItem ci = items.get(i);//拿到items中的各项字段
				pstmt.setInt(1,ci.getProductId());
				pstmt.setDouble(2,ci.getPrice());
				pstmt.setInt(3,ci.getCount());
				pstmt.setInt(4,key);
				pstmt.setDouble(5,ci.getTotalPrice());
				pstmt.addBatch();
				
			}
			pstmt.executeBatch();
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
			
			try {
				conn.rollback();
				conn.setAutoCommit(true);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}finally{
			
			DB.closepStmt(pstmt);
			DB.closeRs(rsKey);
			DB.closeConn(conn);
		}
		
		
	}

	public List<SaleOrder> getOrders(List<SaleOrder> list, int uid) {
		Connection conn = null;
		ResultSet rs = null;
		

		try {
			String sql = "select salesorder.id, salesorder.userid, salesorder.addr, salesorder.odate, salesorder.status, user.id uid, user.username, user.password, user.phone, user.addr, user.rdate from salesorder join "
					+ "user on (salesorder.userid = " + uid + " )";
			conn = DB.getConn();
			rs = DB.executeQuery(conn,sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				
				SaleOrder so = new SaleOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setUser(u);
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				list.add(so);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeRs(rs);
			
			DB.closeConn(conn);
		}
		return list;
	}
	
}
