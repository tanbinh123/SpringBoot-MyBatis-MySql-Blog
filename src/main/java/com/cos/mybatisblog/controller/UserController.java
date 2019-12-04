package com.cos.mybatisblog.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

	@Value("${file.path}") 
	private String resourcePath;
	
	@PostMapping("/profileUpdate")
	public @ResponseBody String imageUpload(
			@RequestParam("file") MultipartFile file,HttpSession session) {
	
		UUID uuid = UUID.randomUUID();
		String uuidFileName = uuid+"_"+file.getOriginalFilename();
		
		Path filePath = Paths.get(resourcePath+uuidFileName);
		System.out.println("filePath : "+filePath);
		try {
			Files.write(filePath, file.getBytes());
			User user = (User)session.getAttribute("user");
			user.setUserProfile("/userProfile/" + uuidFileName);
			uRepo.updateUserProFile(user);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return Script.href("/board");
	}


}
