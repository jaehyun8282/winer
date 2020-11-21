package com.ch.winer.model;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Wproduct {
	private int p_id;
	private String p_category;
	private String p_name;
	private String p_sname;
	private int p_price;
	private int p_sale;
	private String p_image;
	private String p_info;
	private int p_count;
	private Date p_date;
	// 페이징 작업
	private int startRow;
	private int endRow;
	// 이미지 업로드 작업
	private MultipartFile file1; // 상품이미지
	private MultipartFile file2; // 상품이미지
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name; 
	}
	public String getP_sname() {
		return p_sname;
	}
	public void setP_sname(String p_sname) {
		this.p_sname = p_sname;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_sale() {
		return p_sale;
	}
	public void setP_sale(int p_sale) {
		this.p_sale = p_sale;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	
	}
