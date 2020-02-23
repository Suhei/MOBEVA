package com.web.mobeva.dao.user.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.user.UserCarDao;
import com.web.mobeva.model.user.UserCarBean;

@Repository
public class UserCarImpl implements UserCarDao{

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	// 查詢所有車籍資料
	@SuppressWarnings("unchecked")
	@Override
	public List<UserCarBean> getAllUserCar(int u_id) {
		String hql = "FROM UserCarBean WHERE u_id = :uid";
		Session session = factory.getCurrentSession();
		List<UserCarBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).setParameter("uid", u_id).getResultList();
		return lists;
	}
	
	// 新增車籍資料
	@Override
	public void addUserCar(UserCarBean userCarBean) {
		Session session = factory.getCurrentSession();
		session.save(userCarBean);
	}

	// 修改車籍資料
	@Override
	public int userCarDelete(int uc_id) {
		String hql = "DELETE FROM UserCarBean WHERE uc_id = :uc_id";
		Session session = factory.getCurrentSession();
		int rs = session.createQuery(hql).setParameter("uc_id", uc_id).executeUpdate();
		System.out.println("=====================");
		System.out.println(uc_id);
		System.out.println("=====================");
		System.out.println(rs);
		System.out.println("=====================");
		return rs;
	}




	
//	@SuppressWarnings("unchecked")
//	@Override
//	public UserInfoBean getUser(int u_id) {
//		Session session = factory.getCurrentSession();
//		UserInfoBean uib = session.get(UserInfoBean.class, u_id);
//		return uib;
//	}

}
