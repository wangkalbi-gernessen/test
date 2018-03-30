package com.internousdev.yataberyouhin.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class GoLoginAction extends ActionSupport implements SessionAware {

	/**
	 * セッション
	 */
	public Map<String, Object> session;

	public String execute() {
		if ((boolean) session.get("loginFlg")) {
			return ERROR;
		} else {
			return SUCCESS;
		}
	}

	/**
	 * @return session
	 */
	public Map<String, Object> getSession() {
		return this.session;
	}

	/**
	 * @Override
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}