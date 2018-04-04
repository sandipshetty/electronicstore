package com.electronicstore.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.electronicbackend.dao.CartDAO;
import com.electronicbackend.dao.ProductDAO;
import com.electronicbackend.dao.UserDAO;
import com.electronicbackend.dto.Cart;
import com.electronicbackend.dto.Product;
import com.electronicbackend.dto.User;

@Controller
public class UserController {
	
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = { "/user/cart" })
	public ModelAndView cart(Principal principal) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Cart");
		mv.addObject("userClickCart", true);
		
		//getting cart userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);
		
		//getting cart details
		List<Cart> cart=cartDAO.getCartByUserId(user.getUserId());
		int cartitems=cart.size();
		
		//getting product details
		List<Integer> p=new ArrayList<Integer>();
		for (Cart c : cart) 
		{
			p.add(c.getProductId());
		}
		List<Product> products=new ArrayList<Product>();
		for (int id : p) 
		{
			products.add(productDAO.getProductById(id));
		}
		mv.addObject("products",products);
		mv.addObject("cartitems",cartitems);
		mv.addObject("cart",cart);
		return mv;
	}

	@RequestMapping(value = { "/user/addtocart" })
	public ModelAndView addToCart(@RequestParam("id") int id,Principal principal) {
		ModelAndView mv = new ModelAndView("redirect:/user/cart");
		//getting product details;
		Product product=productDAO.getProductById(id);
		//getting userdetails
		String username = principal.getName();
		User user = userDAO.getUserByUsername(username);

		Cart cart=new Cart();
		cart.setUserId(user.getUserId());
		cart.setProductId(id);
		cart.setQuantity(1);
		cart.setPrice(product.getPrice());
		cartDAO.addToCart(cart);
		return mv;
	}

}
