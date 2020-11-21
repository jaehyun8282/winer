package com.ch.winer.service;
import java.util.List;
import com.ch.winer.model.Wcart;
public interface WcartService {
	String selectId(Wcart wcart);
	String selectDel(Wcart wcart);
	int insert(Wcart wcart);
	int update(Wcart wcart);
	List<Wcart> list(String id);
	int delete(int ct_id);
	int updateCnt(int ct_count, int ct_id);
	Wcart info(int ct_id);
	Wcart content(Wcart wcart);
}
