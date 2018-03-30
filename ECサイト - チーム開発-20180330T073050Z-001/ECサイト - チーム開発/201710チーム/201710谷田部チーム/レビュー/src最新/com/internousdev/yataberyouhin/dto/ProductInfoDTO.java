package com.internousdev.yataberyouhin.dto;

import java.util.Date;

public class ProductInfoDTO {

	/**
	 * ID
	 */
	private int Id;

	/**
	 * 商品ID
	 */
	private int productId;

	/**
	 * 商品名
	 */
	private String productName;

	/**
	 * 商品名(カナ)
	 */
	private String productNameKana;

	/**
	 * 商品詳細
	 */
	private String productDescription;

	/**
	 * カテゴリーID
	 */
	private int categoryId;

	/**
	 * 値段
	 */
	private int price;

	/**
	 * 在庫
	 */
	private int stock;

	/**
	 * 画像ファイルの場所
	 */
	private String imageFilePath;

	/**
	 * 画像ファイル名
	 */
	private String imageFileName;

	/**
	 * 発売年月日
	 */
	private Date releaseDate;

	/**
	 * 発売会社
	 */
	private String releaseCompany;

	/**
	 * ステータス
	 */
	private short status;

	/**
	 *
	 */
	private Date insertDate;

	/**
	 * 更新日
	 */
	private Date updateDate;

	/**
	 * @return Id
	 */
	public int getId() {
		return Id;
	}

	/**
	 * @param Id セットする Id
	 */
	public void setId(int Id) {
		this.Id = Id;
	}

	/**
	 * @return productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId セットする productId
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return productName
	 */
	public String getProductName() {
		return productName;
	}


	/**
	 * @param productName セットする productName
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return productNameKana
	 */
	public String getProductNameKana() {
		return productNameKana;
	}

	/**
	 * @param productNameKana セットする productNameKana
	 */
	public void setProductNameKana(String productNameKana) {
		this.productNameKana = productNameKana;
	}

	/**
	 * @return productDescription
	 */
	public String getProductDescription() {
		return productDescription;
	}

	/**
	 * @param productDescription セットする productDescription
	 */
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	/**
	 * @return categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId セットする categoryId
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price セットする price
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * @return imageFilePath
	 */
	public String getImageFilePath() {
		return imageFilePath;
	}

	/**
	 * @param imageFilePath セットする imageFilePath
	 */
	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}

	/**
	 * @return imageFileName
	 */
	public String getImageFileName() {
		return imageFileName;
	}

	/**
	 * @param imageFileName セットする imageFileName
	 */
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	/**
	 * @return releaseDate
	 */
	public Date getReleaseDate() {
		return releaseDate;
	}

	/**
	 * @param releaseDate セットする releaseDate
	 */
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	/**
	 * @return releaseCompany
	 */
	public String getReleaseCompany() {
		return releaseCompany;
	}

	/**
	 * @param releaseCompany セットする releaseCompany
	 */
	public void setReleaseCompany(String releaseCompany) {
		this.releaseCompany = releaseCompany;
	}

	/**
	 * @return status
	 */
	public short getStatus() {
		return status;
	}

	/**
	 * @param status セットする status
	 */
	public void setStatus(short status) {
		this.status = status;
	}

	/**
	 * @return updateDate
	 */
	public Date getUpdateDate() {
		return updateDate;
	}

	/**
	 * @param updateDate セットする updateDate
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	/**
	 * @return insertDate
	 */
	public Date getInsertDate() {
		return insertDate;
	}

	/**
	 * @param insertDate セットする insertDate
	 */
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	/**
	 * @return stock
	 */
	public int getStock() {
		return stock;
	}

	/**
	 * @param stock セットする stock
	 */
	public void setStock(int stock) {
		this.stock = stock;
	}

}