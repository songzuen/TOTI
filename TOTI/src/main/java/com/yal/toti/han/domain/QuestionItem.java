package com.yal.toti.han.domain;

public class QuestionItem {
	
	private int item_idx;
	private int quest_idx;
	private String item_cont;
	private String quest_type;
	
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public int getQuest_idx() {
		return quest_idx;
	}
	public void setQuest_idx(int quest_idx) {
		this.quest_idx = quest_idx;
	}
	public String getItem_cont() {
		return item_cont;
	}
	public void setItem_cont(String item_cont) {
		this.item_cont = item_cont;
	}
	public String getQuest_type() {
		return quest_type;
	}
	public void setQuest_type(String quest_type) {
		this.quest_type = quest_type;
	}
	
}
