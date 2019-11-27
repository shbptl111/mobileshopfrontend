package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.SupplierDAO;
import com.niit.model.Supplier;

@Controller
public class SupplierController {
	
	@Autowired
	SupplierDAO supplierDAO;

	@RequestMapping("/supplier")
	public String displaySupplier(Model m) {
		
		List<Supplier> supplierList = supplierDAO.listSupplier();
		
		m.addAttribute("supplierList", supplierList);
		
		return "Supplier";
	}
	
	@RequestMapping("/addSupplier")
	public String addSupplier(@RequestParam("supplierName") String supplierName, @RequestParam("supplierDesc") String supplierDesc, Model m) {
		
		Supplier supplier = new Supplier();
		supplier.setSupplierName(supplierName);
		supplier.setSupplierDesc(supplierDesc);
		supplierDAO.addSupplier(supplier);
		
		List<Supplier> supplierList = supplierDAO.listSupplier();
		
		m.addAttribute("supplierList", supplierList);
		
		return "Supplier";
	}
	
	@RequestMapping(value = "/deleteSupplier/{supplierId}")
	public String deleteCategory(@PathVariable("supplierId") int supplierId, Model m) {
		System.out.println(supplierId);
		
		Supplier supplier = supplierDAO.getSupplier(supplierId);
		supplierDAO.deleteSupplier(supplier);

		List<Supplier> supplierList = supplierDAO.listSupplier();
		m.addAttribute("supplierList", supplierList);

		return "Supplier";
	}
	
}
