package com.gaudetb.pokebook.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;


@Entity
@Table(name = "expenses")
public class Expense {
	
	// ---------------------------
	// Member Variables:	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull(message = "Expense must have a name.")
	@Size(min = 2, max = 50, message = "Expense name must be at least 2 characters and no more than 50 characters long.")
	private String name;
	
	@NotNull(message = "Vendor must have a name.")
	@Size(min = 2, max = 25, message = "Vendor name must be at least 2 characters and no more than 25 characters long.")
	private String vendor;
	
	@NotNull(message = "Expense amount must be greater than zero.")
	@Positive(message = "Expense amount must be greater than zero.")
	private double amount;
	
	@NotNull(message = "Expense must have a description.")
	@Size(min = 3, max = 255, message = "Expense description must be at least 3 characters and no more than 255 characters long.")
	private String description;
	
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
	// ---------------------------
	// Constructors:
	public Expense() {
		
	}
	
	public Expense(
			@NotNull 
			@Size(min = 2, max = 50)
			String name,
			@NotNull
			@Size(min = 2, max = 25)
			String vendor,
			@NotNull
			@Positive
			double amount,
			@NotNull
			@Size(min = 3, max = 255)
			String description
			) {
		this.name = name;
		this.amount = amount;
		this.description = description;
	}
	
	
	// ---------------------------
	// Methods:
	
	
	// ---------------------------
	// Getters & Setters:
	
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @return the vendor
	 */
	public String getVendor() {
		return vendor;
	}
	/**
	 * @return the amount
	 */
	public double getAmount() {
		return amount;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @return the createdAt
	 */
	public Date getCreatedAt() {
		return createdAt;
	}
	/**
	 * @return the updatedAt
	 */
	public Date getUpdatedAt() {
		return updatedAt;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @param vendor the vendor to set
	 */
	public void setVendor(String vendor) {
		this.vendor = vendor;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(double amount) {
		this.amount = amount;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	@PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

}
