package com.web.mobeva.dao.auth.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.auth.AuthinfoDao;
import com.web.mobeva.model.auth.AuthLoginBean;
import com.web.mobeva.model.auth.AuthinfoBean;

@Repository
public class AuthinfoDaoImpl implements AuthinfoDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public AuthinfoBean getAuthinfoBeanByaccpwd(String a_account, String a_password) {

		AuthinfoBean aib = null;
		String hql = "FROM AuthinfoBean WHERE a_account = :a_account and a_password = :a_password";
		Session session = factory.getCurrentSession();
		aib = (AuthinfoBean) session.createQuery(hql).setParameter("a_account", a_account)
				.setParameter("a_password", a_password).getSingleResult();
		return aib;
	}

	@Override
	public void insertAuthLoginBean(AuthLoginBean authLoginBean) {
		Session session = factory.getCurrentSession();
		session.save(authLoginBean);
	}

	@Override
	public AuthLoginBean getAuthLoginBeanbyId(int al_id) {
		String hql = "FROM AuthLoginBean WHERE al_id = :al_id";
		AuthLoginBean alb = null;
		Session session = factory.getCurrentSession();
		alb = (AuthLoginBean) session.createQuery(hql).setParameter("al_id", al_id).getSingleResult();
		return alb;
	}

	@Override
	public AuthinfoBean getAuthinfoBeanbyaccount(String account) {
		AuthinfoBean aib = null;
		String hql = "FROM AuthinfoBean WHERE a_account = :a_account";
		Session session = factory.getCurrentSession();
		aib = (AuthinfoBean) session.createQuery(hql).setParameter("a_account", account).getSingleResult();
		return aib;
	}

	@Override
	public long getAuthLoginLastTimebyaId(int a_id) {
		String hql = "select count(*) FROM AuthLoginBean WHERE a_id = :a_id AND al_date >= DATEADD(mi, -10, CURRENT_TIMESTAMP) and al_status =0";
		Session session = factory.getCurrentSession();
		long n = (long) session.createQuery(hql).setParameter("a_id", a_id).getSingleResult();
		return n;
	}

	@Override
	public void upadtetAuthinfo(AuthinfoBean authinfoBean) {
		Session session = factory.getCurrentSession();
		session.update(authinfoBean);
	}

	@Override
	public List<AuthinfoBean> getAuthinfos() {
		String hql = "FROM AuthinfoBean";
		Session session = factory.getCurrentSession();
		List<AuthinfoBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	// -----------------------------仕杰開始------------------------

	@Override
	public AuthinfoBean getAuthinfoByID(int a_id) {
		Session session = factory.getCurrentSession();
		return session.get(AuthinfoBean.class, a_id);
	}
	
	@Override
	public void saveAuthinfo(AuthinfoBean aib) {
		Session session = factory.getCurrentSession();
		session.save(aib);	
	}
	
	@Override
	public boolean checkAccountExist(String a_account) {
		String hql = "FROM AuthinfoBean WHERE a_account = :a_account";
		Session session = factory.getCurrentSession();
		try {
			session.createQuery(hql).setParameter("a_account", a_account).getSingleResult();
			return true;
		} catch (NoResultException e) {
			return false;
		}

	}

	// ------------------------------仕杰結束------------------------



}
