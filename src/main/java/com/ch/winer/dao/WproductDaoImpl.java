package com.ch.winer.dao;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.winer.model.Wproduct;
@Repository
public class WproductDaoImpl implements WproductDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotalRecordProduct() {
		return sst.selectOne("getTotalProduct");
	}
	@Override
	public List<Wproduct> list(Wproduct wp) {
		return sst.selectList("wproduct.list", wp);
	}
	@Override
	public int insert(Wproduct wproduct) {
		return sst.insert("wproduct.insert",wproduct);
	}
	@Override
	public Wproduct pdContent(int p_id) {
		return sst.selectOne("wproduct.pdContent",p_id);
	}
	@Override
	public int update(Wproduct wproduct) {
		return sst.update("wproduct.update",wproduct);
	}
	@Override
	public int delete(int p_id) {
		return sst.delete("wproduct.delete",p_id);
	}
	@Override
	public List<Wproduct> pdList(String p_category) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("p_category", p_category);
		return sst.selectList("wproduct.pdList",hm);
	}
	@Override
	public List<Wproduct> rlist(int p_id) {
		return sst.selectList("wproduct.rlist", p_id);
	}
	@Override
	public List<Wproduct> search(String search) {
		return sst.selectList("wproduct.search", search);
	}
}
