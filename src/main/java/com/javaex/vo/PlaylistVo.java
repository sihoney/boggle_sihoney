package com.javaex.vo;

public class PlaylistVo {
	
	private int playlistNo;
	private int userNo;
	private String playlistDate;
	private String playlistName;
	
	
	public PlaylistVo() {}
	public PlaylistVo(int playlistNo, int userNo, String playlistDate, String playlistName) {
		super();
		this.playlistNo = playlistNo;
		this.userNo = userNo;
		this.playlistDate = playlistDate;
		this.playlistName = playlistName;
	}



	public int getPlaylistNo() {
		return playlistNo;
	}
	public void setPlaylistNo(int playlistNo) {
		this.playlistNo = playlistNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getPlaylistDate() {
		return playlistDate;
	}
	public void setPlaylistDate(String playlistDate) {
		this.playlistDate = playlistDate;
	}
	public String getPlaylistName() {
		return playlistName;
	}
	public void setPlaylistName(String playlistName) {
		this.playlistName = playlistName;
	}



	@Override
	public String toString() {
		return "PlaylistVo [playlistNo=" + playlistNo + ", userNo=" + userNo + ", playlistDate=" + playlistDate
				+ ", playlistName=" + playlistName + "]";
	}
	
	
	
	
}
