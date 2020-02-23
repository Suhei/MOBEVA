package com.web.mobeva.dao.maintain.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.maintain.MaintainDao;
import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainDetailsBean;
import com.web.mobeva.model.maintain.MaintainPartsBean;
import com.web.mobeva.model.maintain.MaintainStationBean;

@Repository
public class MaintainDaoImpl implements MaintainDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	/** 取得單一會員預約單 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainBookingBean> getBookingById(int u_id) {
		String hql = "FROM MaintainBookingBean WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		List<MaintainBookingBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("u_id", u_id).getResultList();
		return list;
	}

	/** 取得所有預約單 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainBookingBean> getAllBooking() {
		String hql = "FROM MaintainBookingBean";
		Session session = null;
		session = factory.getCurrentSession();
		List<MaintainBookingBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	/** 取得單一預約單保養明細 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainDetailsBean> getMaintainDetailsById(int mb_id) {
		String hql = "FROM MaintainDetailsBean WHERE mb_id = :mb_id";
		Session session = factory.getCurrentSession();
		List<MaintainDetailsBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("mb_id", mb_id).getResultList();
		return list;
	}

	/** 修改指定預約單狀態 */
	@Override
	public void updateMaintainBooking(int mb_id, int mb_status) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE MaintainBookingBean SET mb_status = :mb_status WHERE mb_id = :mb_id";
		session.createQuery(hql).setParameter("mb_status", mb_status).setParameter("mb_id", mb_id).executeUpdate();
	}

	/** 取得所有據點 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainStationBean> getAllStation() {
		String hql = "FROM MaintainStationBean";
		Session session = factory.getCurrentSession();
		List<MaintainStationBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	/** 取得指定據點 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainStationBean> getMaintainStationBeanById(int ms_id) {
		String hql = "FROM MaintainStationBean WHERE ms_id = :ms_id";
		Session session = factory.getCurrentSession();
		List<MaintainStationBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("ms_id", ms_id).getResultList();
		return list;
	}

	/** 修改指定保養明細(int md_id, int mp_id, int md_pcs) */
	@Override
	public void updateMaintainDetailsBean(int md_id, int mp_id, int md_pcs) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE MaintainDetailsBean SET md_pcs = :md_pcs,mp_id = :mp_id WHERE md_id = :md_id";
		session.createQuery(hql).setParameter("md_pcs", md_pcs).setParameter("mp_id", mp_id)
				.setParameter("md_id", md_id).executeUpdate();
	}

	/** 新增預約單 */
	@Override
	public void addBooking(MaintainBookingBean bookingBean) {
		Session session = factory.getCurrentSession();
		session.save(bookingBean);
	}

	@Override
	public void update_admin_md_Bean(MaintainDetailsBean mdb) {
		Session session = factory.getCurrentSession();
		session.update(mdb);

	}

	/** 新增保養明細 */
	@Override
	public void addMaintainDetail(MaintainDetailsBean mdb) {
		Session session = factory.getCurrentSession();
		session.save(mdb);

	}

	/** 取得所有員工 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AuthinfoBean> getAllAuth() {
		Session session = factory.getCurrentSession();
		String hql = "FROM AuthinfoBean WHERE ag_type = 3";
		List<AuthinfoBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
