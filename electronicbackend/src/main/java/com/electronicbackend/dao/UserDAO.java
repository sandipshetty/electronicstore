package com.electronicbackend.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.electronicbackend.dto.Category;
import com.electronicbackend.dto.User;


@Repository
@Transactional
public class UserDAO 
{

	@Autowired
	SessionFactory sessionFactory;
	
	public void insertUser(User user)
	{
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}
	
	public void deleteUser(User user)
	{
		sessionFactory.getCurrentSession().delete(user);
	}
	
	public User getUserById(int id)
	{
		return (User)sessionFactory.getCurrentSession().get(User.class, id);
	}
	public User getUserByUsername(String username)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from User u where u.username=:username");
		query.setParameter("username", username);
		User user=(User)query.uniqueResult();
		session.close();
		return user;
	}
	public List<User> getUserDetails()
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from User");
		List<User> list=query.list();
		session.close();
		return list;
	}
	public void updateUser(User user)
	{
		sessionFactory.getCurrentSession().update(user);
	}

}
