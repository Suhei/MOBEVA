package com.web.mobeva.dao.user;

import java.util.List;

import com.web.mobeva.model.user.UserCarBean;

public interface UserCarDao {
	List<UserCarBean> getAllUserCar(int u_id);
//	UserInfoBean getUser(int u_id);	
	
	// 新增車籍資料
	void addUserCar(UserCarBean userCarBean);
//	UserCarBean setUserCar(String uc_number, String uc_modelyear, String uc_brand, String uc_model, String uc_engine);
	
	// 刪除車籍資料
	int userCarDelete(int uc_id);
}
