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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.domain.Drone_prevention;
import com.mycompany.domain.Farm_diary;
import com.mycompany.domain.Member;
import com.mycompany.domain.User_pestfile;
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

	@RequestMapping("/farm_diary.do")
	public String farm_diary() {
		return "farm_diary";
	}

	@RequestMapping("/droneInsert.do")
   public String droneInsert(Drone_prevention vo) {
	   System.out.println("test");
		mapper.droneInsert(vo);
	   
	   return "redirect:/drone.do"; // redirect: ViewResolver �� �������� �ʴ´�
	  
   }

	// �α��� ó��
	@RequestMapping("/login.do")
	public @ResponseBody Member login(Member member, HttpSession session) {
		Member vo = mapper.login(member);
		
		if (vo != null) { // �α��� ����
			session.setAttribute("vo", vo);
		} else { // �α��� ���н� ȸ������
			vo = mapper.join(member);
			vo = mapper.login(member);
			session.setAttribute("vo", vo);
		}
		return vo;
	}

	// �α׾ƿ� ó��
	@RequestMapping("logout.do")
	public String boardLogout(HttpSession session) {
		session.invalidate();	// ���ǹ�ȿȭ
		return "redirect:/main.do";
	}
	
	// AjaxȰ�� ���� ���ε� ��� :
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<User_pestfile>> uploadAjaxAction(MultipartFile[] uploadFile) {

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
		List<User_pestfile> list = new ArrayList();

		/* ���� ���� */
		for (MultipartFile multipartFile : uploadFile) {

			/* �̹��� ���� ��ü */
			User_pestfile pf = new User_pestfile();

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

		ResponseEntity<List<User_pestfile>> result = new ResponseEntity<List<User_pestfile>>(list, HttpStatus.OK);
		return result;
	}
	   @RequestMapping("/Farm_diaryList.do")
	   public @ResponseBody List<Farm_diary> Farm_diaryList(Model model) {
	      List<Farm_diary> list = mapper.Farm_diaryList();
	      return list;  // json(*)
	   }
	   
		@RequestMapping("/Farmlogin.do")
		public String Farmlogin(Member member_Id, HttpSession session) {
			Member vo = mapper.login(member_Id);
			System.out.println("������� ����");
			System.out.println("member_Id");
			if (vo != null) { // �α��� ����
				session.setAttribute("vo", vo);
				System.out.println("�̰Ŵ�?");
			} else { // �α��� ���н� ȸ������
				vo = mapper.join(member_Id);
				session.setAttribute("vo", vo);
				System.out.println("�� �����ΰ�");

				return null;
			}
			return "redirect:/farm_diary.do";
		}
	   
	   @RequestMapping("/diaryInsertAjax.do")
	   public @ResponseBody String diaryInsertAjax(Farm_diary vo) {
	      mapper.diaryInsertAjax(vo);
	      return "ok";
	   }
	   
	   @RequestMapping("/diaryDeleteAjax.do")
	   public @ResponseBody void diaryDeleteAjax(int diary_num) {
		   mapper.diaryDeleteAjax(diary_num);
	   }
	   
	   @RequestMapping("/diaryUpdateAjax.do")
	   public @ResponseBody void diaryUpdateAjax(Farm_diary vo) {
	      mapper.diaryUpdateAjax(vo);
	   }
	   @RequestMapping("/diaryUpdateAjax1.do")
	   public @ResponseBody void diaryUpdateAjax1(Farm_diary vo) {
		   System.out.println("������Ʈ1?");
	      mapper.diaryUpdateAjax1(vo);
	   }
}
