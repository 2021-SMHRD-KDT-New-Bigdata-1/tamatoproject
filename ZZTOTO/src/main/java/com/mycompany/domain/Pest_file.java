package com.mycompany.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pest_file {
	
	/* ���� ��ȣ */
	private int file_num;

	/* ȸ�� ���������� */
	private int m_pest_num;
	
	/* ��� */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* ���� �̸� */
	private String fileName;


	
	
	
}
