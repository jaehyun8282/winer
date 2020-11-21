package com.ch.winer.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.winer.dao.WcartDao;
import com.ch.winer.model.Wcart;
@Service
public class WcartServiceImpl implements WcartService{
	@Autowired
	private WcartDao wd;

	@Override
	public String selectId(Wcart wcart) {
		return wd.selectId(wcart);
	}

	@Override
	public String selectDel(Wcart wcart) {
		return wd.selectDel(wcart);
	}

	@Override
	public int insert(Wcart wcart) {
		return wd.insert(wcart);
	}

	@Override
	public int update(Wcart wcart) {
		return wd.update(wcart);
	}

	@Override
	public List<Wcart> list(String id) {
		return wd.list(id);
	}

	@Override
	public int delete(int ct_id) {
		return wd.delete(ct_id);
	}

	@Override
	public int updateCnt(int ct_count, int ct_id) {
		return wd.updateCnt(ct_count, ct_id);
	}

	@Override
	public Wcart info(int ct_id) {
		return wd.info(ct_id);
	}

	@Override
	public Wcart content(Wcart wcart) {
		return wd.content(wcart);
	}
}
