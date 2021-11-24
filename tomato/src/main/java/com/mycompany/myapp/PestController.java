package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mapper.PestMapper;

@Controller
public class PestController {
	@Autowired
	PestMapper mapper;
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
}
