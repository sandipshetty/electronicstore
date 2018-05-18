package com.electronicbackend.config;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.electronicbackend.dto.Address;
import com.electronicbackend.dto.Cart;
import com.electronicbackend.dto.Category;
import com.electronicbackend.dto.Orders;
import com.electronicbackend.dto.Product;
import com.electronicbackend.dto.Review;
import com.electronicbackend.dto.User;

@Configuration
@ComponentScan("com.electronicbackend.*")
@EnableTransactionManagement
public class DatabaseConfiguration 
{
	@Bean(name="dataSource")
	public DataSource getDataSource()
	{
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/electronics");
		dataSource.setUsername("root");
		dataSource.setPassword("$@ndip");
		return dataSource;
	}
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource)
	{
		Properties prop = new Properties();
		prop.setProperty("hibernate.hbm2ddl.auto", "update");
		prop.put("hibernate.show_sql", "true");
		prop.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
		LocalSessionFactoryBuilder sessionBuilder= new LocalSessionFactoryBuilder(getDataSource());
		sessionBuilder.addProperties(prop);
		sessionBuilder.addAnnotatedClass(Category.class);
		sessionBuilder.addAnnotatedClass(User.class);
		sessionBuilder.addAnnotatedClass(Product.class);
		sessionBuilder.addAnnotatedClass(Cart.class);
		sessionBuilder.addAnnotatedClass(Address.class);
		sessionBuilder.addAnnotatedClass(Orders.class);
		sessionBuilder.addAnnotatedClass(Review.class);
		SessionFactory sessionFactory = sessionBuilder.buildSessionFactory();
		return sessionFactory;
	}
	
	@Bean(name="transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory)
	{
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;		
	}
}
