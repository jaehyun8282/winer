package com.ch.winer.dao;
import java.util.Collection;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.winer.model.WreplyBoard;
@Repository
public class WreplyBoardDaoImpl implements WreplyBoardDao {
	@Autowired
	private SqlSessionTemplate sst;
	public Collection<WreplyBoard> list(int bno) {
		return sst.selectList("rbdns.list", bno);
	}
	public void insert(WreplyBoard rb) {
		sst.insert("rbdns.insert", rb);		
	}
	public void update(WreplyBoard rb) {
		sst.update("rbdns.update", rb);
	}
	public void delete(int rno) {
		sst.update("rbdns.delete", rno);
	}
}