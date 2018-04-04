package com.electronicbackend;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.electronicbackend.dao.CategoryDAO;
import com.electronicbackend.dto.Category;

public class CategoryTest {

	public static void main(String[] args) {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
	       context.scan("com.electronicbackend.*"); 	//Specify the package containing your bean
	       context.refresh();	//Bean created
	       
	       //Inserting a Category Object
	       CategoryDAO categoryDAO = (CategoryDAO)context.getBean("categoryDAO"); //We get the bean in object format, hence Convert it into CategoryDAO format.    
	       //The same name we gave in the configuration class i.e. categoryDAO
	      // Category category=new Category();
	       //category.setActive(true);
	       //category.setCategoryName("Laptop");
	       //categoryDAO.insertCategory(category);
	       //System.out.println(categoryDAO.getCategoryDetails());
	       
      // List<Category> categories=categoryDAO.getCategoryDetails();
       //System.out.println(categories.size());
//			for (Category category : categories) 
//			{
//				System.out.println(category.getCategoryName());
//			}
//	       Category category=categoryDAO.getCategoryById(5);
//	       category.setCategoryName("Speaker");
//	       categoryDAO.updateCategory(category);
//	       context.close();
	}

}
