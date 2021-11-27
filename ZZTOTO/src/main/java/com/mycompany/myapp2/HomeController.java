package com.mycompany.myapp2;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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

	@RequestMapping("/drone.do")
	public String drone() {
		return "drone";
	}

	@RequestMapping("/news.do")
	public String news() {
		return "news";
	}

	// AjaxȰ�� ���� ���ε� ���
	@RequestMapping("/uploadAjaxAction")
	public void uploadAjaxAction(MultipartFile[] uploadFile) {

		// ��¥�� ���� ����
		String uploadFolder = "C:\\upload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* ���� ���� */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* ���� ���� */
		for (MultipartFile multipartFile : uploadFile) {
			
			/* ���� �̸� */
			String uploadFileName = multipartFile.getOriginalFilename();

			/* uuid ���� ���� �̸� : �����̸��� ��ġ�� ��������� ���� ���� ���� �ĺ��� �߰� */
			String uuid = UUID.randomUUID().toString();
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* ���� ��ġ, ���� �̸��� ��ģ File ��ü */
			File saveFile = new File(uploadPath, uploadFileName);

			/* ���� ���� */
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
