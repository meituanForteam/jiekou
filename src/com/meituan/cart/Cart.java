package com.meituan.cart;

import java.util.ArrayList;
import java.util.List;

//���ﳵ
public class Cart {
	private List<CartItem> items = new ArrayList<CartItem>();
	public void setItems(List<CartItem> items){
		this.items = items;
	}
	public List<CartItem> getItems(){
		return items;
	}
	public void add(CartItem item){
		for(int i = 0; i < items.size(); i++){
			CartItem ci = items.get(i);//ci�ǹ��ﳵ�б��е���
//			if(ci.getProductId() == item.getProductId()){//�����Ʒ����ͬһ�����Զ���������+1
//				ci.setCount(ci.getCount() + 1);
//				return;
//			}
		}
		items.add(item);
	}
	public static double getTotalPrice(double price, int count){
		double totalPrice = 0.0;
		totalPrice = price * count;
		return totalPrice;
		
	}
}
