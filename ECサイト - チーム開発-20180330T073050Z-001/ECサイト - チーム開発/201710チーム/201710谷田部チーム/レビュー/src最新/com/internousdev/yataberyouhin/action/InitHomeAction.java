/**
 *
 */
package com.internousdev.yataberyouhin.action;

import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.yataberyouhin.dao.MCategoryDAO;
import com.internousdev.yataberyouhin.dto.MCategoryDTO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * ホーム画面の初期設定
 * @author internousdev
 *
 */
public class InitHomeAction extends ActionSupport implements SessionAware {

	/**
	 * セッション
	 */
	private Map<String, Object> session;

    /**
     * カテゴリー一覧
     */
	private ArrayList<MCategoryDTO> mCategoryDTOList = new ArrayList<MCategoryDTO>();


	/**
	 * ホーム画面の初期設定
	 *
	 */
	public String execute() {

	String ret=ERROR;

	if(!session.containsKey("userId")) {
		session.put("userId", UUID.randomUUID().toString());
	}
	if(!session.containsKey("loginFlg")) {
		session.put("loginFlg", false);
	}

	MCategoryDAO dao = new MCategoryDAO();

	mCategoryDTOList=dao.selectAll();
	if(mCategoryDTOList.size() > 0){
		session.put("mCategoryDTOList", mCategoryDTOList);

		ret=SUCCESS;
	}else{
		ret=ERROR;
	}
	return ret;

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
