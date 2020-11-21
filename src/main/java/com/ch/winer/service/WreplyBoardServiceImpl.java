package com.ch.winer.service;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.winer.dao.WreplyBoardDao;
import com.ch.winer.model.WreplyBoard;
@Service
public class WreplyBoardServiceImpl implements WreplyBoardService {
	@Autowired
	private WreplyBoardDao rbd;
	public Collection<WreplyBoard> list(int bno) {
		return rbd.list(bno);
	}
	public void insert(WreplyBoard rb) {
		rbd.insert(rb);		
	}
	public void update(WreplyBoard rb) {
		rbd.update(rb);
	}
	public void delete(int rno) {
		rbd.delete(rno);
	}
}