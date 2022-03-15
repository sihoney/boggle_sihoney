package com.javaex.vo;

public class PlaylistVo {
	
	private int playlistNo;
	private int userNo;
	private String nickname;
	private String playlistDate;
	private String playlistName;
	
	
	public PlaylistVo() {}
	public PlaylistVo(int playlistNo, int userNo, String nickname, String playlistDate, String playlistName) {
		super();
		this.playlistNo = playlistNo;
		this.userNo = userNo;
		this.nickname = nickname;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	@Override
	public String toString() {
		return "PlaylistVo [playlistNo=" + playlistNo + ", userNo=" + userNo + ", nickname=" + nickname
				+ ", playlistDate=" + playlistDate + ", playlistName=" + playlistName + "]";
	}
	
	
}
