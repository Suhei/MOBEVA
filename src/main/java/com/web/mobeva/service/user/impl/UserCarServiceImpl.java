package com.web.mobeva.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.mobeva.dao.user.UserCarDao;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.service.user.UserCarService;

@Service
public class UserCarServiceImpl implements UserCarService {

	UserCarDao dao;

	@Autowired
	public void setDao(UserCarDao dao) {
		this.dao = dao;
	}

//------------------------------小米哥開始------------------------
	// ------------------------------------前台開始----------------------------------

	// 查詢所有車籍資料
	@Transactional
	@Override
	public List<UserCarBean> getAllUserCar(int u_id) {
		return dao.getAllUserCar(u_id);
	}

	// 新增車籍資料
	@Transactional
	@Override
	public void addUserCar(UserCarBean userCarBean) {
		dao.addUserCar(userCarBean);
	}

	// 刪除車籍資料
	@Transactional
	@Override
	public int userCarDelete(int uc_id) {
		return dao.userCarDelete(uc_id);
	}

	// ------------------------------------前台結束----------------------------------
//------------------------------小米哥結束------------------------

}
