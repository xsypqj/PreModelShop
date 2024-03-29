package com.model2.mvc.web.product;

import java.io.BufferedReader;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.naming.Reference;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.SearchCounter;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.domain.Product;
import com.model2.mvc.service.transfer.domain.Transfer;
import com.model2.mvc.service.user.domain.User;

import jdk.internal.org.objectweb.asm.TypeReference;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//Constructor
	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/listProduct", method=RequestMethod.POST )
	public Map listProduct(@RequestBody Search search) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		Page resultPage = new Page();
		int totalCount = 0;
		System.out.println("json/listProduct : POST");
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(30);
		map = productService.getProductList(search);
		totalCount = (Integer)map.get("totalCount");
		resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, 30);
		
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		map.put("menu", search.getMenu());
		
		return map;
	}//end of listProduct
	
	@RequestMapping( value="json/getProduct", method=RequestMethod.POST )
	public Map getProduct(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("getProduct : POST");
		
		//request에서 JSON 받아서 codehaus로 Binding // @RequestBody 써도 되지만 그냥 한번 해봄...
		ObjectMapper objectMapper = new ObjectMapper();
		BufferedReader br = request.getReader();
		String jsonData = br.readLine();
		JSONObject jsonObject = (JSONObject)JSONValue.parse(jsonData);
		Map<String,String> jsonMap = objectMapper.readValue(jsonObject.toString(), Map.class);
		Map<String,Object> map = new HashMap<String,Object>();
		Product product = new Product();
		String value = "";
		Cookie cookie = null;
		
		//Business Logic
		product = productService.getProduct(Integer.parseInt(jsonMap.get("prodNo")));
		
		
		// Cookie + 최근 본 상품
		if(request.getCookies() != null) {
			for(int i=0; i<request.getCookies().length; i++) {
				if(request.getCookies()[i].getName().equals("history")) {
					value += request.getCookies()[i].getValue();
				}
			}
		}
		cookie = new Cookie("history",jsonMap.get("prodNo")+","+value);
		response.addCookie(cookie);
		
		// Counter + 추가기능
		if(jsonMap.get("menu") != null && jsonMap.get("menu").equals("search")) {		
			SearchCounter.getSearchCounter().setCountMap(Integer.parseInt(jsonMap.get("prodNo")),product.getProdName());		
			request.getServletContext().setAttribute("lankList", SearchCounter.getSearchCounter().getLankList());
			request.getServletContext().setAttribute("lankProdNameList", SearchCounter.getSearchCounter().getLankProdNameList());	
		}
		map.put("work", jsonMap.get("work"));
		map.put("product", product);
		map.put("menu", jsonMap.get("menu"));
		map.put("imageFile",product.getFileName());
		
		return map;
	}//end of getProduct
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
	public Map updateProduct(@RequestBody Product product, HttpServletRequest request) throws Exception {
		//Field
		Map<String,Object> map = new HashMap<String,Object>();
		String[] getManuDate = null;
		String manuDate = "";
		String menu = "";
		Product resultProduct = new Product();
		
		//Business Logic
		if(product.getManuDate().length() > 8) {		
			getManuDate = (product.getManuDate()).split("-");	
			for(int i=0; i<getManuDate.length; i++) {
				 manuDate += getManuDate[i]; 
				 product.setManuDate(manuDate);
			}
			map.put("manuDate", manuDate);
		}
		
		productService.updateProduct(product);
				
		if(request.getParameter("manage")!=null) {
			menu = "manage";
			map.put("work","0");
		}
		resultProduct = productService.getProduct(product.getProdNo());
		
		map.put("product", product);
		map.put("menu", request.getAttribute("menu"));
		map.put("imageFile",product.getFileName());
		return map;
	}//end of updateProduct
	
	
}
