package com.internousdev.yataberyouhin.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

public class GoAddProductAction extends ActionSupport {

	private Map<String, Integer> categoryMap;

	public String execute() {

		categoryMap.put("すべてのカテゴリー", 1);
		categoryMap.put("本", 2);
		categoryMap.put("家電、パソコン", 3);
		categoryMap.put("ゲーム", 4);

		return SUCCESS;
	}

	/**
	 * @return categoryMap
	 */
	public Map<String, Integer> getCategoryMap() {
		return categoryMap;
	}

	/**
	 * @param categoryMap セットする categoryMap
	 */
	public void setCategoryMap(Map<String, Integer> categoryMap) {
		this.categoryMap = categoryMap;
	}
}
