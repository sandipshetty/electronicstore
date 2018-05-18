package com.electronicbackend.dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.electronicbackend.dto.Product;
import com.electronicbackend.dto.User;

@Repository
@Transactional
public class ProductDAO 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public void insertProduct(Product product)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(product);
	}
	
	public void deleteProduct(Product product)
	{
		sessionFactory.getCurrentSession().delete(product);
	}
	public void updateProduct(Product product)
	{
		sessionFactory.getCurrentSession().update(product);
	}
	
	
	public Product getProductById(int id)
	{
		return (Product)sessionFactory.getCurrentSession().get(Product.class, id);
	}
	
	public List<Product> getActiveProductByCategory(int categoryId)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product p where p.categoryId=:categoryId and p.active=:active");
		query.setParameter("categoryId", categoryId);
		query.setParameter("active",true);
		List<Product> products=query.list();
		session.close();
		return products;
	}
	
	public List<Product> getActiveProductDetails()
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product p where p.active=:active");
		query.setParameter("active",true);
		List<Product> list=query.list();
		session.close();
		return list;
	}

	public List<Product> getProductDetails()
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product");
		List<Product> list=query.list();
		session.close();
		return list;
	}
	
	public List<Product> getProductDetailsBySupplierName(String supplierName)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product p where p.supplierName=:supplierName");
		query.setParameter("supplierName",supplierName);
		List<Product> list=query.list();
		session.close();
		return list;
	}


	
	public List<Product> searchProducts(String keyword)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product p where p.productName like ? and p.active=:active");
		query.setString(0,"%"+keyword+"%");
		query.setParameter("active",true);
		List<Product> list=query.list();
		session.close();
		return list;
	}

}
