package com.javaex.vo;

public class LikeReviewVo {

	private int reviewNo;
	private String bookTitle;
	private String bookNo;
	private String nickname;
	private int userNo;
	private String reviewContent;
	private String emoName;
	private int emoNo;
	private String reviewDate;
	private int styleNo;
	private int likecnt;
	private String review_like_date;

	public LikeReviewVo() {
	}

	public LikeReviewVo(int reviewNo, String bookTitle, String bookNo, String nickname, int userNo,
			String reviewContent, String emoName, int emoNo, String reviewDate, int styleNo, int likecnt,
			String review_like_date) {
		super();
		this.reviewNo = reviewNo;
		this.bookTitle = bookTitle;
		this.bookNo = bookNo;
		this.nickname = nickname;
		this.userNo = userNo;
		this.reviewContent = reviewContent;
		this.emoName = emoName;
		this.emoNo = emoNo;
		this.reviewDate = reviewDate;
		this.styleNo = styleNo;
		this.likecnt = likecnt;
		this.review_like_date = review_like_date;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookNo() {
		return bookNo;
	}

	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getStyleNo() {
		return styleNo;
	}

	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public String getReview_like_date() {
		return review_like_date;
	}

	public void setReview_like_date(String review_like_date) {
		this.review_like_date = review_like_date;
	}

	@Override
	public String toString() {
		return "LikeReviewVo [reviewNo=" + reviewNo + ", bookTitle=" + bookTitle + ", bookNo=" + bookNo + ", nickname="
				+ nickname + ", userNo=" + userNo + ", reviewContent=" + reviewContent + ", emoName=" + emoName
				+ ", emoNo=" + emoNo + ", reviewDate=" + reviewDate + ", styleNo=" + styleNo + ", likecnt=" + likecnt
				+ ", review_like_date=" + review_like_date + "]";
	}



}
