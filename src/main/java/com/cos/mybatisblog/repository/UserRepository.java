package com.cos.mybatisblog.repository;

import com.cos.mybatisblog.model.Board;
import com.cos.mybatisblog.model.User;

public interface UserRepository {
	User findByUsernameAndPassword(User user); //로그인
	void save(User user);
	void updateUserProFile(User user);
}
