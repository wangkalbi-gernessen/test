package com.internousdev.yataberyouhin.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.yataberyouhin.dao.CartInfoDAO;
import com.internousdev.yataberyouhin.dao.ProductInfoDAO;
import com.internousdev.yataberyouhin.dao.ReviewInfoDAO;
import com.internousdev.yataberyouhin.dto.ProductInfoDTO;
import com.internousdev.yataberyouhin.dto.ReviewInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductInfoDetailAction extends ActionSupport implements SessionAware {
	/**
	 * セッション
	 */
	private Map<String, Object> session;

	/**
	 * 商品一覧
	 */
	private ProductInfoDTO productInfoDTO = new ProductInfoDTO();

	/**
	 * 商品ID
	 */
	private int productId;

	/**
	 * 商品一覧リスト(productInfoDTOList)
	 */
	private ArrayList<ProductInfoDTO> productInfoDTOList = new ArrayList<ProductInfoDTO>();

	/**
	 *購入個数
	 */
	private ArrayList<Integer> count = new ArrayList<>();

	/**
	 *商品が既にカートにあるかないか判定
	 */
	private boolean duplicationFlg;

	/**
	 * レビュー
	 */
	private ArrayList<ReviewInfoDTO> reviewList = new ArrayList<>();

	/**
	 *商品一覧リスト(similarInfoDTOList)
	 */
	private ArrayList<ProductInfoDTO> similarInfoDTOList = new ArrayList<ProductInfoDTO>();

	public String execute() throws SQLException {
		String result = ERROR;
		ProductInfoDAO productInfoDAO = new ProductInfoDAO();

		if(productId > 0) {
			productInfoDTO = productInfoDAO.selectByProductId(productId);
			// ここから、商品のレビューを取得する記述
			ReviewInfoDAO reviewInfoDAO = new ReviewInfoDAO();

			for(ReviewInfoDTO reviewInfoDTO : reviewInfoDAO.aquireReviewInfo(productId)) {
				reviewList.add(reviewInfoDTO);

			}

			//ここから、目標の商品がすでにカートに入っているかどうか確認
			CartInfoDAO cartInfoDAO = new CartInfoDAO();
			if((boolean)session.get("loginFlg")) {
				duplicationFlg = cartInfoDAO.isAlreadyIntoCart(session.get("userId").toString(), productId);
			} else {
				duplicationFlg = cartInfoDAO.isAlreadyIntoTempCart(session.get("userId").toString(), productId);
			}

			//ここから、購入個数を在庫に応じて変えるよう記述
			for(int i = 1; i <= 10; i++) {

				if (i > productInfoDTO.getStock()) {
					break;

				}

				count.add(i);

			}

			productInfoDTOList = productInfoDAO.selectByCategoryId(productInfoDTO.getCategoryId());

			Iterator<ProductInfoDTO> iterator = productInfoDTOList.iterator();
			for (int i= 0;  i< 4; i++) {

				if(iterator.hasNext()) {
					ProductInfoDTO productInfodto = iterator.next();

					if(productInfodto.getProductId() != productInfoDTO.getProductId()) {
						similarInfoDTOList.add(productInfodto);

					} else {
						i--;
						continue;

					}

				} else {
					break;

				}

			}
			result = SUCCESS;

		} else {
			result = ERROR;
		}

		return result;
	}

	/**
	 * @return session
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * @param session セットする session
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * @return productInfoDTO
	 */
	public ProductInfoDTO getProductInfoDTO() {
		return productInfoDTO;
	}

	/**
	 * @param productInfoDTO セットする productInfoDTO
	 */
	public void setProductInfoDTO(ProductInfoDTO productInfoDTO) {
		this.productInfoDTO = productInfoDTO;
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
	 * @return count
	 */
	public ArrayList<Integer> getCount() {
		return count;
	}

	/**
	 * @param count セットする count
	 */
	public void setCount(ArrayList<Integer> count) {
		this.count = count;
	}

	/**
	 * @return duplicationFlg
	 */
	public boolean isDuplicationFlg() {
		return duplicationFlg;
	}

	/**
	 * @param duplicationFlg セットする duplicationFlg
	 */
	public void setDuplicationFlg(boolean duplicationFlg) {
		this.duplicationFlg = duplicationFlg;
	}

	/**
	 * @return reviewList
	 */
	public ArrayList<ReviewInfoDTO> getReviewList() {
		return reviewList;
	}

	/**
	 * @param reviewList セットする reviewList
	 */
	public void setReviewList(ArrayList<ReviewInfoDTO> reviewList) {
		this.reviewList = reviewList;
	}

	/**
	 * @return similarInfoDTOList
	 */
	public ArrayList<ProductInfoDTO> getSimilarInfoDTOList() {
		return similarInfoDTOList;
	}

	/**
	 * @param similarInfoDTOList セットする similarInfoDTOList
	 */
	public void setSimilarInfoDTOList(ArrayList<ProductInfoDTO> similarInfoDTOList) {
		this.similarInfoDTOList = similarInfoDTOList;
	}

}