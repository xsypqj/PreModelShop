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
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.domain.Purchase;
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
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class PurchaseServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	//@Test
	public void getPurchaseTest() throws Exception{

		System.out.println(purchaseService.getPurchase(10021));
	}
	
	//@Test
	public void getTotalCountTest() throws Exception{
		
		System.out.println(purchaseService.getTotalCount("user17"));	
	}
	
	//@Test
	public void updatePurchaseTest() throws Exception{
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		purchase.setPaymentOption("2");
		purchase.setReceiverName("ȫ�浿");
		purchase.setReceiverPhone("010-1234-4321");
		purchase.setDlvyAddr("�׽�Ʈ���ּ�");
		purchase.setDlvyRequest("�׽�Ʈ���Դϴ�.");
		purchase.setTranCode("2");
		purchase.setDlvyDate("20191105");
		purchase.setTranNo(10021);
		purchaseService.updatePurcahse(purchase);
	}
	
	//@Test
	public void updateTranCodeTest() throws Exception{
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();

		//purchase.setTranNo();
		//purchase.setTranCode();
		purchaseService.updateTranCode(purchase);
	}
	
	//@Test
	public void updateTranCodeByProdTest() throws Exception{
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		
		//product.setProdNo();
		//purchase.setTranCode();
		purchase.setPurchaseProd(product);
		
		purchaseService.updateTranCode(purchase);
	}

	//@Test
	public void getPurchaseListTest() throws Exception{
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		
		Search search = new Search();
		String buyerId = "";
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String,Object> map = purchaseService.getPurchaseList(search, buyerId);
		List<Purchase> list = (List<Purchase>) map.get("list");
		
		System.out.println(list.get(0));
		System.out.println("\n");
		System.out.println(list.get(1));
		System.out.println("\n");
		System.out.println(list.get(2));

	}		
	
	//@Test
	public void addPurchaseTest() throws Exception{
		//addPurchaseTest and setFlagTest
		Purchase purchase = new Purchase();
		Product product = new Product();
		User user = new User();
		
		user.setUserId("user16");
		product.setProdNo(10003);
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		purchase.setPaymentOption("1");
		purchase.setReceiverName("SCOTT");
		purchase.setReceiverPhone("01000000000");
		purchase.setDlvyAddr("�̼����� ��°�");
		purchase.setDlvyRequest("�̼����� �ּ���");
		purchase.setDlvyDate("20191105");
		
		purchaseService.addPurchase(purchase);
	}
	
	
}
	
	
		
	
