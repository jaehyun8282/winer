package com.ch.winer.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.winer.dao.WboardDao;
import com.ch.winer.model.Wboard;
@Service
public class WboardServiceImpl implements WboardService {
	@Autowired
	private WboardDao bd;
//	public int getTotal() {
//		return bd.getTotal();
//	}
	public int getTotal(Wboard wb) {
		return bd.getTotal(wb);
	}
//	public Collection<Board> list(int startRow, int endRow) {
//		return bd.list(startRow, endRow);
//	}
	public Collection<Wboard> list(Wboard wb) {
		return bd.list(wb);
	}
	public int insert(Wboard wb) {
		return bd.insert(wb);
	}
	public void updateReadCount(int num) {
		bd.updateReadCount(num);
		
	}
	public Wboard select(int num) {
		return bd.select(num);
	}
	public int update(Wboard wb) {
		return bd.update(wb);
	}
	public int delete(Wboard wb) {
		return bd.delete(wb);
	}
	public int maxNum() {
		return bd.maxNum();
	}
	public void updateStep(Wboard wb) {
		bd.updateStep(wb);
	}
}