package com.ch.winer.service;
import java.util.List;
import com.ch.winer.model.Wproduct;
public interface WproductService {
	int getTotalRecordProduct();
	List<Wproduct> list(Wproduct wp);
	int insert(Wproduct wproduct);
	Wproduct pdContent(int p_id);
	int update(Wproduct wproduct);
	int delete(int p_id);
	List<Wproduct> pdList(String p_category);
	List<Wproduct> rlist(int p_id);
	List<Wproduct> search(String search);
}
