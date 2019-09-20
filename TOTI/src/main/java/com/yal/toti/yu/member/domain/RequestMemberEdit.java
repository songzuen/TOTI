package com.yal.toti.yu.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberEdit {

	private int editIdx;
	private String editName;
	private String editEmail;
	private char editVer;
	private MultipartFile editPhoto;
	
	


	public int getEditIdx() {
		return editIdx;
	}




	public void setEditIdx(int editIdx) {
		this.editIdx = editIdx;
	}




	public String getEditName() {
		return editName;
	}




	public void setEditName(String editName) {
		this.editName = editName;
	}




	public String getEditEmail() {
		return editEmail;
	}




	public void setEditEmail(String editEmail) {
		this.editEmail = editEmail;
	}




	public char getEditVer() {
		return editVer;
	}




	public void setEditVer(char editVer) {
		this.editVer = editVer;
	}




	public MultipartFile getEditPhoto() {
		return editPhoto;
	}




	public void setEditPhoto(MultipartFile editPhoto) {
		this.editPhoto = editPhoto;
	}

	



	@Override
	public String toString() {
		return "RequestMemberEdit [editIdx=" + editIdx + ", editName=" + editName + ", editEmail=" + editEmail
				+ ", editVer=" + editVer + ", editPhoto=" + editPhoto.getOriginalFilename() + "]";
	}




	public MemberInfo toMemberInfo() {

		MemberInfo info = new MemberInfo();
		info.setM_idx(editIdx);
		info.setM_name(editName);
		info.setM_email(editEmail);
		info.setM_ver(editVer);

		return info;

	}

}