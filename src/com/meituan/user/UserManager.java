package com.meituan.user;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.meituan.util.DB;

public class UserManager {
	public static List<User> getUser(){
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from user order by id desc ";
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			DB.closeRs(rs);
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
			return list;	
	}
	
	public static void deleteUser(int id) {
		Connection conn = null;
		Statement stmt = null;
		
		
		try {
			String sql = "delete from user where id = " + id;
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
	}
}
