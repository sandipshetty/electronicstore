package com.electronicstore.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.electronicbackend.dao.CartDAO;
import com.electronicbackend.dao.CategoryDAO;
import com.electronicbackend.dao.ProductDAO;
import com.electronicbackend.dao.UserDAO;
import com.electronicbackend.dto.Cart;
import com.electronicbackend.dto.Category;
import com.electronicbackend.dto.Product;
import com.electronicbackend.dto.User;

@Controller
public class PageController {
	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productsDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	UserDAO userDAO;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// getting cart details
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems",cartitems);
		return mv;
	}

	@RequestMapping(value = { "/loginpage" })
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Login");
		mv.addObject("userClickLogin", true);
		return mv;
	}

	@RequestMapping(value = { "/signup" })
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Sign Up");
		mv.addObject("userClickRegister", true);
		return mv;
	}

	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All Products");
		mv.addObject("userClickAllProducts", true);
		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// passing Products details
		List<Product> products = productsDAO.getActiveProductDetails();
		mv.addObject("products", products);
		
		// getting cart details
				String username = principal.getName();
				User user = userDAO.getUserByUsername(username);
				List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
				int cartitems = cart.size();
				mv.addObject("cartitems",cartitems);
				

		return mv;
	}

	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id,Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickCategoryProducts", true);

		Category category = categoryDAO.getCategoryById(id);
		String str = category.getCategoryName();
		String title = str.replaceAll(" ", "");
		;
		mv.addObject("title", title);

		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// passing product details Category wise
		List<Product> products = productsDAO.getActiveProductByCategory(id);
		mv.addObject("products", products);
		
		// getting cart details
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems",cartitems);
		return mv;
	}

	@RequestMapping(value = "/viewproduct/{id}")
	public ModelAndView showSingleProducts(@PathVariable("id") int id,Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickSingleProduct", true);

		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// passing product details
		Product product = productsDAO.getProductById(id);
		mv.addObject("product", product);
		mv.addObject("title", product.getProductName());

		// getting cart details
				String username = principal.getName();
				User user = userDAO.getUserByUsername(username);
				List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
				int cartitems = cart.size();
				mv.addObject("cartitems",cartitems);

		return mv;
	}

	@RequestMapping(value = "/serach/product")
	public ModelAndView showSearchedProducts(@RequestParam("search") String search,Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userSearchProduct", true);

		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// passing product details
		List<Product> products = productsDAO.searchProducts(search);
		mv.addObject("products", products);
		mv.addObject("title", search);
		mv.addObject("search", search);
		
		// getting cart details
				String username = principal.getName();
				User user = userDAO.getUserByUsername(username);
				List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
				int cartitems = cart.size();
				mv.addObject("cartitems",cartitems);

		return mv;
	}

}
