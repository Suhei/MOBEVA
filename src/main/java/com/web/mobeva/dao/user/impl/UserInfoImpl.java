package com.web.mobeva.dao.user.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.user.UserInfoDao;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.model.user.UserLoginBean;
import com.web.mobeva.model.user.UserQuizBean;

@Repository
public class UserInfoImpl implements UserInfoDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

//------------------------------小米哥開始------------------------

	@SuppressWarnings("unchecked")
	@Override
	public List<UserInfoBean> getAllUser() {
		String hql = "FROM UserInfoBean";
		Session session = factory.getCurrentSession();
		List<UserInfoBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).getResultList();
		return lists;
	}

//	@SuppressWarnings("unchecked")
	@Override
	public UserInfoBean getUser(int u_id) {
		Session session = factory.getCurrentSession();
		UserInfoBean uib = session.get(UserInfoBean.class, u_id);
		return uib;
	}

	// 更新會員資料
	@Override
	public int updateUserInfo(UserInfoBean userInfoBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(userInfoBean);
		return n;
	}

	// openid 綁定帳號時，檢查帳號是否存在
	@Override
	public boolean checkAccountExist(String u_account) {
		String hql = "FROM UserInfoBean WHERE u_account = :u_account";
		Session session = factory.getCurrentSession();
		try {
			session.createQuery(hql).setParameter("u_account", u_account).getSingleResult();
			return true;
		} catch (NoResultException e) {
			return false;
		}

	}

	// 新增安全問題(名字重複)
//	@Override
//	public void insertQuiz(UserQuizBean uqb) {
//		Session session = factory.getCurrentSession();
//		session.save(uqb);
//	}

//------------------------------小米哥結束------------------------	

