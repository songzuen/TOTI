package com.yal.toti.yu.member.domain;

public class RequestMemberPwEdit {

	private int editIdx;
	private String editPw1;
	
	public int getEditIdx() {
		return editIdx;
	}
	public void setEditIdx(int editIdx) {
		this.editIdx = editIdx;
	}
	public String getEditPw1() {
		return editPw1;
	}
	public void setEditPw1(String editPw1) {
		this.editPw1 = editPw1;
	}
	@Override
	public String toString() {
		return "RequestMemberPwEdit [editIdx=" + editIdx + ", editPw1=" + editPw1 + "]";
	}
	
	
	
}
