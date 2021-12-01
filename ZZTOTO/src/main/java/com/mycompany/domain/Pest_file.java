package com.mycompany.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pest_file {
	
	/* 파일 번호 */
	private int file_num;

	/* 회원 병충해정보 */
	private int m_pest_num;
	
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;


	
	
	
}
