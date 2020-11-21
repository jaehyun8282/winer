package com.ch.winer.model;
import java.sql.Date;
import lombok.Data;
@Data
public class Wmember {
	private String id;
	private String password;
	private String name;
	private String tel;
	private String addr1;
	private String addr2;
	private String addr3;
	private String email;
	private Date birthday;
	private Date reg_date;
	// 리스트 출력
	private int startRow;
	private int endRow;
}
  