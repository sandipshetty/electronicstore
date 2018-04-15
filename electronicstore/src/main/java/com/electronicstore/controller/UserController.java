package com.electronicstore.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.electronicbackend.dao.AddressDAO;
import com.electronicbackend.dao.CartDAO;
import com.electronicbackend.dao.CategoryDAO;
import com.electronicbackend.dao.ProductDAO;
import com.electronicbackend.dao.UserDAO;
import com.electronicbackend.dto.Address;
import com.electronicbackend.dto.Cart;
import com.electronicbackend.dto.Category;
import com.electronicbackend.dto.Product;
import com.electronicbackend.dto.User;

@Controller
public class UserController {

	@Autowired
	CartDAO cartDAO;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	AddressDAO addressDAO;

	@RequestMapping(value = { "/user/cart" })
	public ModelAndView cart(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Cart");
		mv.addObject("userClickCart", true);

		// getting cart userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		// getting cart details
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();

		// getting product details
		List<Integer> p = new ArrayList<Integer>();
		for (Cart c : cart) {
			p.add(c.getProductId());
		}
		List<Product> products = new ArrayList<Product>();
		for (int id : p) {
			products.add(productDAO.getProductById(id));
		}
		mv.addObject("products", products);
		mv.addObject("cartitems", cartitems);
		mv.addObject("cart", cart);
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = { "/user/addtocart" })
	public ModelAndView addToCart(@RequestParam("id") int id, Principal principal) {
		ModelAndView mv = new ModelAndView("redirect:/user/cart");
		// getting product details;
		Product product = productDAO.getProductById(id);
		// getting userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		Cart cart = new Cart();
		cart.setUserId(user.getUserId());
		cart.setProductId(id);
		cart.setQuantity(1);
		cart.setPrice(product.getPrice());
		cartDAO.addToCart(cart);
		return mv;
	}

	@RequestMapping(value = { "/deletecart" })
	public ModelAndView deleteCart(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView("redirect:/user/cart");
		Cart cart = cartDAO.getCartById(id);
		cartDAO.deleteCart(cart);
		return mv;
	}

	@RequestMapping(value = { "/updatecart" })
	public ModelAndView updateCart(@RequestParam("id") int id, @RequestParam("quantity") int quantity,
			@RequestParam("price") int price) {
		ModelAndView mv = new ModelAndView("redirect:/user/cart");
		Cart cart = cartDAO.getCartById(id);
		int cartprice = quantity * price;
		cart.setPrice(cartprice);
		cart.setQuantity(quantity);
		cartDAO.addToCart(cart);
		return mv;
	}

	@RequestMapping(value = { "/user/home" })
	public ModelAndView index(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);
		// passing Product Details
		List<Product> products = productDAO.getActiveProductDetails();
		mv.addObject("products", products);
		// getting cart userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		// getting cart details
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems", cartitems);
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = { "/editprofile" })
	public ModelAndView profile(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Profile");
		mv.addObject("userClickProfile", true);
		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);
		// passing Product Details
		List<Product> products = productDAO.getActiveProductDetails();
		mv.addObject("products", products);
		// getting cart userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		// getting cart details
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems", cartitems);
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = { "/updateuser" })
	public ModelAndView updateUser(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("number") String number,
			@RequestParam("email") String email, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView("redirect:/editprofile");
		User user = userDAO.getUserById(id);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setContactNumber(number);
		user.setEmail(email);
		user.setPassword(password);
		userDAO.updateUser(user);
		return mv;
	}

	@RequestMapping(value = "/user/show/all/products")
	public ModelAndView showAllProducts(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All Products");
		mv.addObject("userClickAllProducts", true);
		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// passing Products details
		List<Product> products = productDAO.getActiveProductDetails();
		mv.addObject("products", products);
		// getting cart userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		// getting cart details
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems", cartitems);
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "user/search/product")
	public ModelAndView showSearchedProducts(Principal principal, @RequestParam("search") String search) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userSearchProduct", true);

		// Passing Category Details
		List<Category> categories = categoryDAO.getActiveCategoryDetails();
		mv.addObject("categories", categories);

		// passing product details
		List<Product> products = productDAO.searchProducts(search);
		mv.addObject("products", products);
		mv.addObject("title", search);
		mv.addObject("search", search);

		// getting cart userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		// getting cart details
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems", cartitems);
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "/user/shippingaddress")
	public ModelAndView shippingAddress(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickBuyNow", true);
		mv.addObject("title", "Shipping Address");
		// getting userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		// getting cart details
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems", cartitems);
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "/user/addAddress")
	public ModelAndView addAddress(Principal principal, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("city") String city,
			@RequestParam("state") String state, @RequestParam("zip") String zip)
	{
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("userClickBuyNow", true);
		mv.addObject("title", "Shipping Address");
		// getting userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);
		
		//Adding address
		Address address=new Address();
		address.setAddress1(address1);
		address.setAddress2(address2);
		address.setCity(city);
		address.setState(state);
		address.setZip(zip);
		address.setUserId(user.getUserId());
		addressDAO.addAddress(address);
		
		// getting cart details
		List<Cart> cart = cartDAO.getCartByUserId(user.getUserId());
		int cartitems = cart.size();
		mv.addObject("cartitems", cartitems);
		mv.addObject("user", user);
		return mv;
	}

}
