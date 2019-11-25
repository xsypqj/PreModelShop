package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.domain.Product;
import com.model2.mvc.service.product.impl.ProductDAOImpl;
import com.model2.mvc.service.purchase.PurchaseDAO;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.domain.Purchase;
import com.model2.mvc.service.user.domain.User;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {

	///Field
	@Autowired
	@Qualifier("purchaseDAOImpl")
	private PurchaseDAO purchaseDAO;
	public void setPurchaseDAO(PurchaseDAO purchaseDAO) {
		this.purchaseDAO = purchaseDAO;
	}
	
	///Constructor
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public Purchase getPurchase(int tranNo) throws Exception {	
		return purchaseDAO.findPurchase(tranNo);
	}

	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDAO.insertPurchase(purchase);
		purchaseDAO.setFlag(purchase.getPurchaseProd().getProdNo());
	}
	
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		int totalCount = purchaseDAO.getTotalCount(buyerId);
		List<Purchase> list =  purchaseDAO.getPurchaseList(search, buyerId);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("totalCount", totalCount);
		map.put("list", list);
		
		return map;
	}

	public Map<String, Object> getSaleList(Search search) throws Exception {
		return null;
	}

	public void updatePurcahse(Purchase purchase) throws Exception {
		purchaseDAO.updatePurchase(purchase);
	}

	public void updateTranCode(Purchase purchase) throws Exception {
			if(purchase.getTranNo() >= 1) {
				purchaseDAO.updateTranCode(purchase);
			}else if(purchase.getPurchaseProd().getProdNo() > 0) {
				purchaseDAO.updateTranCodeByProd(purchase);
			}
	}

	public int getTotalCount(String buyerId) throws Exception {
		return purchaseDAO.getTotalCount(buyerId);
	}
}//end of class
