package com.cos.mybatisblog.repository;

import java.util.List;

import com.cos.mybatisblog.model.Board;

public interface BoardRepository {
	List<Board> findAll(int id); //3건씩 출력
	void save(Board board); //글쓰기
	void update(Board board); //수정하기
	Board findById(int id); //상세보기
	void delete(int id); //삭제하기
}
