package com.ch.winer.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.winer.dao.WproductDao;
import com.ch.winer.model.Wproduct;
@Service
public class WproductServiceImpl implements WproductService {
	@Autowired
	private WproductDao wpd;

	@Override
	public int getTotalRecordProduct() {
		return wpd.getTotalRecordProduct();
	}
	@Override
	public List<Wproduct> list(Wproduct wp) {
		return wpd.list(wp);
	}
	@Override
	public int insert(Wproduct wproduct) {
		return wpd.insert(wproduct);
	}
	@Override
	public Wproduct pdContent(int p_id) {
		return wpd.pdContent(p_id);
	}
	@Override
	public int update(Wproduct wproduct) {
		return wpd.update(wproduct);
	}
	@Override
	public int delete(int p_id) {
		return wpd.delete(p_id);
	}
	@Override
	public List<Wproduct> pdList(String p_category) {
		return wpd.pdList(p_category);
	}
	@Override
	public List<Wproduct> rlist(int p_id) {
		return wpd.rlist(p_id);
	}
	@Override
	public List<Wproduct> search(String search) {
		return wpd.search(search);
	}
}
