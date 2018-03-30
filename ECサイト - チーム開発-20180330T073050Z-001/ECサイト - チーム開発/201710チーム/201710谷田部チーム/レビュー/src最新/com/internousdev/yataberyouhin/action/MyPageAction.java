package com.internousdev.yataberyouhin.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.yataberyouhin.dao.UserInfoDAO;
import com.internousdev.yataberyouhin.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {

	/**
	 * セッション
	 */
	public Map<String,Object> session;

	/**
	 * ユーザー情報一覧
	 */
	public ArrayList<UserInfoDTO> userInfoDTO = new ArrayList<UserInfoDTO>();

	/**
	 * ユーザー情報取得メソッド
	 */
	public String execute() {
		String result = ERROR;
	    UserInfoDAO userInfoDAO = new UserInfoDAO();
		userInfoDTO = userInfoDAO.userInfo(session.get("userId").toString());

		if(userInfoDTO.size() > 0) {
			result = SUCCESS;

		}

		return result;
	}

	/**
	 * @return userInfoDTO
	 */
	public ArrayList<UserInfoDTO> getUserInfoDTO() {
		return userInfoDTO;
	}

	/**
	 * @param userInfoDTO セットする userInfoDTO
	 */
	public void setUserInfoDTO(ArrayList<UserInfoDTO> userInfoDTO) {
		this.userInfoDTO = userInfoDTO;
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

}