package com.ch.winer.service;
import java.util.List;

import com.ch.winer.model.Wmember;
public interface WmemberService {
	int login(String id, String password);
	int idChk(String id);
	int insert(Wmember wm);
	Wmember wmMypage(String id);
	Wmember wmemberForm(String id);
	Wmember select(String id);
	int wmupdate(Wmember wm);
	int wmLeave(String id);
	int getTotalRecordMember();
	List<Wmember> wmList(Wmember wm);
	int wmDelete(String id);
}
