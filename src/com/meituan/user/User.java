package com.meituan.user;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.meituan.util.DB;

public class User {

	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Date rdate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public void save() {
		Connection conn = DB.getConn();
		String sql = "insert into user values (null, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = DB.getPstmt(conn, sql);
		try {
			pstmt.setString(1, "user" + phone);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, "addr");
			pstmt.setTimestamp(5, new Timestamp(rdate.getTime()));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {

			DB.closepStmt(pstmt);
			DB.closeConn(conn);
		}

	}
	/**
	 * 获取所有用户
	 * 
	 * @return
	 */
	
	public static List<User> getUser() {
		List<User> list = new ArrayList<User>();
		Connection conn  = null;
		ResultSet rs = null;
		
		
		
		try {
			conn = DB.getConn();
			String sql = "select * from user order by desc";
			rs = DB.executeQuery(conn,sql);
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return list;
	}
	
	public static User getUserDetails(String username) {
		
		Connection conn  = null;
		ResultSet rs = null;
		User u = null;
		
		
		try {
			conn = DB.getConn();
			String sql = "select * from user where username = '" + username + "'";
			rs = DB.executeQuery(conn,sql);
			if(rs.next()){
			
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return u;
	}
	
public static User getUserDetail(int id) {
		
		Connection conn  = null;
		ResultSet rs = null;
		User u = null;
		
		
		try {
			conn = DB.getConn();
			String sql = "select * from user where id = " + id;
			rs = DB.executeQuery(conn,sql);
			rs.next();
			u = new User();
			u.setId(rs.getInt("id"));
			u.setUsername(rs.getString("username"));
			u.setPassword(rs.getString("password"));
			u.setPhone(rs.getString("phone"));
			u.setAddr(rs.getString("addr"));
			u.setRdate(rs.getTimestamp("rdate"));
			
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return u;
	}
	/**
	 * 
	 * 检查用户是否存在
	 * @param username
	 * @return
	 */
	public static boolean userExists(String username){
		
		return false;
	}
	/**
	 * 检查密码是否正确
	 * @param username
	 * @param password
	 * @return
	 */
	public static boolean isPasswordCorrect(String username, String password){
		return false;
	}
	
	public static User validate(String phone, String password) throws UserNotFoundException,PasswordNotCorrectException{
		Connection conn  = null;
		ResultSet rs = null;
		User u = null;
		
		
		try {
			conn = DB.getConn();
			String sql = "select * from user where phone = " + phone; 
			rs = DB.executeQuery(conn,sql);
			if(!rs.next()){
				throw new UserNotFoundException();
			}else if(!rs.getString("password").equals(password)){
				throw new PasswordNotCorrectException();
			}else{
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return u;
		
	}
	/**
	 * 更新用户自服务
	 */
	public void update() {
		Connection conn = DB.getConn();
		String sql = "update user set username = ?, phone = ?, addr = ? where id = " + this.id;
		PreparedStatement pstmt = DB.getPstmt(conn, sql);
		try {
			pstmt.setString(1,username);
			pstmt.setString(2,phone);
			pstmt.setString(3,addr);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {

			DB.closepStmt(pstmt);
			DB.closeConn(conn);
		}

	}
	public static boolean checkPhone(String phone){
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "select * from user where phone = " + phone;
			rs = DB.executeQuery(conn, sql);
			if (!rs.next()) {
				return false;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return true;
	}
	
}
