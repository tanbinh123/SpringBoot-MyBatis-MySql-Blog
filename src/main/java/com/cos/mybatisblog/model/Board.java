package com.cos.mybatisblog.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int id; //PK
	private int userId; //FK
	private String title;
	private String content;
	private int readCount;
	private Timestamp createDate;
	private String username; //DB랑 상관X
	private String email; //DB랑 상관X
	private String userProfile; //DB랑 상관X
}