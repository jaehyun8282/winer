package com.ch.winer.model;
import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;
@Data
public class Wboard {
	private int num;
	private String b_id;
	private String subject;
	private String content;
	private String b_image;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level; 
	private Date re_date;
	private String del;
	//페이징용
	private int startRow;
	private int endRow;
	//검색용
	private String search;
	private String keyword;
	//이름
	private String name;
	//이미지
	private MultipartFile file1;
}