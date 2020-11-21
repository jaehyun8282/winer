package com.ch.winer.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.winer.model.Wproduct;
import com.ch.winer.service.PagingBean;
import com.ch.winer.service.WproductService;

@Controller
public class WproductController {
	@Autowired
	private WproductService wps;
	@RequestMapping("wproductList")
	public String wproductList(String pageNum, Wproduct wp, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = wps.getTotalRecordProduct(); // 검색
		int startRow = (currentPage -1) * rowPerPage +1;
		int endRow = startRow + rowPerPage -1;
		PagingBean pp = new PagingBean(total, rowPerPage, currentPage);
		wp.setStartRow(startRow);
		wp.setEndRow(endRow);
		int no = total - startRow +1;
		List<Wproduct> list = wps.list(wp);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		return "wproduct/wproductList";
	}
	@RequestMapping("wproductForm")
	public String wproductForm() {
		return "wproduct/wproductForm";
	}
	@RequestMapping("wproduct")
	public String wproduct(Wproduct wproduct, Model model, HttpServletRequest request, HttpSession session) {
//		String id=(String) session.getAttribute("id");
		System.out.println("p_id="+wproduct.getP_id());
		System.out.println("p_category="+wproduct.getP_category());
		System.out.println("p_name="+wproduct.getP_name());
		System.out.println("p_sname="+wproduct.getP_sname());
		System.out.println("p_price="+wproduct.getP_price());
		System.out.println("p_sale="+wproduct.getP_sale());
		System.out.println("p_image="+wproduct.getP_image());
		System.out.println("p_info="+wproduct.getP_info());
		System.out.println("p_count="+wproduct.getP_count());
		System.out.println("file1="+wproduct.getFile1());
		System.out.println("file2="+wproduct.getFile2());
		String real = request.getSession().getServletContext().getRealPath("/WEB-INF/images");
		if (wproduct.getFile1()!=null && !wproduct.getFile1().isEmpty()) {
			String p_image = wproduct.getFile1().getOriginalFilename();
			wproduct.setP_image(p_image);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(wproduct.getFile1(), real, p_image);
		}

		if (wproduct.getFile2() != null && !wproduct.getFile2().isEmpty()) {
			String p_info = wproduct.getFile2().getOriginalFilename();
			wproduct.setP_info(p_info);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(wproduct.getFile2(), real, p_info);
		}
		
		int result = wps.insert(wproduct);
		model.addAttribute("result", result);
		return "wproduct/wproduct";
	}
	@RequestMapping("wproductUpdateForm")
	public String wproductUpdateForm(Model model, int p_id) {
		Wproduct wproduct = wps.pdContent(p_id);
		model.addAttribute("list", wproduct);
		model.addAttribute("p_id", p_id);
		return "wproduct/wproductUpdateForm";
	}
	@RequestMapping("wproductUpdate")
	public String wproductUpdate(Model model, Wproduct wproduct, HttpServletRequest request) {
		String real = request.getSession().getServletContext().getRealPath("/WEB-INF/images");

		if (!wproduct.getFile1().isEmpty()) {
			String p_image = wproduct.getFile1().getOriginalFilename();
			wproduct.setP_image(p_image);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(wproduct.getFile1(), real, p_image);
		}else{
			wproduct.setP_image("nothing.jpg");
		}

		if (!wproduct.getFile2().isEmpty()) {
			String p_info = wproduct.getFile2().getOriginalFilename();
			wproduct.setP_info(p_info);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(wproduct.getFile2(), real, p_info);
		}else{
			wproduct.setP_info("nothing.jpg");
		}
		 int result = wps.update(wproduct);
		 model.addAttribute("result",result);
		 return  "wproduct/wproductUpdate";
	}
	@RequestMapping("wproductDelete")
	public String wproductDelete(Model model, int p_id) {
		int result = wps.delete(p_id);
		model.addAttribute("result", result);
		return "wproduct/wproductDelete";
	}
	@RequestMapping("wproductMain")
	public String wproductMain(String p_category, Model model) {
		List<Wproduct> list = wps.pdList(p_category);
		model.addAttribute("list", list);
		model.addAttribute("p_category", p_category);
		//한글처리
		//model.addAttribute("p_category", p_category);
		return "wproduct/wproductMain";
	}
	@RequestMapping("wproductInfo")
	public String wproductInfo(Model model, int p_id, String p_category) {
		Wproduct wproduct = wps.pdContent(p_id);
		List<Wproduct> rlist = wps.rlist(p_id);
		model.addAttribute("wproduct",wproduct);
		model.addAttribute("rlist",rlist);
		model.addAttribute("p_category", p_category);
		return "wproduct/wproductInfo";
	}
	@RequestMapping("wproductSearch")
	public String wproductSearch(Model model, String search) {
		List<Wproduct> list = wps.search(search);
		model.addAttribute("list", list);
		return "wproduct/wproductSearch";
	}
}