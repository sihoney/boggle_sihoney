package com.javaex.vo;

public class StyleVo {
	
	private int styleNo;
	private int emoNo;
	private String styleName;
	private String emoName;
	
	
	public StyleVo() {}
	public StyleVo(int styleNo, int emoNo, String styleName, String emoName) {
		super();
		this.styleNo = styleNo;
		this.emoNo = emoNo;
		this.styleName = styleName;
		this.emoName = emoName;
	}



	public int getStyleNo() {
		return styleNo;
	}
	public void setStyleNo(int styleNo) {
		this.styleNo = styleNo;
	}
	public int getEmoNo() {
		return emoNo;
	}
	public void setEmoNo(int emoNo) {
		this.emoNo = emoNo;
	}
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	public String getEmoName() {
		return emoName;
	}
	public void setEmoName(String emoName) {
		this.emoName = emoName;
	}
	
	
	
	@Override
	public String toString() {
		return "StyleVo [styleNo=" + styleNo + ", emoNo=" + emoNo + ", styleName=" + styleName + ", emoName=" + emoName
				+ "]";
	}
	
}
