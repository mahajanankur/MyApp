package com.web.Dao;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "transaction")
@NamedQueries({
		@NamedQuery(name = "transactionList", query = "select t from Transaction t"),
		@NamedQuery(name = "transactionsByClient", query = "select t from Transaction t WHERE t.clientId = :clientId") })
public class Transaction {

	@Id
	@Column(name = "transaction_id")
	private int			transactionId;

	@Column(name = "category_id")
	private int			categoryId;

	@Column(name = "subCat_id")
	private int			subCatId;

	@Column(name = "product_id")
	private int			productId;

	@Column(name = "transaction_amount")
	private double		tAmount;

	@Column(name = "created_on")
	private Timestamp	createdOn;

	@Column(name = "quantity")
	private int			quantity;

	@Column(name = "client_id")
	private int			clientId;

	@Column(name = "client_name")
	private String		clientName;

	@Column(name = "user_id")
	private int			userId;

	@Column(name = "product_name")
	private String		productName;

	/**
	 * @return the clientId
	 */
	public int getClientId() {
		return clientId;
	}

	/**
	 * @param clientId
	 *            the clientId to set
	 */
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	/**
	 * @return the transactionId
	 */
	public int getTransactionId() {
		return transactionId;
	}

	/**
	 * @param transactionId
	 *            the transactionId to set
	 */
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId
	 *            the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the subCatId
	 */
	public int getSubCatId() {
		return subCatId;
	}

	/**
	 * @param subCatId
	 *            the subCatId to set
	 */
	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return the createdOn
	 */
	public Timestamp getCreatedOn() {
		return createdOn;
	}

	/**
	 * @param createdOn
	 *            the createdOn to set
	 */
	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity
	 *            the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the tAmount
	 */
	public double gettAmount() {
		return tAmount;
	}

	/**
	 * @param tAmount
	 *            the tAmount to set
	 */
	public void settAmount(double tAmount) {
		this.tAmount = tAmount;
	}

	/**
	 * @return the clientName
	 */
	public String getClientName() {
		return clientName;
	}

	/**
	 * @param clientName
	 *            the clientName to set
	 */
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", categoryId="
				+ categoryId + ", subCatId=" + subCatId + ", productId="
				+ productId + ", tAmount=" + tAmount + ", createdOn="
				+ createdOn + ", quantity=" + quantity + ", clientId="
				+ clientId + ", clientName=" + clientName + ", userId="
				+ userId + ", productName=" + productName + "]";
	}

}
