package com.meituan.company;

import com.meituan.user.PasswordNotCorrectException;
import com.meituan.user.UserNotFoundException;

public interface CompanyDAO {
	public int save(Company cp);
	public boolean checkCompany(String phone);
	public Company checkLogin(String phone, String password);
	public Company loadById(int id);
	
}
