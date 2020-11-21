package com.ch.winer.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.winer.dao.WmemberDao;
import com.ch.winer.model.Wmember;
@Service
public class WmemberServiceImpl implements WmemberService{
	@Autowired
	private WmemberDao wd;
	public int login(String id, String password) {
		return wd.login(id, password);
	}
	public int idChk(String id) {
		return wd.idChk(id);
	}
	public int insert(Wmember wm) {
		return wd.insert(wm);
	}
	public Wmember wmMypage(String id) {
		return wd.wmMypage(id);
	}
	public Wmember wmemberForm(String id) {
		return wd.wmemberForm(id);
	}
	public Wmember select(String id) {
		return wd.select(id);
	}
	public int wmupdate(Wmember wm) {
		return wd.wmupdate(wm);
	}
	public int wmLeave(String id) {
		return wd.wmLeave(id);
	}
	public int getTotalRecordMember() {
		return wd.getTotalRecordMember();
	}
	public List<Wmember> wmList(Wmember wm) {
		return wd.wmList(wm);
	}
	public int wmDelete(String id) {
		return wd.wmDelete(id);
	}
}
