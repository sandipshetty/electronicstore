package com.electronicstore.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.electronicbackend.dao.CategoryDAO;
import com.electronicbackend.dao.ProductDAO;
import com.electronicbackend.dao.UserDAO;
import com.electronicbackend.dto.Category;
import com.electronicbackend.dto.Product;
import com.electronicbackend.dto.User;

@Controller
public class ProductController {

	@Autowired
	ProductDAO productDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping(value = { "/supplier/manage/products" })
	public ModelAndView manageProducts(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Manage Products");
		mv.addObject("userClickManageProducts", true);
		// passing product model
		Product product = new Product();
		mv.addObject("product", product);

		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// passing supplier details
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		// passing all the product Details
		List<Product> products = productDAO.getProductDetailsByUserId(user.getUserId());
		mv.addObject("products", products);
		return mv;
	}

	@RequestMapping(value = { "/add/product" })
	public ModelAndView manageProducts(@ModelAttribute("product") Product product, Principal principal) {
		ModelAndView mv = new ModelAndView("redirect:/supplier/manage/products");
		mv.addObject("title", "Manage Products");
		mv.addObject("userClickManageProducts", true);
		// passing supplier details
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);
		product.setUserId(user.getUserId());

		product.setActive(true);
		productDAO.insertProduct(product);

		// Multipart File Upload
		String path = "C:\\Users\\Adminstrator\\Documents\\sandip\\project\\electronicstore\\src\\main\\webapp\\assets\\productimages\\";
		path = path + "" + product.getProductId() + ".jpg";
		System.out.println("Image Path is:" + path);
		try {
			File f = new File(path);
			MultipartFile m = product.getImage();
			byte[] b = m.getBytes();
			FileOutputStream fos = new FileOutputStream(f);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			bos.write(b);
			bos.close();
		} catch (Exception e) {
			System.out.println("ERROR WHILE IMAGE INPUT");
		}
		// End Multipart File Upload

		System.out.println(product.getProductName());
		return mv;
	}

	@RequestMapping(value = { "/supplier/manage/activateproduct//{id}" }, method = RequestMethod.POST)
	@ResponseBody
	public String activateProduct(@PathVariable("id") int id) {

		Product product = productDAO.getProductById(id);
		boolean active = product.isActive();
		product.setActive(!active);
		productDAO.updateProduct(product);
		return (active) ? "You have sucessfully deactivated the Product" : "You have sucessfully activated the Product";

	}

	@RequestMapping(value = { "/deleteproduct" })
	public ModelAndView deleteProduct(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView("redirect:/supplier/manage/products");
		Product product = productDAO.getProductById(id);
		productDAO.deleteProduct(product);
		return mv;
	}

	@RequestMapping(value = { "/updateproduct" })
	public ModelAndView updateProduct(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Manage Products");
		mv.addObject("userClickManageProducts", true);
		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		Product product = productDAO.getProductById(id);
		mv.addObject("product", product);
		return mv;
	}

}