//------------------------------小黑開始------------------------	

	@Override
	public void insertUserinfo(UserInfoBean userinfoBean) {
		Session session = factory.getCurrentSession();
		session.save(userinfoBean);
	}

	@Override
	public UserInfoBean getUserInfoBeanbyaccpwd(String account, String password) {
		UserInfoBean uib = null;
		String hql = "FROM UserInfoBean WHERE u_account = :u_account and u_password = :u_password";
		Session session = factory.getCurrentSession();
		uib = (UserInfoBean) session.createQuery(hql).setParameter("u_account", account)
				.setParameter("u_password", password).getSingleResult();
		return uib;
	}

	@Override
	public UserInfoBean getUserInfoBeanbyaccount(String account) {
		UserInfoBean uib = null;
		String hql = "FROM UserInfoBean WHERE u_account = :u_account";
		Session session = factory.getCurrentSession();
		uib = (UserInfoBean) session.createQuery(hql).setParameter("u_account", account).getSingleResult();
		return uib;
	}

	@Override
	public UserLoginBean getUserLoginBeanbyId(int ul_id) {
		String hql = "FROM UserLoginBean WHERE ul_id = :ul_id";
		UserLoginBean ulb = null;
		Session session = factory.getCurrentSession();
		ulb = (UserLoginBean) session.createQuery(hql).setParameter("ul_id", ul_id).getSingleResult();
		return ulb;
	}

	@Override
	public void insertUserLoginBean(UserLoginBean userLoginBean) {
		Session session = factory.getCurrentSession();
		session.save(userLoginBean);
	}

	@Override
	public long getUserLoginLastTimebyuId(int u_id) {
		String hql = "select count(*) FROM UserLoginBean WHERE u_id = :u_id AND ul_date >= DATEADD(mi, -10, CURRENT_TIMESTAMP) and ul_status = 0";
		Session session = factory.getCurrentSession();
		long n = (long) session.createQuery(hql).setParameter("u_id", u_id).getSingleResult();
		return n;
	}

	@Override
	public void upadtetUserInfo(UserInfoBean userinfoBean) {
		Session session = factory.getCurrentSession();
		session.update(userinfoBean);
	}

	@Override
	public UserInfoBean getUserInfoblockbyId(int u_id) {
		UserInfoBean uib = null;
		String hql = "FROM UserInfoBean WHERE u_id = :u_id and (u_block  < CURRENT_TIMESTAMP or u_block is null)";
		Session session = factory.getCurrentSession();
		uib = (UserInfoBean) session.createQuery(hql).setParameter("u_id", u_id).getSingleResult();
		return uib;
	}

	// 後台取出會員全部資料
	@SuppressWarnings("unchecked")
	@Override
	public List<UserInfoBean> getUserInfoBeans() {
		String hql = "FROM UserInfoBean";
		List<UserInfoBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	// 後台取出會員單筆資料
	@Override
	public UserInfoBean getUserInfoBeanById(int u_id) {
		UserInfoBean uib = null;
		String hql = "FROM UserInfoBean WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		uib = (UserInfoBean) session.createQuery(hql).setParameter("u_id", u_id).getSingleResult();
		return uib;
	}

	// 後台更新會員單筆資料
	@Override
	public void updatebUserInfoBeanById(int u_id, String u_name, String u_email, String u_mobile, String u_address,
			String u_block, String u_modifieddate, int u_status) {
		String hql = "UPDATE UserInfoBean SET u_name = :u_name,u_email = :u_email,u_mobile = :u_mobile,u_address = :u_address"
				+ ",u_block=:u_block,u_modifieddate=:u_modifieddate,u_status = :u_status WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("u_id", u_id).setParameter("u_name", u_name)
				.setParameter("u_email", u_email).setParameter("u_mobile", u_mobile)
				.setParameter("u_address", u_address).setParameter("u_block", u_block)
				.setParameter("u_modifieddate", u_modifieddate).setParameter("u_status", u_status).executeUpdate();
	}

	// 後台刪除會員資料(更新狀態為註銷)
	@Override
	public void deletebUserInfoBeanById(int u_id, int u_status, String u_modifieddate) {
		String hql = "UPDATE UserInfoBean SET u_status = :u_status,u_modifieddate=:u_modifieddate WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("u_id", u_id).setParameter("u_status", u_status)
				.setParameter("u_modifieddate", u_modifieddate).executeUpdate();
	}

	// 後台解鎖黑名單
	@Override
	public void passbUserInfoblockById(int u_id, int u_block, String u_modifieddate) {
		String hql = "UPDATE UserInfoBean SET u_block = :u_block,u_modifieddate=:u_modifieddate WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("u_id", u_id).setParameter("u_block", u_block)
				.setParameter("u_modifieddate", u_modifieddate).executeUpdate();
	}

	// 前台註冊新增安全問題
	@Override
	public void insertQuiz(UserQuizBean userQuizBean) {
		Session session = factory.getCurrentSession();
		session.save(userQuizBean);
	}

	// 前台忘記密碼導出安全問題
	@Override
	public UserQuizBean getUserQuizBeanByUid(int u_id) {
		UserQuizBean uqb = null;
		String hql = "FROM UserQuizBean WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		uqb = (UserQuizBean) session.createQuery(hql).setParameter("u_id", u_id).getSingleResult();
		return uqb;
	}

	// 取得所有會員登入資訊
	@SuppressWarnings("unchecked")
	@Override
	public List<UserLoginBean> getUserLoginDatas() {
		String hql = "FROM UserLoginBean ORDER BY ul_date DESC";
		Session session = factory.getCurrentSession();
		List<UserLoginBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	// 後台模糊查詢時間登入資訊
	@SuppressWarnings("unchecked")
	@Override
	public List<UserLoginBean> getUserLoginDatasByDate(String startdate, String enddate, int ul_status) {
		String hql = "From UserLoginBean  WHERE ul_date >= :startdate  AND ul_status = :ul_status AND  ul_date < :enddate order by ul_date desc";
		Session session = factory.getCurrentSession();
		if (startdate == "") {
			startdate = "1970-01-01";
		}
		if (enddate == "") {
			enddate = "2040-01-01";
		}
		List<UserLoginBean> list = session.createQuery(hql).setParameter("startdate", startdate)
				.setParameter("enddate", enddate).setParameter("ul_status", ul_status).getResultList();
		// 沒傳值輸出全部成功失敗資訊
		if (ul_status == 2) {
			hql = "From UserLoginBean  WHERE ul_date >= :startdate AND ul_date < :enddate order by ul_date desc";
			list = session.createQuery(hql).setParameter("startdate", startdate).setParameter("enddate", enddate)
					.getResultList();
		}
		return list;
	}

	// 後台登入資訊模糊查詢依帳號時間
	@SuppressWarnings("unchecked")
	@Override
	public List<UserLoginBean> getUserLoginDatasByUidDate(int u_id, String startdate, String enddate, int ul_status) {
		String hql = "From UserLoginBean WHERE u_id = :u_id AND ul_status = :ul_status AND ul_date >= :startdate AND ul_date < :enddate order by ul_date desc";
		Session session = factory.getCurrentSession();
		if (startdate == "") {
			startdate = "1970-01-01";
		}
		if (enddate == "") {
			enddate = "2040-01-01";
		}
		List<UserLoginBean> list = session.createQuery(hql).setParameter("u_id", u_id)
				.setParameter("startdate", startdate).setParameter("enddate", enddate)
				.setParameter("ul_status", ul_status).getResultList();
		// 沒傳值輸出全部成功失敗資訊
		if (ul_status == 2) {
			hql = "From UserLoginBean WHERE u_id = :u_id AND ul_date >= :startdate AND ul_date < :enddate order by ul_date desc";
			list = session.createQuery(hql).setParameter("startdate", startdate).setParameter("enddate", enddate)
					.setParameter("u_id", u_id).getResultList();
		}
		return list;
	}

	// 後台登入資訊查詢依帳號
	@SuppressWarnings("unchecked")
	@Override
	public List<UserLoginBean> getUserLoginDatasByUid(int u_id) {
		String hql = "From UserLoginBean WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		List<UserLoginBean> list = session.createQuery(hql).setParameter("u_id", u_id).getResultList();
		return list;
	}

	// 後台登入資訊查詢依Ip
	@SuppressWarnings("unchecked")
	@Override
	public List<UserLoginBean> getUserLoginDatasByIPDate(String ul_ip, String startdate, String enddate,
			int ul_status) {
		String hql = "From UserLoginBean WHERE ul_ip = :ul_ip AND ul_status = :ul_status AND ul_date >= :startdate AND ul_date < :enddate order by ul_date desc";
		Session session = factory.getCurrentSession();
		if (startdate == "") {
			startdate = "1970-01-01";
		}
		if (enddate == "") {
			enddate = "2040-01-01";
		}
		List<UserLoginBean> list = session.createQuery(hql).setParameter("ul_ip", ul_ip)
				.setParameter("startdate", startdate).setParameter("enddate", enddate)
				.setParameter("ul_status", ul_status).getResultList();
		// 沒傳值輸出全部成功失敗資訊
		if (ul_status == 2) {
			hql = "From UserLoginBean WHERE ul_ip = :ul_ip AND ul_date >= :startdate AND ul_date < :enddate order by ul_date desc";
			list = session.createQuery(hql).setParameter("ul_ip", ul_ip).setParameter("startdate", startdate)
					.setParameter("enddate", enddate).getResultList();
		}
		return list;
	}

//------------------------------小黑結束------------------------

//------------------------------仕杰開始------------------------

	@Override
	public UserInfoBean saveOpenID(String u_openid, String u_name, String u_email) {
		UserInfoBean uib;
		System.out.println("--------------------進入DAO--------------------");
		String hql = "FROM UserInfoBean WHERE u_openid = :openID";
		Session session = factory.getCurrentSession();

		try {
			System.out.println("--------------------進入try--------------------");
			uib = (UserInfoBean) session.createQuery(hql).setParameter("openID", u_openid).getSingleResult();
		} catch (NoResultException ex) {
			System.out.println("--------------------進入DAO--------------------");
			String u_account = "G_" + u_openid;
			String u_password = "WZlY$TFmNjZlODdiYjM2Yz@JlYT!A5ZDgzN%zMzOGJkZ";
			String u_idcard = "NA";
			String u_mobile = "NA";
			String u_address = "NA";
			uib = new UserInfoBean(u_account, u_password, u_openid, u_name, u_idcard, u_email, u_mobile, u_address,1);
			session.save(uib);
			System.out.println("u_id" + uib.getU_id());
		}

		return uib;
	}

//------------------------------仕杰結束------------------------

}
