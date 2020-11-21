package com.ch.winer.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.winer.model.Wmember;
@Repository
public class WmemberDaoImpl implements WmemberDao{
	@Autowired
	private SqlSessionTemplate sst;

	public int login(String id, String password) {
		int result = 0;
		String dbPass = "";
		System.out.println("id = " + id);
		System.out.println("password = " + password);
		
		try {
			dbPass = (String) sst.selectOne("wmemberns.loginChk", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (dbPass == null || dbPass.equals("")) {
			result = -1;
		} else if (password.equals(dbPass)) {
			result = 1;
		} else
			result = 0;
		return result;
	}
	public int idChk(String id) {
		int result = 0;
		System.out.println("id = " + id);
		String DbId = "";
		try {
			DbId = sst.selectOne("wmemberns.idChk", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (DbId != null && !DbId.equals("")) {
			result = 1;
		}
		System.out.println("result="+result);
		System.out.println("dbId= "+DbId);
		return result;
	}
	public int insert(Wmember wm) {
		System.out.println("id = " + wm.getId());
		System.out.println("pass = " + wm.getPassword());
		System.out.println("name = " + wm.getName());
		System.out.println("tel = " + wm.getTel());
		System.out.println("addr1 = " + wm.getAddr1());
		System.out.println("addr2 = " + wm.getAddr2());
		System.out.println("addr3 = " + wm.getAddr3());
		System.out.println("email = " + wm.getEmail());
		System.out.println("birthday = " + wm.getBirthday());
		System.out.println("reg_date = " + wm.getReg_date());
		return sst.insert("wmemberns.insert", wm);
	}
	public Wmember wmMypage(String id) {
		System.out.println("id="+id);
		return sst.selectOne("wmemberns.wmMypage", id);
	}
	public Wmember wmemberForm(String id) {
		return sst.selectOne("wmemberns.wmemberForm", id);
	}
	public Wmember select(String id) {
		return sst.selectOne("wmemberns.select", id);
	}
	public int wmupdate(Wmember wm) {
		System.out.println("id = " + wm.getId());
		System.out.println("password = " + wm.getPassword());
		System.out.println("name = "+ wm.getName());
		System.out.println("tel = " + wm.getTel());
		System.out.println("addr1 = " + wm.getAddr1());
		System.out.println("addr2 = " + wm.getAddr2());
		System.out.println("addr3 = " + wm.getAddr3());
		System.out.println("email = " + wm.getEmail());
		return sst.update("wmemberns.wmupdate", wm);
	}
	public int wmLeave(String id) {
		return sst.delete("wmemberns.wmLeave", id);
	}
	public int getTotalRecordMember() {
		return sst.selectOne("getTotalMember");
	}
	public List<Wmember> wmList(Wmember wm) {
		return sst.selectList("wmemberns.wmList", wm);
	}
	public int wmDelete(String id) {
		return sst.delete("wmemberns.wmDelete", id);
	}
}
