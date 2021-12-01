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
	   
	   return "redirect:/drone.do"; // redirect: ViewResolver 가 동작하지 않는다
	  
   }

	// 로그인처리
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session) {
		Member vo = mapper.login(member);

		if (vo != null) { // 로그인 성공
			session.setAttribute("vo", vo);
		} else { // 로그인 실패시 회원가입
			vo = mapper.join(member);
			session.setAttribute("vo", vo);

			return null;
		}
		return "redirect:/index.do";
	}

	// Ajax활용 파일 업로드 기능 :
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Pest_file>> uploadAjaxAction(MultipartFile[] uploadFile) {

		// 날짜별 폴더 생성
		String uploadFolder = "C:\\upload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 이미지 정보 담는 객체 */
		List<Pest_file> list = new ArrayList();

		/* 파일 생성 */
		for (MultipartFile multipartFile : uploadFile) {

			/* 이미지 정보 객체 */
			Pest_file pf = new Pest_file();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			pf.setFileName(uploadFileName);
			pf.setUploadPath(datePath);

			/* uuid 적용 파일 이름 : 파일이름이 겹치면 덮어씌워지는 현상 막기 위해 식별자 추가 */
			String uuid = UUID.randomUUID().toString();
			pf.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
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
