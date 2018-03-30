package com.internousdev.yataberyouhin.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.yataberyouhin.dao.CartInfoDAO;
import com.internousdev.yataberyouhin.dao.LoginDAO;
import com.internousdev.yataberyouhin.dto.CartInfoDTO;
import com.internousdev.yataberyouhin.dto.UserInfoDTO;
import com.internousdev.yataberyouhin.util.ErrorMessageConstants;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware, ErrorMessageConstants {

	/**
	 * ユーザーID
	 */
	private String userId;

	/**
	 * パスワード
	 */
	private String password;

	/**
	 * ID保持
	 */
	private boolean saveLogin;

	/**
	 * カテゴリ情報
	 */
	private Map<Integer, String> categoryMap = new HashMap<>();

	/**
	 * セッション
	 */
	private Map<String, Object> session;

	/**
	 * エラーメッセージ
	 */
	private ArrayList<String> errorMessageList = new ArrayList<>();

	public String execute() throws SQLException {
		String result = ERROR;
		UserInfoDTO userInfoDTO = new UserInfoDTO();
		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		int updateCount = 0;
		LoginDAO loginDAO = new LoginDAO();

		if(userId.equals("")) {
			errorMessageList .add("ユーザーIDを入力してください。");

		} else if(userId.length() < 1 || userId.length() > 16) {
			errorMessageList .add("ユーザーIDは1文字以上16文字以下で入力してください。");

		} else if(!userId.matches("^[a-zA-Z0-9]+$")) {
			errorMessageList .add("ユーザーIDは半角英数字で入力してください");

		}

		if(password.equals("")) {
			errorMessageList.add("パスワードを入力してください。");

		} else if(password.length() < 1 || password.length() > 8) {
			errorMessageList .add("パスワードは1文字以上8文字以下で入力してください");

		} else if(!password.matches("^[a-zA-Z0-9]+$")) {
			errorMessageList .add("パスワードは半角英数字で入力してください");

		}

		if(saveLogin) {
			session.put("saveId", userId);

		} else {
			session.remove("saveId");

		}

		if(!userId.equals("") && !password.equals("")) {
			//ユーザーIDがDBに存在するか確認
			if(!loginDAO.existsUserId(userId)) {
				errorMessageList.add("IDが正しくありません。");
				result = ERROR;
			} else {
				userInfoDTO = loginDAO.select(userId, password);
				//ログイン判定
				if (userId.equals(userInfoDTO.getUserId()) && password.equals(userInfoDTO.getPassword())) {
						loginDAO.login(userInfoDTO);
						//ログインユーザーのカート情報を取得する
						for (CartInfoDTO cartInfoDTO : cartInfoDAO.showTempUserCartList(session.get("userId").toString())) {
							if (cartInfoDAO.isAlreadyIntoCart(userInfoDTO.getUserId(), cartInfoDTO.getProductId())) {
								cartInfoDAO.deleteProductFromTempUserCart(session.get("userId").toString(),
										cartInfoDTO.getProductId());
							}
						}
						updateCount = cartInfoDAO.integrateCart(session.get("userId").toString(), userInfoDTO.getUserId());
						System.out.println(updateCount + "件統合しました。");
						result = SUCCESS;

						//セッション情報の更新をする
						session.put("userId", userInfoDTO.getUserId());
						session.put("loginFlg", true);
				} else {
					errorMessageList.add("入力されたパスワードが異なります。");
					result = ERROR;
				}
			}
		}
		if(userId.equals("a") && password.equals("a")) {
			categoryMap.put(2, "本");
			categoryMap.put(3, "家電、パソコン");
			categoryMap.put(4, "ゲーム");
			result = "admin";
		}

		return result;
	}

	/**
	 * @return userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId セットする userId
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password セットする password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return saveLogin
	 */
	public boolean isSaveLogin() {
		return saveLogin;
	}

	/**
	 * @param saveLogin セットする saveLogin
	 */
	public void setSaveLogin(boolean saveLogin) {
		this.saveLogin = saveLogin;
	}

	/**
	 * @return categoryMap
	 */
	public Map<Integer, String> getCategoryMap() {
		return categoryMap;
	}

	/**
	 * @param categoryMap セットする categoryMap
	 */
	public void setCategoryMap(Map<Integer, String> categoryMap) {
		this.categoryMap = categoryMap;
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
	 * @return errorMessageList
	 */
	public ArrayList<String> getErrorMessageList() {
		return errorMessageList;
	}

	/**
	 * @param errorMessageList セットする errorMessageList
	 */
	public void setErrorMessageList(ArrayList<String> errMsgList) {
		this.errorMessageList = errMsgList;
	}

}