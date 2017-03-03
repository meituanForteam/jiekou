package com.meituan.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import com.meituan.user.PasswordNotCorrectException;
import com.meituan.user.User;
import com.meituan.user.UserNotFoundException;
import com.meituan.util.DB;

public class CompanyMYSQLDAO implements CompanyDAO{

	/*
	 * 类别添加
	 * @see com.meituan.company.CompanyDAO#save(com.meituan.company.Company)
	 * return companyid
	 */
	public int save(Company cp) {
		
			Connection conn = DB.getConn();
			String sql = "insert into company values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = DB.getPstmt(conn, sql);
			String idSql = "select * from company ";
			ResultSet rs = null;
			int id = 0;
			try {
				
				pstmt.setString(1, "user" + cp.getCompanyPhone());
				pstmt.setString(2, cp.getCompanyPassword());
				pstmt.setString(3, cp.getCompanyPhone());
				pstmt.setString(4,cp.getCompanyDescr());
				pstmt.setString(5, "");//商铺地址
				pstmt.setTimestamp(6, cp.getCompanyPdate());
				pstmt.setString(7,"");
				pstmt.setString(8,"");
				pstmt.setInt(9,cp.getCompanyClassify());
				pstmt.executeUpdate();
				
				rs = DB.executeQuery(conn, idSql);
				rs.next();
				id = rs.getInt("id");
				
			} catch (SQLException e) {
				e.printStackTrace();
				// TODO: handle exception
			} finally {

				DB.closepStmt(pstmt);
				DB.closeConn(conn);
			}
			return id;
		
	}

	
	public boolean checkCompany(String phone) {
		Connection conn  = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "select * from company where company_phone = '" + phone + "'";
			rs = DB.executeQuery(conn, sql);
			
			if(!rs.next()){
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


	@Override
	public Company checkLogin(String phone, String password){
		Connection conn  = null;
		ResultSet rs = null;
		Company cp = null;
		
		
		try {
			conn = DB.getConn();
			String sql = "select * from company where company_phone = '" + phone + "'"; 
			rs = DB.executeQuery(conn,sql);
			if(!rs.next()){
				return null;
			}else if(!rs.getString("company_password").equals(password)){
				return null;
			}else{
				cp = new Company();
				cp.setId(rs.getInt("id"));
				cp.setCompanyLogname(rs.getString("company_logname"));
				cp.setCompanyPassword(rs.getString("company_password"));
				cp.setCompanyPhone(rs.getString("company_phone"));
				cp.setCompanyDescr(rs.getString("company_descr"));
				cp.setCompanyPdate(rs.getTimestamp("company_pdate"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		return cp;
	}



/**
 *通过商家的id来获取商家的信息
 *return company类型
 */
	public Company loadById(int cid) {
		Connection conn = null;
		ResultSet rs = null;
		Company cp = null;
		
		try {
			conn = DB.getConn();
			String sql = "select * from company where id = " + cid;
			rs = DB.executeQuery(conn, sql);
			if (rs.next()) {
				cp = new Company();
				cp.setId(cid);
				cp.setCompanyPhone(rs.getString("company_phone"));
				cp.setCompanyDescr(rs.getString("company_descr"));
				cp.setCompanyPdate(rs.getTimestamp("company_pdate"));
				cp.setCompanyAddr(rs.getString("company_addr"));
				cp.setCompanyName(rs.getString("company_name"));
				cp.setCompanylocation(rs.getString("company_location"));
				cp.setCompanyClassify(rs.getInt("company_classify"));
				System.out.println(cp.getCompanyDescr());
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
			
		}
		
		return cp;
	}

	
}
