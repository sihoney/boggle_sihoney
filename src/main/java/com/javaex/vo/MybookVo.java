package com.javaex.vo;

public class MybookVo {

	private String bookTitle;
	private String userName;
	private int userNo;
	private String reviewContent;
	private String emoName;
	private int emoNo;
	private String reviewDate;
	
	public MybookVo() {}
	public MybookVo(String bookTitle, String userName, int userNo, String reviewContent, String emoName, int emoNo,
			String reviewDate) {
		super();
		this.bookTitle = bookTitle;
		this.userName = userName;
		this.userNo = userNo;
		this.reviewContent = reviewContent;
		this.emoName = emoName;
		this.emoNo = emoNo;
		this.reviewDate = reviewDate;
	}
	
	
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getEmoName() {
		return emoName;
	}
	public void setEmoName(String emoName) {
		this.emoName = emoName;
	}
	public int getEmoNo() {
		return emoNo;
	}
	public void setEmoNo(int emoNo) {
		this.emoNo = emoNo;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	
	
	@Override
	public String toString() {
		return "MybookVo [bookTitle=" + bookTitle + ", userName=" + userName + ", userNo=" + userNo + ", reviewContent="
				+ reviewContent + ", emoName=" + emoName + ", emoNo=" + emoNo + ", reviewDate=" + reviewDate + "]";
	}
	
}
