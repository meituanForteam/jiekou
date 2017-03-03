package com.meituan.order;

import java.sql.Timestamp;

import com.meituan.cart.Cart;
import com.meituan.user.User;

public class SaleOrder {
	int id;
	User user;
	Timestamp oDate;
	String addr;
	Cart cart;
	int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Timestamp getoDate() {
		return oDate;
	}
	public void setoDate(Timestamp oDate) {
		this.oDate = oDate;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public void save(){
		OrderManager.getInstance().saveOrder(this);
	}
}
