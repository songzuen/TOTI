package com.yal.toti.baek.domain;

public class EstInfo {
	private int est_idx;
	private int cate_idx;
	private int mento_idx;
	private int m_idx;
	private int est_price;
	private String est_cont;

	public int getEst_idx() {
		return est_idx;
	}

	public void setEst_idx(int est_idx) {
		this.est_idx = est_idx;
	}

	public int getCate_idx() {
		return cate_idx;
	}

	public void setCate_idx(int cate_idx) {
		this.cate_idx = cate_idx;
	}

	public int getMento_idx() {
		return mento_idx;
	}

	public void setMento_idx(int mento_idx) {
		this.mento_idx = mento_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public int getEst_price() {
		return est_price;
	}

	public void setEst_price(int est_price) {
		this.est_price = est_price;
	}

	public String getEst_cont() {
		return est_cont;
	}

	public void setEst_cont(String est_cont) {
		this.est_cont = est_cont;
	}

	@Override
	public String toString() {
		return "EstInfo [est_idx=" + est_idx + ", cate_idx=" + cate_idx + ", mento_idx=" + mento_idx + ", m_idx="
				+ m_idx + ", est_price=" + est_price + ", est_cont=" + est_cont + "]";
	}

}
