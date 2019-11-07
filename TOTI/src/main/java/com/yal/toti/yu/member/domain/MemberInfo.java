package com.yal.toti.yu.member.domain;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class MemberInfo {
	
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String ver;
	private String gender;
	private MultipartFile photo;
	private String photo_name;
	private String regDate;
	
	@JsonIgnore
	private String code;
	private char verify;
	
	public MemberInfo() {
		this.code = getRandom();
		this.regDate = time();
	}
	
	// �븘�씠�뵒 �깮�꽦�옄
	public MemberInfo(String id) {
		this.id = id;
		this.code = getRandom();
	}
 
	// ver�깮�꽦�옄
	public MemberInfo(char verify) {
		this.verify = verify;
	}


	public MemberInfo(String id, String ver) {
		this.id = id;
		this.ver = ver;
	}

	
	
	public int getIdx() {
		return idx;
	}

	
	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getVer() {
		return ver;
	}

	public void setVer(String ver) {
		this.ver = ver;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public char getVerify() {
		return verify;
	}

	public void setVerify(char verify) {
		this.verify = verify;
	}

	

	@Override
	public String toString() {
		return "MemberInfo [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", ver=" + ver
				+ ", gender=" + gender + ", photo=" + photo + ", regDate=" + regDate + "]";
	}


	
	// yyyy/mm/dd濡� 諛붽씀湲�
	public String time() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		return format.format(date);
	}
	
	// �궃�닔 �깮�꽦
	public String getRandom() {
		Random rand = new Random(System.nanoTime());
		StringBuffer sb = new StringBuffer();
		
		//珥� 20臾몄옄 湲몄씠�쓽 �궃�닔 �깮�꽦
		for(int i=0; i<20; i++) {
			if(rand.nextBoolean()) {
				sb.append(rand.nextInt(10));
			} else {
				sb.append((char)(rand.nextInt(26)+97));
			}
		}
		return sb.toString();
	}


	
}
