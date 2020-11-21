package com.ch.winer.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collection;
import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.ch.winer.model.Wmember;
import com.ch.winer.service.WmemberService;
import com.ch.winer.model.Wboard;
import com.ch.winer.service.WboardService;
import com.ch.winer.service.PagingBean;

@Controller
public class WboardController {
	@Autowired
	private WboardService bs;
	@Inject
	private WmemberService ws;

	@RequestMapping("list")
	public String list(String pageNum, Wboard wb, Model model) {
		// 세션id에 맞춰 수정필
		if (pageNum == null || pageNum.contentEquals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = bs.getTotal(wb);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		wb.setStartRow(startRow);
		wb.setEndRow(endRow);
		// Collection<Board> list = bs.list(startRow, endRow);
		Collection<Wboard> list = bs.list(wb);
		int no = total - startRow + 1;
		PagingBean pb = new PagingBean(currentPage, rowPerPage, total);

		String[] tit = { "작성자", "제목", "내용", "제목+내용" };
		model.addAttribute("list", list);
		model.addAttribute("wboard", wb);
		model.addAttribute("tit", tit);
		model.addAttribute("no", no);
		model.addAttribute("pb", pb);
		return "wboard/list";
	}

	@RequestMapping("insertForm")
	public String insertForm(String nm, String pageNum, Model model, HttpServletRequest request) {
		if ((String) request.getSession().getAttribute("id") != null) {
			String id = (String) request.getSession().getAttribute("id");
			System.out.println("id=" + id);
			request.getSession().setAttribute("id", id);
			Wmember wm = ws.select(id);
			model.addAttribute("wmember", wm);
		} else {
			return "wmember/loginForm";
		}
		int ref = 0, re_level = 0, re_step = 0, num = 0;
		if (nm.equals("null")) {
			nm = "0";
		}
		if (nm != null && !nm.equals("")) {
			/* Integer.parseInt(req.getParameter(nm)); */

			num = Integer.parseInt(nm);
			Wboard wb = bs.select(num);
			if (wb != null) {
				ref = wb.getRef();
				re_level = wb.getRe_level();
				re_step = wb.getRe_step();
			} else {
				ref = 0;
				re_level = 0;
				re_step = 0;
			}
		}
		/* System.out.println(req.getSession().getAttribute("id")); */
		model.addAttribute("ref", ref);
		model.addAttribute("re_level", re_level);
		model.addAttribute("re_step", re_step);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "wboard/insertForm";
	}

	@RequestMapping("insert")
	public String insert(Wboard wb, String pageNum, Model model, HttpServletRequest request, HttpSession session) {
		String real = request.getSession().getServletContext().getRealPath("/WEB-INF/image");
		if (wb.getFile1() != null && !wb.getFile1().isEmpty()) {
			String b_image = wb.getFile1().getOriginalFilename();
			wb.setB_image(b_image);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(wb.getFile1(), real, b_image);
		} else {
			wb.setB_image("nothing.jpg");
		}
		int number = bs.maxNum();
		// 답변글
		if (wb.getNum() != 0) {
			// 최신답글을 위로 놓기위해 step 증가
			bs.updateStep(wb);
			// 현재 읽은글보다 step이 level을 1증가
			wb.setRe_level(wb.getRe_level() + 1);
			wb.setRe_step(wb.getRe_step() + 1);
		} else {
			wb.setRef(number);
		}
		wb.setNum(number);
		int result = bs.insert(wb);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "wboard/insert";
	}

	@RequestMapping("updateForm")
	public String updateForm(int num, String pageNum, Model model, HttpServletRequest req) {
		String id = (String) req.getSession().getAttribute("id");
		Wmember wm = ws.select(id);
		model.addAttribute("wmember", wm);
		Wboard wb = bs.select(num);
		model.addAttribute("wboard", wb);
		model.addAttribute("pageNum", pageNum);
		return "wboard/updateForm";
	}

	@RequestMapping("update")
	public String update(Wboard wb, String pageNum, Model model, HttpServletRequest request, HttpSession session) {
		String real = request.getSession().getServletContext().getRealPath("/WEB-INF/image");
		if (wb.getFile1() != null && !wb.getFile1().isEmpty()) {
			String b_image = wb.getFile1().getOriginalFilename();
			wb.setB_image(b_image);
			Filewriter filewriter = new Filewriter();
			filewriter.writeFile(wb.getFile1(), real, b_image);			
		} else {
			wb.setB_image("nothing.jpg");
		}
		int result = bs.update(wb);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("wboard", wb);
		return "wboard/update";
	}

	@RequestMapping("deleteForm")
	public String deleteForm(int num, String pageNum, Model model, HttpServletRequest req) {

		String id = (String) req.getSession().getAttribute("id");
		Wmember wm = ws.select(id);
		model.addAttribute("wmember", wm);
		Wboard wb = bs.select(num);
		model.addAttribute("wboard", wb);
		model.addAttribute("pageNum", pageNum);
		return "wboard/deleteForm";
	}

	@RequestMapping("delete")
	public String delete(Wboard wb, String pageNum, Model model, HttpServletRequest req) {
		int result = bs.delete(wb);
		String id = (String) req.getSession().getAttribute("id");
		Wmember wm = ws.select(id);
		model.addAttribute("wmember", wm);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "wboard/delete";
	}

	@RequestMapping("view")
	public String view(int num, String pageNum, Model model, HttpServletRequest request, HttpSession session) {
		bs.updateReadCount(num);
		Wboard wb = bs.select(num);
		model.addAttribute("wboard", wb);
		model.addAttribute("pageNum", pageNum);

		return "wboard/view";
	}
}