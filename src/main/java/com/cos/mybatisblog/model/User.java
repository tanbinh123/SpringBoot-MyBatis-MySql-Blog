package com.cos.mybatisblog.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int id;
	private String userProfile; //이미지 경로 (파일 업로드) uuid
	private String username;
	private String password;
	private String email;
	private String address; //주소 추가
	private Timestamp createDate;
	
}