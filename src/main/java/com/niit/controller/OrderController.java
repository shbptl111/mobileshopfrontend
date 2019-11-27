package com.niit.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.CartDAO;
import com.niit.dao.OrderDAO;
import com.niit.dao.UserDAO;
import com.niit.model.CartItem;
import com.niit.model.OrderDetail;
import com.niit.model.User;

@Controller
public class OrderController {

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	JavaMailSender mailSenderObj;

	@RequestMapping("/payment")
	public String showPaymentPage(Model m) {
		m.addAttribute("orderDetail", new OrderDetail());
		return "Payment";
	}

	@RequestMapping(value = "/paymentprocess", method = RequestMethod.POST)
	public String paymentProcess(@ModelAttribute("orderDetail") @Valid OrderDetail orderDetail, BindingResult result,
			HttpSession session, Model m) {

		if (result.hasErrors()) {
			return "Payment";
		} else {
			String username = (String) session.getAttribute("username");
			List<CartItem> listCartItems = cartDAO.retrieveCartItems(username);

			orderDetail.setUsername(username);
			orderDetail.setTotalShoppingAmount((int) this.calcGrandTotalValue(listCartItems));

			orderDAO.insertOrderDetail(orderDetail);

			int count = 0;
			CartItem cartItem = new CartItem();

			final String emailSubject = "Order details";
			String emailMessage = "You have purhcased: ";

			while (count < listCartItems.size()) {

				int tempId = listCartItems.get(count).getCartItemId();
				cartItem = cartDAO.getCartItem(tempId);

				cartItem.setPstatus("P");
				cartDAO.updateCartItem(cartItem);
				emailMessage += emailMessage + cartItem.getProductName();
				count++;
			}

			User user = new User();
			user = userDAO.getUser(username);
			final String emailTo = user.getEmailAddress();
			final String emailFrom = "email@example.com";
			final String finalEmailMessage = emailMessage;

			mailSenderObj.send(new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					try {
						MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
						mimeMsgHelperObj.setTo(emailTo);
						mimeMsgHelperObj.setFrom(emailFrom);
						mimeMsgHelperObj.setText(finalEmailMessage);
						mimeMsgHelperObj.setSubject(emailSubject);
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
			});

			return "ThankYou";
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

}
