package com.cos.mybatisblog.utils;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.cos.mybatisblog.model.Board;


public class Utils {

	// 미리 보기 내용을 세팅하기
	public static void setPreviewContent(List<Board> boards) {

		for (Board board : boards) {
			Document doc = Jsoup.parse(board.getContent());
			Elements ets = doc.select("img");

			if (ets != null) {
				for (Element et : ets) {
					et.remove();
				}
			}
			board.setContent(doc.toString());
		}

	}

	// 미리 보기 이미지 세팅하기
	public static void setPreviewImg(List<Board> boards) {
		for (Board board : boards) {
			Document doc = Jsoup.parse(board.getContent());
			Elements etyoutube = doc.select("a");
			Element et = doc.selectFirst("img");
			String thumbnail = "";
			if (etyoutube != null) {
				for (Element element : etyoutube) {
					String href = element.attr("href");
					if (href.contains("https://www.youtube.com/watch") && !element.text().equals("")) {
						String video[] = href.split("=");
						String v = video[1];
						thumbnail = "http://i.ytimg.com/vi/" + v + "/0.jpg";
						board.setPreviewImg(thumbnail);
						break;
					}
				}
			}

			if (et != null) {
				String previewImg = et.attr("src");// 이미지 소스 찾기
				board.setPreviewImg(previewImg);
			} else {
				board.setPreviewImg("/boardImg/default.jpg");
			}

		}
	}

	// 유튜브 detail에서 미리보기 세팅하기
	public static void setPreviewYoutube(Board board) {
		Document doc = Jsoup.parse(board.getContent());
		Elements ets = doc.select("a");

		if (ets != null) {
			for (Element et : ets) {
				String href = et.attr("href");
				// et.text().equals() 하는 이유는 섬머노트 a태그 중복 버그 때문에!!
				if (href.contains("https://www.youtube.com/watch") && !et.text().equals("")) {
					String video[] = href.split("=");
					String v = video[1];
					String iframe = "<iframe src='https://www.youtube.com/embed/" + v
							+ "' width='600px' height='350px' allowfullscreen/>";
					et.after(iframe);
				}
			}
			board.setContent(doc.toString()); // board 완성
		}
	}





}