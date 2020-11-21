package com.ch.winer.dao;

import java.util.Collection;

import com.ch.winer.model.Wboard;
public interface WboardDao {
//	int getTotal();
	int getTotal(Wboard wb);
//	Collection<Wboard> list(int startRow, int endRow);
	Collection<Wboard> list(Wboard wb);
	int insert(Wboard wb);
	Wboard select(int num);
	void updateReadCount(int num);
	int update(Wboard wb);
	int delete(Wboard wb);
	int maxNum();
	void updateStep(Wboard wb);
}