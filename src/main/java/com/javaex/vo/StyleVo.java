package com.javaex.vo;

public class StyleVo {
	
	private int styleNo;
	private int emoNo;
	private String styleName;
	
	
	public StyleVo() {}
	public StyleVo(int styleNo, int emoNo, String styleName) {
		super();
		this.styleNo = styleNo;
		this.emoNo = emoNo;
		this.styleName = styleName;
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
	
	
	
	@Override
	public String toString() {
		return "StyleVo [styleNo=" + styleNo + ", emoNo=" + emoNo + ", styleName=" + styleName + "]";
	}
	
}
