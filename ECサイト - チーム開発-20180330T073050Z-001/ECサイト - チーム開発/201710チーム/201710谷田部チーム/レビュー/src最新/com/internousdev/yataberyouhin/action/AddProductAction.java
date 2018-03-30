package com.internousdev.yataberyouhin.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.internousdev.yataberyouhin.dao.ProductInfoDAO;
import com.internousdev.yataberyouhin.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class AddProductAction extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;

	private String productName;

	private String productNameKana;

	private String productDescription;

	private int categoryId;

	private int price;

	private int stock;

	private String imageFilePath;

	private String imageFileName;

	private File imageFile;

	private Date releaseDate;

	private String releaseCompany;

	private ArrayList<String> errMsgList = new ArrayList<>();

	public String execute() throws SQLException {
		String result = SUCCESS;
		ProductInfoDAO dao = new ProductInfoDAO();

		if (productName == null || productName.isEmpty()) {
			errMsgList.add("商品名を入力してください。");
			result = ERROR;
		} else if (dao.existsProductName(productName)) {
			errMsgList.add("その商品名は既に使われています。");
			result = ERROR;
		}

		if (productNameKana == null || productNameKana.isEmpty()) {
			errMsgList.add("商品名かなを入力してください。");
			result = ERROR;
		} else if (dao.existsProductNameKana(productNameKana)) {
			errMsgList.add("その商品名かなは既に使われています。");
			result = ERROR;
		}

		int productId;
		while (true) {
			productId = new Random().nextInt() % 10000000;
			if (!dao.existsProductId(productId)) {
				break;
			}
		}

		if (productDescription.isEmpty()) {
			errMsgList.add("商品詳細を入力してください");
			result = ERROR;
		}

		if (imageFilePath == null || imageFilePath.isEmpty()) {
			imageFilePath = "image/";
		}

		if (imageFileName == null || imageFileName.isEmpty()) {
			imageFileName = productName + ".jpg";
		}

		if (result != ERROR) {
			File fileDir = new File(request.getServletContext().getRealPath(imageFilePath));
			File outputFile = new File(fileDir, imageFileName);
			BufferedImage readImage = null;

			try {
				readImage = ImageIO.read(imageFile);
				if (!ImageIO.write(readImage, "jpg", outputFile)) {
					errMsgList.add("正常に画像を保存できませんでした。");
					result = ERROR;
				}
			} catch (IOException e) {
				e.printStackTrace();
				readImage = null;
			}

			ProductInfoDTO dto = new ProductInfoDTO();
			dto.setProductId(productId);
			dto.setProductName(productName);
			dto.setProductNameKana(productNameKana);
			dto.setProductDescription(productDescription);
			dto.setCategoryId(categoryId);
			dto.setPrice(price);
			dto.setStock(stock);
			dto.setImageFilePath(imageFilePath);
			dto.setImageFileName(imageFileName);
			dto.setReleaseDate(releaseDate);
			dto.setReleaseCompany(releaseCompany);
			dao.insertNewProduct(dto);
		}

		return result;

	}

	/**
	 * @return request
	 */
	public HttpServletRequest getServletRequest() {
		return request;
	}

	/**
	 * @param request
	 *            セットする request
	 */
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * @return productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            セットする productName
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
	 * @param productNameKana
	 *            セットする productNameKana
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
	 * @param productDescription
	 *            セットする productDescription
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
	 * @param categoryId
	 *            セットする categoryId
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
	 * @param price
	 *            セットする price
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * @return stock
	 */
	public int getStock() {
		return stock;
	}

	/**
	 * @param stock
	 *            セットする stock
	 */
	public void setStock(int stock) {
		this.stock = stock;
	}

	/**
	 * @return imageFilePath
	 */
	public String getImageFilePath() {
		return imageFilePath;
	}

	/**
	 * @param imageFilePath
	 *            セットする imageFilePath
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
	 * @param imageFileName
	 *            セットする imageFileName
	 */
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	/**
	 * @return imageFile
	 */
	public File getImageFile() {
		return imageFile;
	}

	/**
	 * @param imageFile
	 *            セットする imageFile
	 */
	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}

	/**
	 * @return releaseDate
	 */
	public Date getReleaseDate() {
		return releaseDate;
	}

	/**
	 * @param releaseDate
	 *            セットする releaseDate
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
	 * @param releaseCompany
	 *            セットする releaseCompany
	 */
	public void setReleaseCompany(String releaseCompany) {
		this.releaseCompany = releaseCompany;
	}

	/**
	 * @return errMsgList
	 */
	public ArrayList<String> getErrMsgList() {
		return errMsgList;
	}

	/**
	 * @param errMsgList
	 *            セットする errMsgList
	 */
	public void setErrMsgList(ArrayList<String> errMsgList) {
		this.errMsgList = errMsgList;
	}

}
