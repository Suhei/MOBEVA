package com.web.mobeva.service.auth;

import java.util.List;

import com.web.mobeva.model.auth.AuthLoginBean;
import com.web.mobeva.model.auth.AuthinfoBean;

public interface AuthinfoService {

	AuthinfoBean getAuthinfoBeanByaccpwd(String a_account,String a_password);
	
	void insertAuthLoginBean(AuthLoginBean authLoginData);
	
	AuthLoginBean getAuthLoginBeanbyId(int al_id);
	
	AuthinfoBean getAuthinfoBeanbyaccount(String account);
	
	long getAuthLoginLastTimebyaId(int a_id);
	
	void upadtetAuthinfo(AuthinfoBean authinfoBean);
	
	//後台撈出員工資料
	List<AuthinfoBean> getAuthinfos();
	
	//----------------------------仕杰開始--------------------------------
	
	public AuthinfoBean getAuthinfoByID(int a_id);
	
	void saveAuthinfo(AuthinfoBean aib);
	
	public boolean checkAccountExist(String a_account);
	//----------------------------仕杰結束--------------------------------

	void sendAdminLoginError(String name, String toemail, String mailsubject, String mailmessage, String ip);
}
