package com.electronicbackend.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.electronicbackend.dto.Category;

@Repository
@Transactional
public class CategoryDAO {

	@Autowired
	SessionFactory sessionFactory;

	public void insertCategory(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
	}

	public void deleteCategory(Category category) {
		sessionFactory.getCurrentSession().delete(category);
	}

	public void updateCategory(Category category) {
		sessionFactory.getCurrentSession().update(category);
	}

	public Category getCategoryById(int id) {
		return (Category) sessionFactory.getCurrentSession().get(Category.class, id);
	}

	public List<Category> getCategoryDetails() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> list = query.list();
		session.close();
		return list;
	}

	public List<Category> getActiveCategoryDetails() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category c where c.active=:active");
		query.setParameter("active", true);
		List<Category> list = query.list();
		session.close();
		return list;
	}

}
