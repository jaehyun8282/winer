package com.ch.winer.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.winer.model.Wboard;
@Repository
public class WboardDaoImpl implements WboardDao{
	@Autowired
	private SqlSessionTemplate sst;
	public int getTotal(Wboard wb) {
		return sst.selectOne("wboardns.getTotal", wb);
	}
	public Collection<Wboard> list(Wboard wb) {
		sst.selectList("wboardns.list", wb);
		return sst.selectList("wboardns.list", wb);
	}
	public int insert(Wboard wb) {
		return sst.insert("wboardns.insert",wb);
	}
	public Wboard select(int num) {
		return sst.selectOne("wboardns.select", num);
	}
	public void updateReadCount(int num) {
		sst.update("wboardns.updateReadCount",num);
		
	}
	public int update(Wboard wb) {
		return sst.update("wboardns.update", wb);
	}
	public int delete(Wboard wb) {
		return sst.update("wboardns.delete", wb);
	}
	public int maxNum() {
		return sst.selectOne("wboardns.maxNum");
	}
	public void updateStep(Wboard wb) {
		sst.update("wboardns.updateStep", wb);
	}
}