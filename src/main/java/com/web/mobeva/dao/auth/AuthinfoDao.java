package com.web.mobeva.dao.auth;

import java.util.List;

import com.web.mobeva.model.auth.AuthLoginBean;
import com.web.mobeva.model.auth.AuthinfoBean;

public interface AuthinfoDao {
	
//------------------------------小黑開始------------------------

	// 後台驗證帳密
	AuthinfoBean getAuthinfoBeanByaccpwd(String a_account, String a_password);

	// 後台新增登入資訊
	void insertAuthLoginBean(AuthLoginBean authLoginBean);

	// 後台從al_id得到登入資訊
	AuthLoginBean getAuthLoginBeanbyId(int al_id);

	// 後台 login 失敗 帳號對
	AuthinfoBean getAuthinfoBeanbyaccount(String account);

	// 取出最後登入時間
	long getAuthLoginLastTimebyaId(int a_id);

	// 後台更新黑名單時間
	void upadtetAuthinfo(AuthinfoBean authinfoBean);
	
	//後台撈出員工資料
	List<AuthinfoBean> getAuthinfos();
	
//------------------------------小黑結束------------------------
	
	
//-----------------------------仕杰開始------------------------
	
	AuthinfoBean getAuthinfoByID(int a_id);

	void saveAuthinfo(AuthinfoBean aib);

	boolean checkAccountExist(String a_account);
	
//------------------------------仕杰結束------------------------
}
