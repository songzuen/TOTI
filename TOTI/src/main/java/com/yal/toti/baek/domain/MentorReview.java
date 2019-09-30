package com.yal.toti.baek.domain;

public class MentorReview {

	private int m_idx;
	private String m_name;
	private int review_star;
	private String review_cont;
	private String review_date;

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
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

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "Review [m_idx=" + m_idx + ", m_name=" + m_name + ", review_star=" + review_star + ", review_cont="
				+ review_cont + ", review_date=" + review_date + "]";
	}

}
