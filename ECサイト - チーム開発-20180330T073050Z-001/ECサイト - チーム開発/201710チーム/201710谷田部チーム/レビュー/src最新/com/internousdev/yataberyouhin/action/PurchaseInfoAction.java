package com.internousdev.yataberyouhin.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.yataberyouhin.dao.CartInfoDAO;
import com.internousdev.yataberyouhin.dao.DestinationInfoDAO;
import com.internousdev.yataberyouhin.dto.CartInfoDTO;
import com.internousdev.yataberyouhin.dto.DestinationInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class PurchaseInfoAction extends ActionSupport implements SessionAware {

	/**
	 * セッション
	 */
	private Map<String,Object> session;

	/**
	 * 合計金額
	 */
	private int totalPrice=0;

	/**
	 * 個数
	 */
	private int count;

	/**
	 * カート情報一覧
	 */
	private List<CartInfoDTO> cartInfoDTOList = new ArrayList<CartInfoDTO>();

	/**
	 * 宛先情報一覧
	 */
	private ArrayList<DestinationInfoDTO> destinationInfoListDTO = new ArrayList<DestinationInfoDTO>();

	/**
	 * 決済情報取得メソッド
	 */
	public String execute() throws SQLException{
		String result = ERROR;

		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		cartInfoDTOList = cartInfoDAO.showUserCartList(session.get("userId").toString());

		for(CartInfoDTO dto:cartInfoDTOList) {
			totalPrice +=dto.getPrice() * dto.getCount();

		}

		if (cartInfoDTOList.size() > 0) {
			result = SUCCESS;

		} else {
			result = ERROR;
		}

		/**
		 * 宛先情報取得メソッド
		 */
		DestinationInfoDAO destinationInfoDAO = new DestinationInfoDAO();
		destinationInfoListDTO = destinationInfoDAO.obtainingDestinationInfo(session.get("userId").toString());

		if(destinationInfoListDTO.size() > 0) {
			result = SUCCESS;

		} else if(!(boolean) session.get("loginFlg")) {
			result=ERROR;

		} else {
			result = "destination";

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
	 * @return cartInfoDTOList
	 */
	public List<CartInfoDTO> getCartInfoDTOList() {
		return cartInfoDTOList;
	}

	/**
	 * @param cartInfoDTOList セットする cartInfoDTOList
	 */
	public void setCartInfoDTOList(List<CartInfoDTO> cartInfoDTOList) {
		this.cartInfoDTOList = cartInfoDTOList;
	}

	/**
	 * @return totalPrice
	 */
	public int getTotalPrice() {
		return totalPrice;
	}

	/**
	 * @param totalPrice セットする totalPrice
	 */
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	/**
	 * @return destinationInfoListDTO
	 */
	public ArrayList<DestinationInfoDTO> getDestinationInfoListDTO() {
		return destinationInfoListDTO;
	}

	/**
	 * @param destinationInfoListDTO セットする destinationInfoListDTO
	 */
	public void setDestinationInfoListDTO(ArrayList<DestinationInfoDTO> destinationInfoListDTO) {
		this.destinationInfoListDTO = destinationInfoListDTO;
	}

	/**
	 * @return count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count セットする count
	 */
	public void setCount(int count) {
		this.count = count;
	}

}