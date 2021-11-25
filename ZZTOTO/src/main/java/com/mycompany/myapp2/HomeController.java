package com.mycompany.myapp2;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
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
