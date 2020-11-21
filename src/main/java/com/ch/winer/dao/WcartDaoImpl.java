package com.ch.winer.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ch.winer.model.Wcart;
@Repository
public class WcartDaoImpl implements WcartDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public String selectId(Wcart wcart) {
		System.out.println("id : " + wcart.getId());
		System.out.println("p_id : " + wcart.getP_id());
		return sst.selectOne("wcart.selectId", wcart);
	}

	@Override
	public String selectDel(Wcart wcart) {
		return sst.selectOne("wcart.selectDel", wcart);
	}

	@Override
	public int insert(Wcart wcart) {
		return sst.insert("wcart.insert", wcart);
	}

	@Override
	public int update(Wcart wcart) {
		return sst.update("wcart.update", wcart);
	}

	@Override
	public List<Wcart> list(String id) {
		return sst.selectList("wcart.list", id);
	}

	@Override
	public int delete(int ct_id) {
		return sst.delete("wcart.delete", ct_id);
	}

	@Override
	public int updateCnt(int ct_count, int ct_id) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("ct_count", ct_count);
		hm.put("ct_id", ct_id);
		return sst.update("wcart.updateCnt", hm);
	}

	@Override
	public Wcart info(int ct_id) {
		return sst.selectOne("wcart.info", ct_id);
	}

	@Override
	public Wcart content(Wcart wcart) {
		return sst.selectOne("wcart.content", wcart);
	}
}
