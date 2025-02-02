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
		mapper.droneInsert(vo);

		return "redirect:/drone.do";

	}

	@RequestMapping("/login.do")
	public @ResponseBody Member login(Member member, HttpSession session) {
		Member vo = mapper.login(member);

		if (vo != null) {
			session.setAttribute("vo", vo);
		} else {
			vo = mapper.join(member);
			vo = mapper.login(member);
			session.setAttribute("vo", vo);
		}
		return vo;
	}

	// 로그아웃 처리
	@RequestMapping("logout.do")
	public String boardLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}

	// Ajax활용 파일 업로드 기능 : 딥러닝용, DB용 2가지
	@PostMapping(value = "/uploadAjaxAction.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<User_pestfile>> uploadAjaxAction(MultipartFile[] uploadFile, HttpSession session) {
		Member vo = (Member) session.getAttribute("vo");

		// 딥러닝용 폴더, DB저장용 날짜별 폴더 생성
		String uploadFolder_Django = "C:/Users/smhrd/worksapce2/env/piton/darknet_api/build/darknet/x64/";
		String uploadFolder_DB = "C:\\upload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);

		// 폴더 생성
		File uploadPath_Django = new File(uploadFolder_Django);
		File uploadPath_DB = new File(uploadFolder_DB, datePath);
		String uploadPath = uploadFolder_DB + datePath;

		if (uploadPath_DB.exists() == false) {
			uploadPath_DB.mkdirs();
		}

		// 이미지 정보 담는 객체
		List<User_pestfile> list = new ArrayList();

		/* 파일 생성 */
		for (MultipartFile multipartFile : uploadFile) {

			// 이미지 정보 객체
			User_pestfile pf = new User_pestfile();

			// 파일 이름
			String uploadFileName_Django = "camera2.png";
			String uploadFileName_DB = multipartFile.getOriginalFilename();

			pf.setFileName(uploadFileName_DB);
			pf.setUploadPath(datePath);

			// uuid 적용 파일 이름 : 파일이름이 겹치면 덮어씌워지는 현상 막기 위해 식별자 추가
			String uuid = UUID.randomUUID().toString();
			pf.setUuid(uuid);

			uploadFileName_DB = uuid + "_" + uploadFileName_DB;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile_Django = new File(uploadPath_Django, uploadFileName_Django);
			File saveFile_DB = new File(uploadPath_DB, uploadFileName_DB);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile_Django);
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				multipartFile.transferTo(saveFile_DB);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// DB에 저장
			User_pestfile pestfile = new User_pestfile();
			pestfile.setM_pest_num(2);
			pestfile.setReg_date(str);
			pestfile.setMember_id(vo.getMember_id());
			pestfile.setUploadPath(uploadPath);
			pestfile.setUuid(uuid);
			pestfile.setFileName(multipartFile.getOriginalFilename());

			mapper.pestfile_add(pestfile);
			list.add(pf);
		} // for

		ResponseEntity<List<User_pestfile>> result = new ResponseEntity<List<User_pestfile>>(list, HttpStatus.OK);
		return result;

	}

	@RequestMapping("/Farm_diaryList.do")
	public @ResponseBody List<Farm_diary> Farm_diaryList(Model model) {
		List<Farm_diary> list = mapper.Farm_diaryList();
		return list; // json(*)
	}

	@RequestMapping("/Farmlogin.do")
	public String Farmlogin(Member member_Id, HttpSession session) {
		Member vo = mapper.login(member_Id);
		if (vo != null) {
			session.setAttribute("vo", vo);
		} else {
			vo = mapper.join(member_Id);
			session.setAttribute("vo", vo);

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
		mapper.diaryUpdateAjax1(vo);
	}

	@RequestMapping("/Loding.do")
	public String loding() {
		return "Loding";
	}
}