package com.imran.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imran.model.Product;
import com.imran.service.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/product")
	public String index(){
		return "productIndex";
	}
	
	
	@RequestMapping("/list")
	public @ResponseBody Map<String, Object> productIndex(){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Product> results = new ArrayList<Product>();
		results= productService.listProduct();
		map.put("products", results);
		
		return map;
	}
	
	@RequestMapping(value="/product2", method = RequestMethod.GET)
	public ModelAndView listProduct() {
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<Product> results = new ArrayList<Product>();
		results= productService.listProduct();
		model.put("products", results);
		return new ModelAndView("productIndex2", model);
	}

	@RequestMapping("/create")
	public String create(){
		return "create";
	}
	

	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addBook(@ModelAttribute("priduct") Product product, BindingResult result){
		Map<String, Object> map = new HashMap<String, Object>();
		if(product.getProductName() == "" || product.getProductName() == null || product.getDescription()=="" || product.getDescription()==null){
			map.put("successMsg","Require field is empty");
			return map;
		}
		if(product.getId()==null){
			productService.addProduct(product);
			map.put("successMsg","Successfully add Your Product");
		}else{
			map.put("successMsg","Successfully Update Your Product");
			productService.updateProduct(product);
		}
		
		return map;
	}
	
	
	@RequestMapping(value="/delete/{id}")
	public @ResponseBody Map<String, Object> deleteProduct(@PathVariable("id") Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
	    productService.removeProduct(id);
		map.put("successMsg","Successfully Delete Product");
		return map;
	}
	
	@RequestMapping(value="/edit/{id}")
	public @ResponseBody Map<String, Object> edit(@PathVariable("id") Integer id){
		Map<String, Object> map = new HashMap<String, Object>();
		Product product = productService.getProductById(id);
		map.put("product", product);
		System.out.println(product);
		return map;
	}

	

}
