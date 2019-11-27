package com.niit.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.OrderDAO;
import com.niit.dao.UserDAO;
import com.niit.model.OrderDetail;
import com.niit.model.User;

@Controller
public class UserController {

	@Autowired
	UserDAO userDAO;
	
	@Autowired
	OrderDAO orderDAO;

	@RequestMapping(value = "/login_success")
	public String loginProcess(HttpSession session, Model m) {
		String page = null;
		boolean loggedIn = true;

		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();

		String username = authentication.getName();

		Collection<? extends GrantedAuthority> roles = authentication.getAuthorities(); // Change this if problem with login

		for (GrantedAuthority role : roles) {

			String roleName = role.getAuthority();
			session.setAttribute("loggedIn", loggedIn);
			session.setAttribute("username", username);
			session.setAttribute("role", roleName);

			if (session.getAttribute("isAddingToCart") != null) {
				if (session.getAttribute("isAddingToCart").equals("true")) {
					String productPage = (String) session.getAttribute("linkToProduct");
					m.addAttribute("redirectPage", productPage);
					page = "LoginRedirect";
				}
			}else if (roleName.equals("ROLE_USER")) {
				page = "UserHome";
			} else {
				List<OrderDetail> orderList = orderDAO.retrieveOrderDetails();
				m.addAttribute("orderList", orderList);
				long calculateTotalSales = calculateTotalSales(orderList);
				m.addAttribute("totalSalesAmount", calculateTotalSales);
				long netSaleAmount = (long) (calculateTotalSales - (calculateTotalSales * 0.3));
				m.addAttribute("netTotalSaleAmount", netSaleAmount);
				page = "AdminHome";
			}
		}
		return page;
	}

	@RequestMapping("/perform_logout")
	public String loggingOut(HttpSession session, Model m) {
		session.invalidate();
		m.addAttribute("errorInfo", "Successfully Logged Out");
		return "Login";
	}

	@PostMapping("/registerUser")
	public String registerUser(@ModelAttribute("user") @Valid User user, BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "Register";
		} else {
			if (userDAO.getUser(user.getUserName()) == null) {
				m.addAttribute("registerationMessage", "Your account was registered successfully");
				userDAO.registerUser(user);
			} else {
				m.addAttribute("registerationMessage", "Username already exists. Try logging in.");
			}
			return "Login";
		}
	}
	
	public long calculateTotalSales(List<OrderDetail> orderDetail) {
		long totalPrice = 0;
		
		for(int i = 0; i < orderDetail.size(); i++) {
			totalPrice += orderDetail.get(i).getTotalShoppingAmount();
		}
		
		return totalPrice;
	}

}