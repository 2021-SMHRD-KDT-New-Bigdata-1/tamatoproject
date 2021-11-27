package com.mycompany.myapp2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mapper.PestMapper;

@Controller
public class HomeController {
	
	@Autowired
	private PestMapper mapper;
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/deep.do")
	public String deep() {
		return "deep";
	}
	
	@RequestMapping("/notification.do")
	public String notification() {
		return "notification";
	}
	
	@RequestMapping("/news.do")
	public String news() {
		return "news";
	}
	
}
