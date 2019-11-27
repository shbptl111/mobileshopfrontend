package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.OrderDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.OrderDetail;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
public class PageController {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	OrderDAO orderDAO;

	@RequestMapping("/aboutus")
	public String showAboutUsPage(HttpServletResponse response) {
		/*Cookie cookie = new Cookie("SameSite", "MyCookie");
		cookie.setSecure(true);*/
		/*response.setHeader("Set-Cookie", "SEARCH_SAMESITE=CgQIoo4B; HttpOnly; Secure; SameSite=Strict");
		System.out.println(response.getHeader("Set-Cookie"));*/
		return "AboutUs";
	}

	@RequestMapping("/contactus")
	public String showContactUsPage(@CookieValue("JSESSIONID") String cookieValue) {
		System.out.println("JSESSIONID: " + cookieValue);
		return "ContactUs";
	}

	@RequestMapping("/privacypolicy")
	public String showprivacyPolicyPage() {
		return "PrivacyPolicy";
	}

	@RequestMapping("/login")
	public String showLoginPage(Model m) {
		return "Login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegisterPage(Model m) {
		m.addAttribute("user", new User());
		return "Register";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearchResults(@RequestParam("product") String searchProduct, Model m) {
		int count = 0;
		List<Product> listProducts = productDAO.listProducts();
		List<Product> productList = new ArrayList<Product>();

		while (count < listProducts.size()) {

			if (listProducts.get(count).getProductName().toLowerCase().contains(searchProduct.toLowerCase().trim())) {
				productList.add(listProducts.get(count));
			}

			count++;
		}

		String message = "No such product available";
		m.addAttribute("productList", productList);
		m.addAttribute("message", message);
		return "ProductCatalog";
	}

	@RequestMapping(value = "/adminHome")
	public String adminHome(Model m) {
		List<OrderDetail> orderList = orderDAO.retrieveOrderDetails();
		m.addAttribute("orderList", orderList);
		long calculateTotalSales = calculateTotalSales(orderList);
		m.addAttribute("totalSalesAmount", calculateTotalSales);
		long netSaleAmount = (long) (calculateTotalSales - (calculateTotalSales * 0.3));
		m.addAttribute("netTotalSaleAmount", netSaleAmount);
		return "AdminHome";
	}
	
	public long calculateTotalSales(List<OrderDetail> orderDetail) {
		long totalPrice = 0;
		
		for(int i = 0; i < orderDetail.size(); i++) {
			totalPrice += orderDetail.get(i).getTotalShoppingAmount();
		}
		
		return totalPrice;
	}
	
}
