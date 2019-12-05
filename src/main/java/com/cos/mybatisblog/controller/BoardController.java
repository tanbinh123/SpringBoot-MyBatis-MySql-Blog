package com.cos.mybatisblog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.mybatisblog.model.Board;
import com.cos.mybatisblog.model.User;
import com.cos.mybatisblog.repository.BoardRepository;
import com.cos.mybatisblog.utils.Script;
import com.cos.mybatisblog.utils.Utils;

//Model은 데이터를 Controller에서 Presentation 계층(View:jsp)까지 들고간다

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardRepository boardRepository;

	@GetMapping("")
	public String postList(Model model) {
		List<Board> boards = boardRepository.findAll(1);
		model.addAttribute("boards", boards);
		// webapp/WEB-INF/views/post/list.jsp
		return "redirect:/board/list/1";
	}

	@GetMapping("/list/{page}")
	public String boardList(Model model, @PathVariable int page) {
		model.addAttribute("page", page);
		page = page - 1;
		page = page * 3;
		List<Board> boards = boardRepository.findAll(page);
		Utils.setPreviewImg(boards); // 이미지를 previewImg에 저장
		Utils.setPreviewContent(boards); // 이미지 태그 제거
		model.addAttribute("boards", boards);
		// webapp/WEB-INF/views/post/list.jsp
		return "board/list";
	}

	@GetMapping("/detail/{id}")
	public String post(@PathVariable int id, Model model) {
		try {
			Board board = boardRepository.findById(id);
			model.addAttribute(board);
			return "/board/detail";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}

	@GetMapping("/writeForm")
	public String writeForm() {
		return "board/writeForm";
	}

	@PostMapping("/write")
	public String save(Board board, HttpSession session) {
		User user = (User) session.getAttribute("user");
		board.setUserId(user.getId());
		board.setUsername(user.getUsername());
		board.setUserProfile(user.getUserProfile());
		Utils.setPreviewYoutube(board);
		try {
			boardRepository.save(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}

	@PostMapping("/delete")
	public @ResponseBody String detele(int id, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user.getId() != id) {
			return Script.Back("권한이 없습니다.");
		}

		try {
			boardRepository.delete(id);
			return Script.alertAndHref("삭제되었습니다", "/board");
		} catch (Exception e) {
			e.printStackTrace();
			return Script.Back("삭제 실패");
		}
	}

	@GetMapping("/updateForm/{id}")
	public String updateForm(@PathVariable int id, Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user.getId() != id) {
			return Script.Back("권한이 없습니다.");
		}

		Board board = boardRepository.findById(id);
		model.addAttribute("board", board);
		return "board/updateForm";
	}

	@PostMapping("/update")
	public String update(Board board, HttpSession session) { // param, form

		User user = (User) session.getAttribute("user");
		if (user.getId() != board.getId()) {
			return Script.Back("권한이 없습니다.");
		}

		try {
			boardRepository.update(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board";
	}

}
