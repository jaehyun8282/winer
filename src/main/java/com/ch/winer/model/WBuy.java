package com.ch.winer.model;
import java.util.Date;
import lombok.Data;
@Data
public class WBuy {
	private int buy_id;
	private String id;
	private int p_id;
	private String p_name;			
	private String p_image;
	private Date buy_date;			
	private String delivery_name;
	private String delivery_addr; 	
	private String delivery_tel;	
	private String buy_state;	
}
 