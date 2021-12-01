package com.mycompany.myapp2;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.domain.Drone_prevention;

import com.mycompany.domain.Member;
import com.mycompany.domain.Pest_file;
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

	@RequestMapping("/drone.do")
	public String drone() {
		return "drone";
	}

	@RequestMapping("/news.do")
	public String news() {
		return "news";
	}
	

	@RequestMapping("/droneInsert.do")
   public String droneInsert(Drone_prevention vo) {
	   System.out.println("test");
		mapper.droneInsert(vo);
	   
	   return "redirect:/drone.do"; // redirect: ViewResolver �� �������� �ʴ´�
	  
   }

	// �α���ó��
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session) {
		Member vo = mapper.login(member);

		if (vo != null) { // �α��� ����
			session.setAttribute("vo", vo);
		} else { // �α��� ���н� ȸ������
			vo = mapper.join(member);
			session.setAttribute("vo", vo);

			return null;
		}
		return "redirect:/index.do";
	}

	// AjaxȰ�� ���� ���ε� ��� :
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Pest_file>> uploadAjaxAction(MultipartFile[] uploadFile) {

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

		/* �̹��� ���� ��� ��ü */
		List<Pest_file> list = new ArrayList();

		/* ���� ���� */
		for (MultipartFile multipartFile : uploadFile) {

			/* �̹��� ���� ��ü */
			Pest_file pf = new Pest_file();

			/* ���� �̸� */
			String uploadFileName = multipartFile.getOriginalFilename();
			pf.setFileName(uploadFileName);
			pf.setUploadPath(datePath);

			/* uuid ���� ���� �̸� : �����̸��� ��ġ�� ��������� ���� ���� ���� �ĺ��� �߰� */
			String uuid = UUID.randomUUID().toString();
			pf.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* ���� ��ġ, ���� �̸��� ��ģ File ��ü */
			File saveFile = new File(uploadPath, uploadFileName);

			/* ���� ���� */
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(pf);
		} // for

		ResponseEntity<List<Pest_file>> result = new ResponseEntity<List<Pest_file>>(list, HttpStatus.OK);
		return result;
	}
}
