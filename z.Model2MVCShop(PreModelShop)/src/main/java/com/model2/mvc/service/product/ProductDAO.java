package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.domain.Product;

public interface ProductDAO {
	
	// INSERT
	public void addProduct(Product product) throws Exception ;
	
	// SELECT ONE
	public Product getProduct(int prodNo) throws Exception ;
	
	// SELECT LIST
	public List<Object> getProductList(Search search) throws Exception ;
	
	// UPDATE
	public void updateProduct(Product product) throws Exception ;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount) return
	public int getTotalCount(Search search) throws Exception ;
	
	// CART LIST
	public List<String> getCartList(String cart) throws Exception ;
	
	// CartCount
	public int getCartCount(String cart) throws Exception ;
}
