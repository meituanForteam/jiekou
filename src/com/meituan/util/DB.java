package com.meituan.util;
import java.sql.*;
public class DB {
	
	
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=130145162");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	public static void closeConn(Connection conn)  {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public static Statement getStmt(Connection conn) {
		Statement stmt = null;
		try{
			stmt = conn.createStatement();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return stmt;
	}
	public static void closeStmt(Statement stmt)  {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public static PreparedStatement getPstmt(Connection conn,String sql){
		PreparedStatement pstmt = null;
		try {
			if(conn != null){
			pstmt = conn.prepareStatement(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstmt;
	}
	public static PreparedStatement getPstmt(Connection conn,String sql,boolean generateKeys){
		PreparedStatement pstmt = null;
		try {
			if(conn != null){
			pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public static void closepStmt(PreparedStatement pStmt)  {
		try {
			if (pStmt != null) {
				pStmt.close();
				pStmt = null;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public static ResultSet executeQuery(Statement stmt,String sql){
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet executeQuery(Connection conn,String sql){
		ResultSet rs = null;
		try {
			rs = conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void closeRs(ResultSet rs)  {
		try {
			if (rs != null) {
				rs.close();
			} 
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public static void executeUpdate(Connection conn, String sql) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
