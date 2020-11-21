package com.ch.winer.service;
import java.util.Collection;

import com.ch.winer.model.WreplyBoard;
public interface WreplyBoardService {
	Collection<WreplyBoard> list(int bno);
	void insert(WreplyBoard rb);
	void update(WreplyBoard rb);
	void delete(int rno);

}