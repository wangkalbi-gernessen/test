package com.internousdev.yataberyouhin.action;

import java.util.ArrayList;

import com.internousdev.yataberyouhin.dao.ProductInfoDAO;
import com.internousdev.yataberyouhin.dto.ProductInfoDTO;
import com.internousdev.yataberyouhin.util.InputChecker;
import com.opensymphony.xwork2.ActionSupport;

public class ProductSearchAction extends ActionSupport {
	/**
	 * 商品一覧
	 */
	private ArrayList<ProductInfoDTO> productInfoDTOList = new ArrayList<ProductInfoDTO>();

	/**
	 * カテゴリーID
	 */
	private String categoryId;

	/**
	 * カテゴリーの名前
	 */
	private String categoryName;

	/**
	 * キーワード
	 */
	private String keyword;

	/**
	 * エラーメッセージ
	 */
	private String errorMassage;

	String[] keywords;
	InputChecker i = new InputChecker();

	/**
	 * 複合検索
	 *
	 * @param categoryId
	 * @param keyword
	 * @return
	 */
	private ArrayList<ProductInfoDTO> doSelectByMultiple(String categoryId, String keyword) {
		ProductInfoDAO productInfodao = new ProductInfoDAO();
		String[] keywords = this.createKeywords(keyword);

		if(categoryId.equals("1")) {
			return productInfodao.selectByKeyWord(keyword);

		} else {
			for(int i = 0; i < keywords.length; i++) {
				productInfoDTOList = productInfodao.selectByMultiple(Integer.parseInt(categoryId), keyword);
			}
		}

		return productInfoDTOList;
	}

	/**
	 * キーワードエラーチェック
	 * @param keyword
	 * @return
	 */
	private boolean isError(String keyword) {
		String[] keywords = this.createKeywords(keyword);

		for(int i = 0; i < keywords.length; i++) {
			InputChecker inputChecker = new InputChecker();

			if(!inputChecker.keywordChk(keywords[i]).isEmpty()) {
				this.errorMassage = inputChecker.keywordChk(keywords[i]);
				return false;

			}

		}

		return true;
	}

	/**
	 * 全件検索
	 *
	 * @return
	 */
	private ArrayList<ProductInfoDTO> doSelectAll() {
		ProductInfoDAO productInfodao = new ProductInfoDAO();
		productInfoDTOList = productInfodao.selectAll();
		return productInfoDTOList;
	}

	/**
	 * カテゴリー検索
	 *
	 * @param categoryId
	 * @return
	 */
	private ArrayList<ProductInfoDTO> doSelectByCategoryId(String categoryId) {
		ProductInfoDAO productInfodao = new ProductInfoDAO();
		productInfoDTOList = productInfodao.selectByCategoryId(Integer.parseInt(categoryId));
		return productInfoDTOList;
	}

	/**
	 * キーワード検索
	 *
	 * @param keyword
	 * @return
	 */
	private ArrayList<ProductInfoDTO> doSelectByKeyword(String keyword) {
		ProductInfoDAO productInfodao = new ProductInfoDAO();
		String[] keywords = this.createKeywords(keyword);
		productInfoDTOList = productInfodao.selectByKeyWords(keywords);
		return productInfoDTOList;
	}

	/*
	 *キーワード置き換え・分割
	 * @param keyword
	 * @return
	 */
	private String[] createKeywords(String keyword) {
		// 全角を半角に置き換えて、文字列を" "で分割する
		keyword = keyword.replace("　", " ");
		String[] keywords = keyword.split(" ", 0);
		return keywords;
	}

	public String execute() {
		String result = ERROR;
		System.out.println("カテゴリーID：" + categoryId + " " + "キーワード：" + keyword);
		// System.out.println(keyword);

		// カテゴリー有(1以上)
		if((Integer.parseInt(categoryId) >= 1)) {

			// キーワード有(!Empty)
			if(!(keyword.isEmpty())) {

				// 複合検索
				if(this.isError(keyword)) {
				productInfoDTOList = this.doSelectByMultiple(categoryId, keyword);
				return SUCCESS;

				} else {
				productInfoDTOList = null;
				return SUCCESS;

			}

			}

			// キーワード無
			if(keyword.isEmpty()) {

				// カテゴリー有(1:全件検索)
				if(Integer.parseInt(categoryId) == 1) {
					productInfoDTOList = this.doSelectAll();
					return SUCCESS;

				}

				// カテゴリー有(2以上:カテゴリー検索)
				if(Integer.parseInt(categoryId) >= 2) {
					productInfoDTOList = this.doSelectByCategoryId(categoryId);
					return SUCCESS;

				}

			}

		}

		// カテゴリー無(0)
		if(Integer.parseInt(categoryId) == 0) {

			// キーワード有(!Empty)
			if(!(keyword.isEmpty())) {

				if(this.isError(keyword)) {
//					productInfoDTOList=null;
//					return SUCCESS;
					productInfoDTOList = this.doSelectByKeyword(keyword);
					return SUCCESS;

				}else{
					productInfoDTOList = null;
					return SUCCESS;
//					productInfoDTOList = this.doSelectByKeyword(keyword);
//					return SUCCESS;

				}

			}

			// キーワード無
			if(keyword.isEmpty()) {
				productInfoDTOList = this.doSelectAll();
				return SUCCESS;

			}

		}

		return result;

	}

	/**
	 *@return productInfoDTO
	 */
	public ArrayList<ProductInfoDTO> getProductInfoDTOList() {
		return productInfoDTOList;
	}

	/**
	 *@param productInfoDTO セットする productInfoDTO
	 */
	public void setProductInfoDTOList(ArrayList<ProductInfoDTO> productInfoDTOList) {
		this.productInfoDTOList = productInfoDTOList;
	}

	/**
	 *@return keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 *@param keyword セットする keyword
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/**
	 *@return errorMassage
	 */
	public String getErrorMassage() {
		return errorMassage;
	}

	/**
	 *@param errorMassage セットする errorMassage
	 */
	public void setErrorMassage(String errorMassage) {
		this.errorMassage = errorMassage;
	}

	/**
	 *@return categoryName
	 */
	public String getCategoryName() {
		return categoryName;
	}

	/**
	 *@param categoryName セットする categoryName
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	/**
	 *@return categoryId
	 */
	public String getCategoryId() {
		return categoryId;
	}

	/**
	 *@param categoryId セットする categoryId
	 */
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

}