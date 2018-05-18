package com.electronicbackend.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {

	@Id
	@GeneratedValue
	private int productId;
	private String productName;
	private int categoryId;
	private String supplierName;
	private int price;
	private int quantity;
	private String description;
	private boolean active;
	@Transient
	private MultipartFile image;

	public Product() {
		super();
	}

	public Product(int productId, String productName, int categoryId, String supplierName, int price, int quantity,
			String description, boolean active, MultipartFile image) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.categoryId = categoryId;
		this.supplierName = supplierName;
		this.price = price;
		this.quantity = quantity;
		this.description = description;
		this.active = active;
		this.image = image;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", categoryId=" + categoryId
				+ ", supplierName=" + supplierName + ", price=" + price + ", quantity=" + quantity + ", description="
				+ description + ", active=" + active + ", image=" + image + "]";
	}
	
}
