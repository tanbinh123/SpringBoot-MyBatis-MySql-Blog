package com.cos.mybatisblog.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cos.mybatisblog.model.User;
import com.cos.mybatisblog.repository.UserRepository;
import com.cos.mybatisblog.utils.Script;

//Model은 데이터를 Controller에서 Presentation 계층(View:jsp)까지 들고간다

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository uRepo;

	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	@PostMapping("/login")
	public @ResponseBody String login(User user, HttpSession session) {
		User u = uRepo.findByUsernameAndPassword(user);
		if (u != null) {
			session.setAttribute("user", u);
			return Script.href("/board");
		} else {
			return Script.Back("로그인 실패!");
		}
	}

	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}

	@PostMapping("/join")
	public @ResponseBody String join(User user) {
		try {
			uRepo.save(user);
			return Script.alertAndHref("환영합니다 " + user.getUsername() + " 님^^", "/user/loginForm");
		} catch (Exception e) {
			return Script.Back("회원가입 실패");
		}
	}

	@GetMapping("/logout")
	public @ResponseBody String logout(HttpSession session) {
		session.invalidate();
		return Script.alertAndHref("로그아웃 되었습니다!", "/board");
	}

	@GetMapping("/profileUpdateForm")
	public String profileUpdateForm() {
		return "user/profileUpdateForm";
	}
	
	//나중에 해야함

	@PostMapping("/profileUpdate")
	public @ResponseBody String profileUpdate(HttpSession session, MultipartHttpServletRequest mtfRequest) {

		MultipartFile mf = mtfRequest.getFile("userProfile");
		String path = mtfRequest.getRealPath("/resources/static/userProfile");
		path = path + "\\";
		String path2 = "C:/workspace/springWork/mybatis-blog/src/main/webapp/resources/static/userProfile/";
		String safeFile = path2 + System.currentTimeMillis() + mf.getOriginalFilename();
		try {
			mf.transferTo(new File(safeFile));
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return "test";
	}

}
