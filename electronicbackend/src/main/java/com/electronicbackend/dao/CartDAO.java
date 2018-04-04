package com.electronicbackend.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.electronicbackend.dto.Cart;
import com.electronicbackend.dto.Category;
import com.electronicbackend.dto.Product;

@Repository
@Transactional

public class CartDAO 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public void addToCart(Cart cart) {
		sessionFactory.getCurrentSession().saveOrUpdate(cart);
	}
	
	public void deleteCart(Cart cart) {
		sessionFactory.getCurrentSession().delete(cart);
	}

	public void updateCart(Cart cart) {
		sessionFactory.getCurrentSession().update(cart);
	}
	
	public Cart getCartById(int id) {
		return (Cart) sessionFactory.getCurrentSession().get(Cart.class, id);
	}
	
	public List<Cart> getCartByUserId(int userId)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Cart c where c.userId=:userId");
		query.setParameter("userId", userId);
		List<Cart> carts=query.list();
		session.close();
		return carts;
	}
	




}
