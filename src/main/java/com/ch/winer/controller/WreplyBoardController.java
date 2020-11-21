package com.ch.winer.controller;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.winer.model.Wboard;
import com.ch.winer.model.WreplyBoard;
import com.ch.winer.service.WboardService;
import com.ch.winer.service.WreplyBoardService;
@Controller
public class WreplyBoardController {
	@Autowired
	private WboardService bs;
	@Autowired
	private WreplyBoardService rbs;
	@RequestMapping("/replyList")
	public String replyList(int bno, Model model) {
		Wboard wb = bs.select(bno);
		Collection<WreplyBoard> rbdList = rbs.list(bno);
		//System.out.println("size = "+rbdList.size());
		model.addAttribute("wboard", wb);
		model.addAttribute("rbdList", rbdList);
		return "wboard/replyList";
	}
	@RequestMapping("/rInsert")
	public String rInsert(WreplyBoard rb) {
		rbs.insert(rb);
		return "redirect:/replyList?bno="+rb.getBno();
	}
	@RequestMapping("/rUpdate")
	public String rUpdate(WreplyBoard rb) {
		rbs.update(rb);
		return "forward:/replyList?bno="+rb.getBno();
	}
	@RequestMapping("/rDelete")
	public String rDelete(WreplyBoard rb) {
		rbs.delete(rb.getRno());
		return "redirect:/replyList?bno="+rb.getBno();
	}
}