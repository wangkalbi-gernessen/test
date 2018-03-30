package com.internousdev.yataberyouhin.action;

import java.util.ArrayList;
import java.util.List;

import com.internousdev.yataberyouhin.dao.ContactCompleteDAO;
import com.internousdev.yataberyouhin.dto.ContactCompleteDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ContactCompleteAction extends ActionSupport {

	/**
	 * お問い合わせユーザー名
	 */
	private String name;

	/**
	 * お問い合わせの種類
	 */
	private String qtype;

	/**
	 * お問い合わせの内容
	 */
	private String content;

	/**
	 *お問い合わせ情報一覧
	 */
	public List<ContactCompleteDTO> contactCompleteDTOList = new ArrayList<ContactCompleteDTO>();

	public String execute(){
		String result = SUCCESS;
	    ContactCompleteDAO contactCompleteDAO = new ContactCompleteDAO();

		int count = contactCompleteDAO.contact(name, qtype, content);

		if(count>0) {
			contactCompleteDTOList = contactCompleteDAO.contactSelect();

		}

		return result;

	}
	/**
	 * @return name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name セットする name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return qtype
	 */
	public String getQtype() {
		return qtype;
	}
	/**
	 * @param qtype セットする qtype
	 */
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	/**
	 * @return content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content セットする content
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return contactCompleteDTOList
	 */
	public List<ContactCompleteDTO> getContactCompleteDTOList() {
		return contactCompleteDTOList;
	}

	/**
	 * @param contactCompleteDTOList セットする contactCompleteDTOList
	 */
	public void setContactCompleteDTOList(List<ContactCompleteDTO> contactCompleteDTOList) {
		this.contactCompleteDTOList = contactCompleteDTOList;
	}
}