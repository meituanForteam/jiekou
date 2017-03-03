package com.meituan.order;

import java.util.List;

import com.meituan.*;

public class OrderManager {
	private static OrderManager om = null;
	public static OrderManager getOm() {
		return om;
	}

	public static void setOm(OrderManager om) {
		OrderManager.om = om;
	}

	
	static {
		if(om == null) {
			om = new OrderManager();
			om.setDao(new OrderMYSQLDAO());
			
		}
	}
	
	
	private OrderManager(){}
	
	public static OrderManager getInstance(){//单例模式 为什么这么用我也不懂 反正就是比较方便
		return om;
		
	}
	OrderMYSQLDAO dao = null;
	public OrderMYSQLDAO getDao() {
		return dao;
	}

	public void setDao(OrderMYSQLDAO dao) {
		this.dao = dao;
	}
	public void saveOrder(SaleOrder so){
		dao.saveOrder(so);
	}
	public List<SaleOrder> getOrders(List<SaleOrder> list, int uid){
		return dao.getOrders(list,uid);
	}
	
}
