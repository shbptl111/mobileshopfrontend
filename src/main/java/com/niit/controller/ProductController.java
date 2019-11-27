package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class ProductController {

	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	SupplierDAO supplierDAO;

	boolean flag = true;

	@RequestMapping(value = "/product")
	public String showManageProduct(Model m) {
		Product product = new Product();
		m.addAttribute("product", product);

		List<Product> Productlist = productDAO.listProducts();
		m.addAttribute("productList", Productlist);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", this.getCategoryList(categoryList));

		List<Supplier> supplierList = supplierDAO.listSupplier();
		m.addAttribute("supplierList", this.getSupplierList(supplierList));

		flag = true;
		m.addAttribute("flag", flag);

		return "Product";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(HttpSession session, @ModelAttribute("product") Product product,
			@RequestParam("pimage") MultipartFile fileDetail, Model m, BindingResult result) {

		productDAO.addProduct(product);

		// =>Image Uploading Started

		// String imagePath =
		// "C:\\Users\\Fahad\\shoeb-eclipse\\mobilefrontend\\src\\main\\webapp\\WEB-INF\\resources\\images\\";
		String imagePath = session.getServletContext().getRealPath("/resources/images/");
		System.out.println("imagePath: " + imagePath);
		imagePath = imagePath + String.valueOf(product.getProductId()) + ".jpg";

		File myFile = new File(imagePath);

		if (!fileDetail.isEmpty()) {
			try {

				byte[] fileBytes = fileDetail.getBytes();

				FileOutputStream fos = new FileOutputStream(myFile);

				BufferedOutputStream bs = new BufferedOutputStream(fos);

				bs.write(fileBytes);

				bs.close();
			}

			catch (Exception e) {
				m.addAttribute("errorInfo", "Exception Arised:" + e);
			}
		}

		else {

			m.addAttribute("errorInfo", "Error while uploading the Image");

		}

		// =>Image Uploading Completed

		Product product1 = new Product();
		m.addAttribute("product", product1);

		List<Product> productList = productDAO.listProducts();
		m.addAttribute("productList", productList);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", this.getCategoryList(categoryList));

		flag = true;
		m.addAttribute("flag", flag);
		return "Product";
	}

	@RequestMapping(value = "/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable("productId") int productId, Model m) {

		Product product = productDAO.getProduct(productId);

		productDAO.deleteProduct(product);

		Product product1 = new Product();
		m.addAttribute("product", product1);

		List<Product> productList = productDAO.listProducts();
		m.addAttribute("productList", productList);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", this.getCategoryList(categoryList));

		flag = true;
		m.addAttribute("flag", flag);
		return "Product";
	}

	@RequestMapping(value = "/editProduct/{productId}")
	public String editProduct(@PathVariable("productId") int productId, Model m) {

		Product product = productDAO.getProduct(productId);

		m.addAttribute("product", product);

		List<Product> productList = productDAO.listProducts();
		m.addAttribute("productList", productList);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", this.getCategoryList(categoryList));

		flag = false;
		m.addAttribute("flag", flag);
		System.out.println("inside the edit controller");
		return "Product";
	}

	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(HttpSession session, @ModelAttribute("product") Product product,
			@RequestParam("pimage") MultipartFile fileDetail, Model m, BindingResult result) {

		productDAO.updateProduct(product);

		System.out.println("inside the update controller");

		// =>Image Uploading Started

		String imagePath = session.getServletContext().getRealPath("/resources/images/");

		imagePath = imagePath + String.valueOf(product.getProductId()) + ".jpg";

		File myFile = new File(imagePath);

		if (!fileDetail.isEmpty()) {
			try {

				byte[] fileBytes = fileDetail.getBytes();

				FileOutputStream fos = new FileOutputStream(myFile);

				BufferedOutputStream bs = new BufferedOutputStream(fos);

				bs.write(fileBytes);

				bs.close();
			}

			catch (Exception e) {
				m.addAttribute("errorInfo", "Exception Arised:" + e);
			}
		}

		else {

			m.addAttribute("errorInfo", "Error while uploading the Image");

		}

		// =>Image Uploading Completed

		// System.out.println("Product updated");

		// Product product1 = new Product();
		// m.addAttribute("product",product1);

		// m.addAttribute("product", product);

		List<Product> productList = productDAO.listProducts();
		m.addAttribute("productList", productList);

		List<Category> categoryList = categoryDAO.listCategories();
		m.addAttribute("categoryList", this.getCategoryList(categoryList));

		flag = true;
		m.addAttribute("flag", flag);
		return "Product";
	}

	@RequestMapping("/productCatalog")
	public String displayAllProduct(Model m) {
		List<Product> productList = productDAO.listProducts();
		if (productList == null) {
			String message = "No Products Available Currently!";
			m.addAttribute("message", message);
		}
		m.addAttribute("productList", productList);

		return "ProductCatalog";
	}

	@RequestMapping("/productCatalog/lowToHigh")
	public String displayProductLowToHigh(Model m) {

		List<Product> productList = productDAO.listProducts();
		Collections.sort(productList, Product.priceComparator);

		m.addAttribute(productList);
		return "ProductCatalog";
	}

	@RequestMapping("/productCatalog/highToLow")
	public String displayProductHighToLow(Model m) {

		List<Product> productList = productDAO.listProducts();
		Collections.sort(productList, Product.priceComparator.reversed());

		m.addAttribute(productList);
		return "ProductCatalog";
	}

	@RequestMapping("/mobiles")
	public String displayAllMobiles(Model m) {

		List<Product> productList = productDAO.listProductsByCategory(2);

		if (!productList.isEmpty()) {
			m.addAttribute("productList", productList);
		} else {
			m.addAttribute("productList", null);
		}

		m.addAttribute("productList", productList);

		return "ProductCatalog";
	}

	@RequestMapping("/laptops")
	public String displayAllLaptops(Model m) {

		List<Product> productList = productDAO.listProductsByCategory(1);


		if (!productList.isEmpty()) {
			m.addAttribute("productList", productList);
		} else {
			m.addAttribute("productList", null);
		}

		return "ProductCatalog";
	}

	@RequestMapping("/productDisplay/{productId}")
	public String displaySingleProduct(@PathVariable("productId") int productId, Model m) {

		Product product = (Product) productDAO.getProduct(productId);
		m.addAttribute("actualPrice", (product.getPrice() + 1000));
		m.addAttribute("productInfo", product);
		m.addAttribute("categoryName", categoryDAO.getCategory(product.getCategoryId()).getCategoryName());
		return "ProductDisplay";
	}

	public LinkedHashMap<Integer, String> getCategoryList(List<Category> listCategory) {
		LinkedHashMap<Integer, String> categoryData = new LinkedHashMap<Integer, String>();

		int count = 0;
		while (count < listCategory.size()) {
			categoryData.put(listCategory.get(count).getCategoryId(), listCategory.get(count).getCategoryName());
			count++;
		}
		return categoryData;
	}

	public LinkedHashMap<Integer, String> getSupplierList(List<Supplier> listSupplier) {
		LinkedHashMap<Integer, String> supplierData = new LinkedHashMap<Integer, String>();

		int count = 0;
		while (count < listSupplier.size()) {
			supplierData.put(listSupplier.get(count).getSupplierId(), listSupplier.get(count).getSupplierName());
			count++;
		}
		return supplierData;
	}
}
