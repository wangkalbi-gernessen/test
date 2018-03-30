package com.internousdev.yataberyouhin.action;

import java.util.ArrayList;

import com.internousdev.yataberyouhin.dao.ProductInfoDAO;
import com.internousdev.yataberyouhin.dto.ProductInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductInfoAction extends ActionSupport {
	/**
	 * 商品一覧リスト
	 */
	private ArrayList<ProductInfoDTO> productInfoDTOList = new ArrayList<ProductInfoDTO>();

	/**
	 *商品情報
	 */
	private ProductInfoDAO productInfoDAO = new ProductInfoDAO();

	public String execute() {
		String result = ERROR;
		productInfoDTOList = productInfoDAO.selectAll();

		if(productInfoDTOList.size() > 0) {
			result = SUCCESS;

		} else {
			result = ERROR;
		}

		return result;
	}

	/**
	 * @return productInfoDTOList
	 */
	public ArrayList<ProductInfoDTO> getProductInfoDTOList() {
		return productInfoDTOList;
	}

	/**
	 * @param productInfoDTOList セットする productInfoDTOList
	 */
	public void setProductInfoDTOList(ArrayList<ProductInfoDTO> productInfoDTOList) {
		this.productInfoDTOList = productInfoDTOList;
	}

	/**
	 * @return productInfoDAO
	 */
	public ProductInfoDAO getProductInfodao() {
		return productInfoDAO;
	}

	/**
	 * @param productInfoDAO セットする productInfoDAO
	 */
	public void setProductInfodao(ProductInfoDAO productInfodao) {
		this.productInfoDAO = productInfodao;
	}

}