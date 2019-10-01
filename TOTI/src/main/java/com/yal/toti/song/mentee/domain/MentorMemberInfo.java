package com.yal.toti.song.mentee.domain;

import java.util.Date;

public class MentorMemberInfo {
	private int m_idx;	//회원번호
	private String m_id;	//회원아이디
	private String m_name;	//회원 이름
	private char m_gender;	//회원 성별
	private String m_photo;	//회원사진
	
	private int mento_idx;	//멘토번호
	private int tor_coin;	//멘토코인
	private String tor_location;	//멘토 위치
	
	private int cate_idx;	//분야번호
	private String cate_name;	//분야 명
	
	private String p_shot;	//한줄 소개
	private String p_pay;	//결제 수단
	private String p_edu;	//멘토학력
	private String p_career;	//멘토 경력
	private String p_long;	//멘토 상세소개
	
	private int review_star;	//리뷰 별점
	private float str;	//리뷰 별점의 평균
	private String review_cont;	//리뷰 내용
	private String member_name;	//리뷰 작성자 명
	private Date review_date;	//리뷰 작성 날짜
	private int cont_cnt; 	//작성된 리뷰 수
	
	private String tor_sname;	//고수가 제공하는 서비스들
	
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public char getM_gender() {
		return m_gender;
	}
	public void setM_gender(char m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public int getCate_idx() {
		return cate_idx;
	}
	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}
	public int getTor_coin() {
		return tor_coin;
	}
	public void setTor_coin(int tor_coin) {
		this.tor_coin = tor_coin;
	}
	public String getTor_location() {
		return tor_location;
	}
	public void setTor_location(String tor_location) {
		this.tor_location = tor_location;
	}
	public String getP_shot() {
		return p_shot;
	}
	public void setP_shot(String p_shot) {
		this.p_shot = p_shot;
	}
	public String getP_pay() {
		return p_pay;
	}
	public void setP_pay(String p_pay) {
		this.p_pay = p_pay;
	}
	public String getP_edu() {
		return p_edu;
	}
	public void setP_edu(String p_edu) {
		this.p_edu = p_edu;
	}
	public String getP_career() {
		return p_career;
	}
	public void setP_career(String p_career) {
		this.p_career = p_career;
	}
	public String getP_long() {
		return p_long;
	}
	public void setP_long(String p_long) {
		this.p_long = p_long;
	}
	
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getMento_idx() {
		return mento_idx;
	}
	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}
	
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public float getStr() {
		return str;
	}
	public void setStr(float str) {
		this.str = str;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getCont_cnt() {
		return cont_cnt;
	}
	public void setCont_cnt(int cont_cnt) {
		this.cont_cnt = cont_cnt;
	}
	
	public String getTor_sname() {
		return tor_sname;
	}
	public void setTor_sname(String tor_sname) {
		this.tor_sname = tor_sname;
	}
	public MentorMemberInfo(int m_idx, String m_id, String m_name, char m_gender, String m_photo, int mento_idx,
			int tor_coin, String tor_location, int cate_idx, String cate_name, String p_shot, String p_pay,
			String p_edu, String p_career, String p_long, int review_star, String review_cont,String member_name,Date review_date, float str, int cont_cnt,String tor_sname) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_photo = m_photo;
		this.mento_idx = mento_idx;
		this.tor_coin = tor_coin;
		this.tor_location = tor_location;
		this.cate_idx = cate_idx;
		this.cate_name = cate_name;
		this.p_shot = p_shot;
		this.p_pay = p_pay;
		this.p_edu = p_edu;
		this.p_career = p_career;
		this.p_long = p_long;
		this.review_star = review_star;
		this.review_cont = review_cont;
		this.member_name = member_name;
		this.review_date = review_date;
		this.str = str;
		this.cont_cnt = cont_cnt;
		this.tor_sname = tor_sname;
	}
	public MentorMemberInfo() {
		Date review_Date = new Date();
	}
	
	
}
