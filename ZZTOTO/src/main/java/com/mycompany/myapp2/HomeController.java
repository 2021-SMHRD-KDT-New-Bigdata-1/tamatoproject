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
	
	/**
	 * �����±׸� ���� ���±�
	 * @return
	 */
	@RequestMapping(value="/formFile")
	public String formFile() {
		return "formFile";
	}

	/**
	 * ����ó�� ��Ʈ�ѷ�
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="/saveImage")
	public String saveImage(Vo vo) {
		try {
			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("img", vo.getImgFile().getBytes());
			mapper.saveImage(hmap);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/formFile";
	}
	
}
