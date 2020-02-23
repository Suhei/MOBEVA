package com.web.mobeva.dao.user.impl;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.user.UserLoginDao;
import com.web.mobeva.model.user.UserInfoBean;

@Repository
public class UserLoginDaoImpl implements UserLoginDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public UserInfoBean saveOpenID(String u_openid, String u_name, String u_email) {
		UserInfoBean uib;
		System.out.println("--------------------進入DAO--------------------");
		String hql = "FROM UserInfoBean WHERE u_openid = :openID";
		Session session = factory.getCurrentSession();

		try {
			System.out.println("--------------------進入try--------------------");
			uib = (UserInfoBean) session.createQuery(hql).setParameter("openID", u_openid).getSingleResult();
//			if(uib.getU_block() >= new Date()) {
//				//不能登入
//				
//			}
//			if(uib.getU_status() == 0) {
//				//被註銷
//			}
		
		} catch (NoResultException ex) {
			System.out.println("--------------------進入DAO--------------------");
			String u_account = "G_" + u_openid;
			String u_password = "WZlY$TFmNjZlODdiYjM2Yz@JlYT!A5ZDgzN%zMzOGJkZ";
			String u_idcard = "NA";
			String u_mobile = "NA";
			String u_address = "NA";
			uib = new UserInfoBean(u_account, u_password, u_openid, u_name, 
					u_idcard,u_email, u_mobile, u_address);
			session.save(uib);
			System.out.println("u_id" + uib.getU_id());
		}
		
		return uib;
	}

}
