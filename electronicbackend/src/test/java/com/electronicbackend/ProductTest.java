package com.electronicbackend;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.electronicbackend.dao.ProductDAO;
import com.electronicbackend.dto.Product;

public class ProductTest {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.electronicbackend.*"); // Specify the package
													// containing your bean
		context.refresh(); // Bean created

		ProductDAO productDAO = (ProductDAO) context.getBean("productDAO");
//		List<Product> products = productDAO.searchProducts("redmi");
//		for (Product product : products) {
//			System.out.println(product.getProductName());
//			System.out.println(product.getPrice());
//			
//
//		}
		Product product=productDAO.getProductById(4);
		product.setActive(false);
		productDAO.updateProduct(product);
		
	}

}
