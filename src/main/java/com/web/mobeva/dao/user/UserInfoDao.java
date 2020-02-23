package com.web.mobeva.dao.user;

import java.util.List;

import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.model.user.UserLoginBean;
import com.web.mobeva.model.user.UserQuizBean;

public interface UserInfoDao {

//------------------------------小米哥開始------------------------

	List<UserInfoBean> getAllUser();

	UserInfoBean getUser(int u_id);

	// 更新會員資料
	public int updateUserInfo(UserInfoBean userInfoBean);

	// openid 綁定帳號時，檢查帳號是否存在
	boolean checkAccountExist(String u_account);

	// 新增安全問題(名字重複)
//	void insertQuiz(UserQuizBean uqb);

//------------------------------小米哥結束------------------------	

//------------------------------小黑開始------------------------

	// 前台註冊會員
	void insertUserinfo(UserInfoBean userinfoBean);

	// 前台更新黑名單時間
	void upadtetUserInfo(UserInfoBean userinfoBean);

	// 前台登入驗證帳密
	UserInfoBean getUserInfoBeanbyaccpwd(String account, String password);

	// 前台登入驗證u_block是否被鎖
	UserInfoBean getUserInfoblockbyId(int uid);

	// 前台 login 失敗 帳號對
	UserInfoBean getUserInfoBeanbyaccount(String account);

	// 前台建立Userlogin
	void insertUserLoginBean(UserLoginBean userLoginBean);

	// 取出登入資訊Bean
	UserLoginBean getUserLoginBeanbyId(int ul_id);

	// 取出最後登入時間
	long getUserLoginLastTimebyuId(int u_id);

//---------------------------------------------------------------------------
	// 後台取出會員全部資料
	List<UserInfoBean> getUserInfoBeans();

	// 後台取出會員單筆資料
	UserInfoBean getUserInfoBeanById(int u_id);

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

	// 後台得到會員登入資訊
	List<UserLoginBean> getUserLoginDatas();

	// 後台模糊查詢時間登入資訊
	List<UserLoginBean> getUserLoginDatasByDate(String startdate, String enddate, int ul_status);

	// 後台登入資訊查詢依帳號
	List<UserLoginBean> getUserLoginDatasByUid(int u_id);

	// 後台登入資訊模糊查詢依帳號時間
	List<UserLoginBean> getUserLoginDatasByUidDate(int u_id, String startdate, String enddate, int ul_status);

	// 後台登入資訊模糊查詢依IP時間
	List<UserLoginBean> getUserLoginDatasByIPDate(String ul_ip, String startdate, String enddate, int ul_status);

//------------------------------小黑結束------------------------

//------------------------------仕杰開始------------------------

	UserInfoBean saveOpenID(String u_openid, String u_name, String u_email);

//------------------------------仕杰結束------------------------

}
