package com.electronicbackend;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.electronicbackend.dao.UserDAO;
import com.electronicbackend.dto.User;

public class UserTest {

	public static void main(String[] args) 
	{
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	       context.scan("com.electronicbackend.*"); 	//Specify the package containing your bean
	       context.refresh();	//Bean created
	       
	       //Inserting a Category Object
	       UserDAO userDAO = (UserDAO)context.getBean("userDAO"); //We get the bean in object format, hence Convert it into UserDAO format.    
	       //The same name we gave in the configuration class i.e. UserDAO
	       
	       System.out.println(userDAO.getUserByRole("supplier"));
//	       System.out.println(userDAO.getUserByUsername("sammy"));
//	       User user=new User();
//	       user.setContactNumber("8652042091");
//	       user.setEmail("sandipshetty191@gmail.com");
//	       user.setPassword("admin");
//	       user.setActive(true);
//	       user.setUsername("admin");
//	       user.setRole("admin");
//	       user.setFirstName("sandip");
//	       user.setLastName("shetty");
//	      // userDAO.updateUser(user);
//	       userDAO.insertUser(user);
	       
	       context.close();

	}

}
