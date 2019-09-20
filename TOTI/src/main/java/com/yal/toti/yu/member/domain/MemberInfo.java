package com.yal.toti.yu.member.domain;

import java.util.Random;

import com.fasterxml.jackson.annotation.JsonIgnore;

// usebean Class
public class MemberInfo {

	private int m_idx;
	private String m_id;
	@JsonIgnore
	private String m_pw;
	private String m_name;
	private String m_email;
	private char m_ver;
	private char m_gender;
	private String m_photo;
	private char m_codeVer;
	@JsonIgnore
	private String m_code;
	//private Date m_date;

	 // default 생성자 필수 
	public MemberInfo() {
		//this.m_date = new Date();
	 getRandomString(); 
	 }

	// 사용자가 입력한거만 받아오는 거
	public MemberInfo(String m_id, String m_pw, String m_name, String m_email, char m_ver,
			char m_gender) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_ver = m_ver;
		this.m_gender = m_gender;
		getRandomString();

	}

	// 전체 받아오는거
	public MemberInfo(int m_idx, String m_id, String m_pw, String m_name, String m_email, char m_ver,
			char m_gender, String m_photo, char m_codeVer, String m_code) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_ver = m_ver;
		this.m_gender = m_gender;
		this.m_photo = m_photo;
		this.m_codeVer = m_codeVer;
		this.m_code = m_code;
		getRandomString();

	}

	// 변수들의 Getter/Setter 시작

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

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}



	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public char getM_ver() {
		return m_ver;
	}

	public void setM_ver(char m_ver) {
		this.m_ver = m_ver;
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

	public char getM_codeVer() {
		return m_codeVer;
	}

	public void setM_codeVer(char m_codeVer) {
		this.m_codeVer = m_codeVer;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}
	
	// 데이터 확인을 위한 toString 오버라이딩
	@Override
	public String toString() {
		return "MemberInfo [m_idx=" + m_idx + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_email="
				+ m_email + ", m_ver=" + m_ver + ", m_gender=" + m_gender + ", m_photo=" + m_photo + ", m_codeVer="
				+ m_codeVer + ", m_code=" + m_code + ", m_date =" +  /*m_date + */"]";
	}


	// 화면 결과 출력을 위한 HTML 코드 반환
	public String makeHtmlDiv() {
		String str = "";

		str += "<div class=\"mInfor\"> \n";
		str += "	<h3> \n";
		str += "		" + m_id + "(" + m_name + ")\n";
		str += "	</h3> \n";
		str += "	<p> \n";
		str += "		" + m_pw;
		str += "	</p> \n";
		str += "</div> \n";

		return str;
	}

	
	// 비밀번호 체크 확인
	// 실제론 m_pw.equals(m_pw)만 해도 되는데 발생할 수 있는 여러가지 예외를 생각해서 이렇게 처리해줌
	public boolean pwChk(String login_pw) {
		return m_pw != null && m_pw.trim().length() > 0 && m_pw.equals(login_pw);
	}

	// 영문 + 숫자 난수 발생
	private void getRandomString() {

		Random r = new Random(System.nanoTime());
		StringBuffer sb = new StringBuffer(); // 스트링은 그때그때 객체생성. 얘는 메모리 아낌

		for (int i = 0; i < 20; i++) {
			if (r.nextBoolean()) {
				sb.append(r.nextInt(10));
			} else {
				sb.append((char) (r.nextInt(26) + 97));
			}
		}

		System.out.println("난수 코드 생성 : " + sb);

		setM_code(sb.toString());

		// return sb.toString();
	}

}
