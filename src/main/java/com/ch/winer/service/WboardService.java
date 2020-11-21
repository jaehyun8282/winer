package com.ch.winer.service;

import java.util.Collection;

import com.ch.winer.model.Wboard;
public interface WboardService {
//	int getTotal();
	int getTotal(Wboard wb);
//	Collection<Board> list(int startRow, int endRow);
	Collection<Wboard> list(Wboard wb);
	int insert(Wboard wb);
	void updateReadCount(int num);
	Wboard select(int num);
	int update(Wboard wb);
	int delete(Wboard wb);
	int maxNum();
	void updateStep(Wboard wb);
}