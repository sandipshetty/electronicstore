package com.electronicbackend.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.electronicbackend.dto.Address;
import com.electronicbackend.dto.Cart;

@Repository
@Transactional
public class AddressDAO 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public void addAddress(Address address) {
		sessionFactory.getCurrentSession().saveOrUpdate(address);
	}
	
	public void deleteAddress(Address address) {
		sessionFactory.getCurrentSession().delete(address);
	}

	public void updateAddress(Address address) {
		sessionFactory.getCurrentSession().update(address);
	}
	
	public Address getAddressById(int id) {
		return (Address) sessionFactory.getCurrentSession().get(Address.class, id);
	}
	
	public List<Address> getAddressByUserId(int userId)
	{
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Address a where a.userId=:userId");
		query.setParameter("userId", userId);
		List<Address> addresses=query.list();
		session.close();
		return addresses;
	}
	

}
