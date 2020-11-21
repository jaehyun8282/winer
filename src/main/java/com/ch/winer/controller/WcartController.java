package com.ch.winer.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.winer.model.Wcart;
import com.ch.winer.model.Wmember;
import com.ch.winer.model.Wproduct;
import com.ch.winer.service.WcartService;
import com.ch.winer.service.WmemberService;
import com.ch.winer.service.WproductService;

@Controller
public class WcartController {
	@Autowired
	private WcartService ws;
	
	@Autowired
	private WmemberService wms;
	
	@Autowired
	private WproductService wps;
	
	@RequestMapping("wcart")
	public String wcart(Model model, Wcart wcart, HttpSession session) {
		int result = 0;
		String id = (String)session.getAttribute("id");
		wcart.setId(id);
		String chkId = ws.selectId(wcart);
		String ct_del = ws.selectDel(wcart);
		System.out.println(ct_del);
		if (chkId == null || chkId.equals("")) {
			result = ws.insert(wcart);
		} else if (ct_del.equals("y")) {
			result = ws.insert(wcart);
		} else {
			result = ws.update(wcart);
		}
		model.addAttribute("wcart", wcart);
		model.addAttribute("result", result);
		return "wcart/wcart";
	}
	@RequestMapping("wcartList")
	public String wcartList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Wcart> wcart = ws.list(id);
		model.addAttribute("wcart", wcart);
		return "wcart/wcartList";
	}
	@RequestMapping("wcartDelete")
	public String wcartDelete(Model model, String userid, HttpSession session) {
		int result = 0;
		String[] ct_string = userid.split("-");
		int[] ct_id = new int[ct_string.length];
		for (int i=0; i<ct_string.length; i++) {
			ct_id[i] = Integer.parseInt(ct_string[i]);
		}
		try {
			for (int j = 0; j < ct_id.length; j++) {
				result = ws.delete(ct_id[j]);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		model.addAttribute("result", result);
		return "wcart/wcartDelete";
	}
	@RequestMapping("wbuyForm")
	public String wbuyForm(Model model, String userid, HttpSession session, String cnt, int tot) {
		int result=0;
		String id=(String) session.getAttribute("id");		
		List<Wcart> info = new ArrayList<Wcart>();
		String[] ct_string = userid.split("-");
		int [] ct_id = new int[ct_string.length];		
		for(int i=0; i<ct_string.length; i++) {
			ct_id[i] = Integer.parseInt(ct_string[i]);
		}
		String[] ct_cnt = cnt.split("-");
		int [] ct_count = new int[ct_cnt.length];		
		for(int i=0; i<ct_cnt.length; i++) {
			ct_count[i] = Integer.parseInt(ct_cnt[i]);
		}
		try {
			for(int i=0; i<ct_count.length; i++) {
				result = ws.updateCnt(ct_count[i],ct_id[i]);
			}
		    for(int j=0; j<ct_id.length; j++) {		    	
		    	info.add(ws.info(ct_id[j]));
		    }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		Wmember member = wms.select(id);
		model.addAttribute("userid",userid);
		model.addAttribute("member",member);
		model.addAttribute("tot",tot);
		model.addAttribute("info",info);
		model.addAttribute("result",result);
		return "wbuy/wbuyForm";
	}
	@RequestMapping("wbuyNowForm")
	public String wbuyNowForm(Model model ,Wcart wcart, HttpSession session, int tot){		
		String id=(String)session.getAttribute("id");
		wcart.setId(id);		
		int result=ws.insert(wcart);
		System.out.println("wcart 등록 성공 했냐 안했냐"+result);
		Wcart wc = ws.content(wcart);
		Wcart wc2 = ws.info(wc.getCt_id());		
		List<Wcart> info=new ArrayList<Wcart>();
		info.add(wc2);
		Wmember member=wms.select(id);
		String userid = wc2.getCt_id()+"-";
		
		model.addAttribute("userid",userid);
		model.addAttribute("tot",tot);
		model.addAttribute("member",member);
		model.addAttribute("info",info);
		return "wbuy/wbuyForm";
	}
}
