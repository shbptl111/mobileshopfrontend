package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.CartItem;
import com.niit.model.Product;

@Controller
public class CartController {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CartDAO cartDAO;

	@RequestMapping("/cart")
	public String showCart(HttpSession session, Model m) {

		String username = (String) session.getAttribute("username");

		List<CartItem> listCartItems = cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItems", listCartItems);
		m.addAttribute("grandTotal", this.calcGrandTotalValue(listCartItems));

		return "Cart";
	}

	@RequestMapping(value = "/addToCart/{productId}")
	public String addToCart(@PathVariable("productId") int productId, @RequestParam("qty") int quantity,
			HttpSession session, Model m) {

		if (session.getAttribute("username") != null) {

			CartItem cartItem;
			String username = (String) session.getAttribute("username");
			Product product = productDAO.getProduct(productId);

			if (cartDAO.getCartItemIfProductExists(productId, username) != null) {
				cartItem = cartDAO.getCartItemIfProductExists(productId, username);
				cartItem.setQuantity(quantity + cartItem.getQuantity());
				cartItem.setPrice(product.getPrice());
				cartItem.setProductId(product.getProductId());
				cartItem.setProductName(product.getProductName());
				cartItem.setPstatus("NP");
				cartItem.setUsername(username);
				cartDAO.updateCartItem(cartItem);
			} else {
				cartItem = new CartItem();
				cartItem.setProductId(product.getProductId());
				cartItem.setProductName(product.getProductName());
				cartItem.setQuantity(quantity);
				cartItem.setPrice(product.getPrice());
				cartItem.setPstatus("NP");
				cartItem.setUsername(username);
				cartDAO.addCartItem(cartItem);
			}

			List<CartItem> listCartItems = cartDAO.retrieveCartItems(username);

			long calcGrandTotalValue = calcGrandTotalValue(listCartItems);

			m.addAttribute("cartItems", listCartItems);
			m.addAttribute("grandTotal", calcGrandTotalValue);
			return "Cart";
		} else {
			String linkToProduct = "/addToCart/" + productId + "/?qty=" + quantity;
			session.setAttribute("linkToProduct", linkToProduct);
			session.setAttribute("isAddingToCart", "true");
			m.addAttribute("redirectPage", "/login");
			return "LoginRedirect";
		}
	}

	public long calcGrandTotalValue(List<CartItem> listCartItems) {

		int count = 0;
		long grandTotalPrice = 0;

		while (count < listCartItems.size()) {
			grandTotalPrice += (listCartItems.get(count).getQuantity() * listCartItems.get(count).getPrice());
			count++;
		}

		return grandTotalPrice;
	}

	@RequestMapping(value = "/updateCartItem/{cartItemId}")
	public String updateCartItem(@PathVariable("cartItemId") int cartItemId, @RequestParam("qty") int quantity, Model m,
			HttpSession session) {

		CartItem cartItem = cartDAO.getCartItem(cartItemId);
		cartItem.setQuantity(quantity);
		cartDAO.updateCartItem(cartItem);

		String username = (String) session.getAttribute("username");

		List<CartItem> listCartItems = cartDAO.retrieveCartItems(username);

		m.addAttribute("cartItems", cartDAO.retrieveCartItems(username));
		m.addAttribute("grandTotal", this.calcGrandTotalValue(listCartItems));

		return "Cart";
	}

	@RequestMapping(value = "/deleteCartItem/{cartItemId}")
	public String deleteCartItem(@PathVariable("cartItemId") int cartItemId, Model m, HttpSession session) {

		CartItem cartItem = cartDAO.getCartItem(cartItemId);
		cartDAO.deleteCartItem(cartItem);

		String username = (String) session.getAttribute("username");

		List<CartItem> listCartItems = cartDAO.retrieveCartItems(username);

		m.addAttribute("cartItems", cartDAO.retrieveCartItems(username));
		m.addAttribute("grandTotal", this.calcGrandTotalValue(listCartItems));

		return "Cart";
	}

	@RequestMapping("/checkout")
	public String checkOut(HttpSession session, Model m) {

		String username = (String) session.getAttribute("username");

		List<CartItem> listCartItems = cartDAO.retrieveCartItems(username);
		m.addAttribute("cartItems", listCartItems);
		m.addAttribute("grandTotal", this.calcGrandTotalValue(listCartItems));

		return "OrderDetail";
	}
}
