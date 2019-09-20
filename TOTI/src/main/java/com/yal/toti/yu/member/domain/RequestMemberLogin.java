package com.yal.toti.yu.member.domain;

public class RequestMemberLogin {

	private String login_id;
	private String login_pw;
	
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_pw() {
		return login_pw;
	}
	public void setLogin_pw(String login_pw) {
		this.login_pw = login_pw;
	}
	@Override
	public String toString() {
		return "RequestMemberLogin [login_id=" + login_id + ", login_pw=" + login_pw + "]";
	}
	
	
	
	
}
