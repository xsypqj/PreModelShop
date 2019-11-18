package com.model2.mvc.service.user.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.domain.Product;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.domain.User;

/*
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	//@Test
	public void testGetProduct() throws Exception {
		System.out.println(productService.getProduct(10001));
	}
	
	
	//@Test
	public void testGetProductList() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(2);
		search.setPageSize(3);
		
		Map<String,Object> map = productService.getProductList(search);
		System.out.println(map.get("list"));
		System.out.println(search.getStartRowNum()+","+search.getEndRowNum());
	}
	
	//@Test
	public void testAddProduct() throws Exception {
		Product product = new Product();
		product.setProdName("�׽�Ʈ2ȣ");
		product.setProdDetail("�׽�Ʈ2ȣ");
		product.setManuDate("20191105");
		product.setPrice(40000);
		product.setFileName("�׽�Ʈ2ȣ");
		
		productService.addProduct(product);
	}
	
	//@Test
	public void testUpdateProduct() throws Exception {
		Product product = new Product();
		
		product.setProdName("�׽�Ʈ��");
		product.setProdDetail("�׽�Ʈ��");
		product.setManuDate("20191105");
		product.setPrice(40000);
		product.setFileName("�׽�Ʈ��");
		
		product.setProdNo(10011);
		
		productService.updateProduct(product);
	}
	
	@Test
	public void testGetCartList() throws Exception{
		Map<String,Object> map = productService.getCartList("10001,10002");
		System.out.println(map.get("list")+"\n");
		System.out.println("totalCount :: "+map.get("totalCount"));
	}
	
	
}