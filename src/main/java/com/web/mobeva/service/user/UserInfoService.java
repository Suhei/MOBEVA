package com.web.mobeva.service.user;

import java.util.List;

import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.model.user.UserLoginBean;
import com.web.mobeva.model.user.UserQuizBean;

public interface UserInfoService {
//------------------------------小米哥開始------------------------
	// ------------------------------------前台開始----------------------------------

	// 測試撈所有會員資料
		List<UserInfoBean> getAllUser();

		// 查詢會員資料 by u_id
		UserInfoBean getUser(int u_id);

		// 更新會員資料
		public int updateUserInfo(UserInfoBean userInfoBean);

		// openid 綁定帳號時，檢查帳號是否存在
		public boolean checkAccountExist(String u_account);
		
		// 新增安全問題(名字重複)
//		void insertQuiz(UserQuizBean uqb);

	// ------------------------------------前台結束----------------------------------
//------------------------------小米哥結束------------------------		

//------------------------------小黑開始------------------------

	// ------------------------------------前台開始----------------------------------

	void insertUserinfo(UserInfoBean userinfoBean);

	UserInfoBean getUserInfoBeanbyaccpwd(String account, String password);

	UserInfoBean getUserInfoBeanbyaccount(String account);

	UserLoginBean getUserLoginBeanbyId(int ul_id);

	void insertUserLoginBean(UserLoginBean userLoginBean);

	long getUserLoginLastTimebyuId(int u_id);

	void upadtetUserInfo(UserInfoBean userinfoBean);

	// 後台取出會員單筆資料
	UserInfoBean getUserInfoBeanById(int u_id);

	// 後台取出會員全部資料
	List<UserInfoBean> getUserInfoBeans();

	// 後台更新會員單筆資料
	void updatebUserInfoBeanById(int u_id, String u_name, String u_email, String u_mobile, String u_address,
			String u_block, String u_modifieddate, int u_status);

	// 後台刪除會員資料(更新狀態為註銷)
	void deletebUserInfoBeanById(int u_id, int u_status, String u_modifieddate);

	// 後台解鎖黑名單
	void passbUserInfoblockById(int u_id, int u_block, String u_modifieddate);

	// 前台註冊新增安全問題
	void insertQuiz(UserQuizBean userQuizBean);

	// 前台忘記密碼導出安全問題
	UserQuizBean getUserQuizBeanByUid(int u_id);

	// 發出驗證信
	void sendPwd(String name, String toemail, String mailsubject, String mailmessage, String password);

	void sendloginerror(String name, String toemail, String mailsubject, String mailmessage, String ip);

	// ------------------------------------前台結束----------------------------------

	// ------------------------------------後台開始----------------------------------

	// 後台得到會員登入資訊
	List<UserLoginBean> getUserLoginDatas();

	// 後台模糊查詢時間登入資訊
	List<UserLoginBean> getUserLoginDatasByDate(String startdate, String enddate, int ul_status);

	// 後台登入資訊模糊查詢依帳號
	List<UserLoginBean> getUserLoginDatasByUidDate(int u_id, String startdate, String enddate, int ul_status);

	// 後台登入資訊查詢依帳號
	List<UserLoginBean> getUserLoginDatasByUid(int u_id);

	// 後台登入資訊模糊查詢依IP時間
	List<UserLoginBean> getUserLoginDatasByIPDate(String ul_ip, String startdate, String enddate, int ul_status);

	// ------------------------------------後台結束----------------------------------
	// ------------------------------小黑結束------------------------

//------------------------------仕杰開始------------------------

	// ------------------------------------前台開始----------------------------------

	public UserInfoBean saveOpenID(String u_openid, String u_name, String u_email);

	// ------------------------------------前台結束----------------------------------
//------------------------------仕杰結束------------------------

}
