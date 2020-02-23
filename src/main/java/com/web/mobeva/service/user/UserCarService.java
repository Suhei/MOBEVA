package com.web.mobeva.service.user;

import java.util.List;

import com.web.mobeva.model.user.UserCarBean;

public interface UserCarService {
	
//------------------------------小米哥開始------------------------	
	//------------------------------------前台開始----------------------------------
	
	List<UserCarBean> getAllUserCar(int u_id);
	
	// 新增車籍資料
	void addUserCar(UserCarBean userCarBean);
	
	// 刪除車籍資料
	int userCarDelete(int uc_id);
	
	//------------------------------------前台結束----------------------------------
//------------------------------小米哥結束------------------------
	
}
