package com.yal.toti.han.domain;

import java.sql.Date;

public class MentoProfile {
	
	private int m_idx; //회원번호
	private int mento_idx; //고수번호
	private String m_name; //회원 이름
	private String m_photo; //회원 사진
	
	private int cate_idx;
	private String cate_name; //대표서비스(분야)명
	private String service_name; //서비스명
	private String mento_service; //고수가 저장한 서비스명
	
	private String p_shot; //한줄소개
	private String tor_location; //활동지역
	private String p_pay; //결제수단
	private String p_edu; //학력
	private String p_career; //경력
	private String p_long; //상세소개
	
	private int review_idx; //리뷰번호
	private float review_avg; //리뷰평점평균
	private int review_cnt; //리뷰수
	private int review_star; //평점
	private String review_cont; //리뷰내용
	private String cont; //프로필에 뜨는 리뷰내용 (null일 때  공백처리)
	private String member_name; //리뷰 작성한 회원이름
	private Date review_date; //리뷰 작성 날짜
	
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getMento_idx() {
		return mento_idx;
	}
	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
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
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	public String getMento_service() {
		return mento_service;
	}
	public void setMento_service(String mento_service) {
		this.mento_service = mento_service;
	}
	public String getP_shot() {
		return p_shot;
	}
	public void setP_shot(String p_shot) {
		this.p_shot = p_shot;
	}
	public String getTor_location() {
		return tor_location;
	}
	public void setTor_location(String tor_location) {
		this.tor_location = tor_location;
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
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public float getReview_avg() {
		return review_avg;
	}
	public void setReview_avg(float review_avg) {
		this.review_avg = review_avg;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
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
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
}
