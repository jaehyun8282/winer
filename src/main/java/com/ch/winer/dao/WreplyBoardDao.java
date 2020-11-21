package com.ch.winer.dao;
import java.util.Collection;

import com.ch.winer.model.WreplyBoard;
public interface WreplyBoardDao {
	Collection<WreplyBoard> list(int bno);
	void insert(WreplyBoard rb);
	void update(WreplyBoard rb);
	void delete(int rno);

}