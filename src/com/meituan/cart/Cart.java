package com.meituan.cart;

import java.util.ArrayList;
import java.util.List;

//购物车
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
			CartItem ci = items.get(i);//ci是购物车中本有的项
//			if(ci.getProductId() == item.getProductId()){//如果商品属于同一个则自动在数量上+1
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
