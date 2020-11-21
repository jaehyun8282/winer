package com.ch.winer.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.winer.model.Wmember;
import com.ch.winer.service.PagingBean;
import com.ch.winer.service.WmemberService;
@Controller
public class WmemberController {
	@Autowired
	private WmemberService ws;
	
	@RequestMapping("joinForm")
	public String joinForm(String id, Model model) {
		model.addAttribute("id", id);
		return "wmember/joinForm";
	}
	
	@RequestMapping("join")
	public String join(Wmember wm, Model model) {
		/*
		 * String addr = wm.getAddr1()+wm.getAddr2()+wm.getAddr3(); wm.setAddr(addr);
		 */
		int result = ws.insert(wm);
		model.addAttribute("result", result);
		return "wmember/join";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "wmember/loginForm";
	}
	
	@RequestMapping("login")
	public String login(Wmember wm, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		int result = ws.login(id,password);
		
		if (result > 0) {
			model.addAttribute("result", result);
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			session.setAttribute("name", name);
			
		} else {
			model.addAttribute("result", result);
		}
		return "wmember/login";
	}
	@RequestMapping("logout")
	public String logout() {
		return "wmember/logout";
	}
	
	@RequestMapping(value="idChk",produces="text/html;charset=utf-8")
	@ResponseBody  // jsp프로그램을 이용하지 않고 바로 본문을 전달
	public String idChk(String id) {
		String msg = ""; 
		Wmember wm = ws.select(id); 
		if (wm == null) msg="사용 가능한 ID입니다."; 
		else msg="이미 있는 ID입니다.";
		return msg;
	}
	
	@RequestMapping("wmMypage")
	public String mypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if (id.equals("master")) {
			Wmember wm = ws.wmMypage(id);
			model.addAttribute("wm", wm);
			return "wadmin/adminPage";
		}
		Wmember wm = ws.wmMypage(id);
		model.addAttribute("wm", wm);
		model.addAttribute("id", id);
		return "wmember/wmMypage";
		
		/*
		 * if (id == null || id.equals("")) { return "redirect:/loginForm"; }else {
		 * return "wmember/wmMypage"; }
		 */
	}
	@RequestMapping("wmemberForm")
	public String wmemberForm(String id,HttpSession session, Model model) {
		//String id = (String) session.getAttribute("id");
		Wmember wm = ws.wmemberForm(id);
		model.addAttribute("wm", wm);
		model.addAttribute("id", id);
		return "wmember/wmemberForm";
	}
	
	@RequestMapping("wmupdateForm")
	public String wmupdateForm(String id,Model model, HttpSession session) {
	//	String id = (String) session.getAttribute("id");
		Wmember wmember = ws.select(id);
		model.addAttribute("wmember", wmember);
		return "wmember/wmupdateForm";
	}
	@RequestMapping("wmupdate")
	public String update(Wmember wm, Model model, HttpServletRequest request) {
		/*
		 * String addr = wm.getAddr1()+wm.getAddr2()+wm.getAddr3(); wm.setAddr(addr);
		 */
		int result = ws.wmupdate(wm);
		model.addAttribute("result", result);
		return "wmember/wmupdate";
	}
	@RequestMapping("wmLeave")
	public String wmLeave(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		int result = ws.wmLeave(id);
		model.addAttribute("result", result);
		return "wmember/wmLeave";
	}
	@RequestMapping("memberAdmin")
	public String memberAdmin(String pageNum, Wmember wm, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = ws.getTotalRecordMember(); // 검색
		int startRow = (currentPage -1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage -1;
		PagingBean pb = new PagingBean(total, rowPerPage, currentPage);
		wm.setStartRow(startRow);
		wm.setEndRow(endRow);
		int no = total - startRow +1;
		List<Wmember> list = ws.wmList(wm);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pb", pb);
		return "wadmin/memberAdmin";
	}
	@RequestMapping("wmDelete")
	public String wmDelete(Model model, String id) {
		int result = ws.wmDelete(id);
		model.addAttribute("result", result);
		return "wadmin/wmDelete";
	}
}
