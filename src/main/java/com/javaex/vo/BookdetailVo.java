package com.javaex.vo;

public class BookdetailVo {
	
	//필드
		private String bookNo;
		private String bookTitle;
		private String author;
		private String bookUrl;
		private String coverUrl;
		
		private int bookReviewCount;


		//생성자
		public BookdetailVo() {}

		public BookdetailVo(int bookReviewCount) {
			super();
			this.bookReviewCount = bookReviewCount;
		}

		public BookdetailVo(String bookTitle, String author, String bookUrl, String coverUrl) {
			super();
			this.bookTitle = bookTitle;
			this.author = author;
			this.bookUrl = bookUrl;
			this.coverUrl = coverUrl;
		}

		public BookdetailVo(String bookNo, String bookTitle, String author, String bookUrl, String coverUrl,
				int bookReviewCount) {
			super();
			this.bookNo = bookNo;
			this.bookTitle = bookTitle;
			this.author = author;
			this.bookUrl = bookUrl;
			this.coverUrl = coverUrl;
			this.bookReviewCount = bookReviewCount;
		}


		//메소드g,s

		public String getBookNo() {
			return bookNo;
		}

		public void setBookNo(String bookNo) {
			this.bookNo = bookNo;
		}

		public String getBookTitle() {
			return bookTitle;
		}

		public void setBookTitle(String bookTitle) {
			this.bookTitle = bookTitle;
		}

		public String getAuthor() {
			return author;
		}

		public void setAuthor(String author) {
			this.author = author;
		}

		public String getBookUrl() {
			return bookUrl;
		}

		public void setBookUrl(String bookUrl) {
			this.bookUrl = bookUrl;
		}

		public String getCoverUrl() {
			return coverUrl;
		}

		public void setCoverUrl(String coverUrl) {
			this.coverUrl = coverUrl;
		}

		public int getBookReviewCount() {
			return bookReviewCount;
		}

		public void setBookReviewCount(int bookReviewCount) {
			this.bookReviewCount = bookReviewCount;
		}

		//메소드 일반

		@Override
		public String toString() {
			return "BookVo [bookNo=" + bookNo + ", bookTitle=" + bookTitle + ", author=" + author + ", bookUrl=" + bookUrl
					+ ", coverUrl=" + coverUrl + ", bookReviewCount=" + bookReviewCount + "]";
		}
	
	
	
}
