package com.web.mobeva.dao.maintain.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.maintain.MaintainBookingDao;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainInfoBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;

@Repository
public class MaintainBookingDaoImpl implements MaintainBookingDao {
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	// ------------------------------前台DaoImp-----------------------------

	@Override
	public UserInfoBean queryMember(Integer id) {
		Session session = factory.getCurrentSession();
		UserInfoBean uib = session.get(UserInfoBean.class, id);
		return uib;
	}

	@Override
	public MaintainStationBean getStationById(int StationId) {
		MaintainStationBean msb = null;
		Session session = factory.getCurrentSession();
		msb = session.get(MaintainStationBean.class, StationId);
		return msb;
	}

	@Override
	public UserCarBean getUserCarById(int UsercarId) {
		UserCarBean ucb = null;
		Session session = factory.getCurrentSession();
		ucb = session.get(UserCarBean.class, UsercarId);
		return ucb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserCarBean> getCarList(int u_id) {
		String hql = "From UserCarBean where u_id = :u_id";
		Session session = factory.getCurrentSession();
		List<UserCarBean> list = session.createQuery(hql).setParameter("u_id", u_id).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainInfoBean> getSet() {
		String hql = "From MaintainInfoBean";
		Session session = factory.getCurrentSession();
		List<MaintainInfoBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> selectDay(String mb_date, int ms_id) {
		System.out.println("接收前端輸入：" + mb_date);
		System.out.println("由前端接收：" + ms_id);
		String hql = "select mb_stage From MaintainBookingBean where ms_id = :ms_id AND mb_date = :mb_date AND mb_status = 1";
		Session session = factory.getCurrentSession();
		List<Integer> list = session.createQuery(hql).setParameter("ms_id", ms_id).setParameter("mb_date", mb_date)
				.getResultList();
		System.out.println(list);
		return list;
	}
	// -------------------------------共用DaoImp------------------------------------------

	/** 新增預約 */
	@Override
	public void addBooking(MaintainBookingBean booking) {
		Session session = factory.getCurrentSession();
		session.save(booking);
	}

	@Override
	public List<MaintainStationBean> getStationList() {
		String hql = "From MaintainStationBean";
		Session session = factory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<MaintainStationBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	// -------------------------------後台DaoImp------------------------------------------

	/** 查詢預約列表 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainBookingBean> getAllbooking() {
		String hql = "From MaintainBookingBean";
		Session session = factory.getCurrentSession();
		List<MaintainBookingBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	/** 查詢特定單號 */
	@Override
	public MaintainBookingBean getSinglebooking(int mb_id) {
		Session session = factory.getCurrentSession();
		MaintainBookingBean mbb = session.get(MaintainBookingBean.class, mb_id);
		return mbb;
	}

	// **依照帳號查詢使用者ID*/
	@Override
	public UserInfoBean getSingleUser(String u_account) {
		String hql = "From UserInfoBean where u_account = :u_account";
		Session session = factory.getCurrentSession();
		UserInfoBean uib = new UserInfoBean();
		try {
			uib = (UserInfoBean) session.createQuery(hql).setParameter("u_account", u_account).getSingleResult();
		} catch (NoResultException e) {
			uib = null;
		}
		System.out.println(uib);
		return uib;
	}

	/** 修改指定預約單狀態 */
	@Override
	public void updatestatus(int mb_id, int mb_status) {
		String hql = "UPDATE MaintainBookingBean SET mb_status = :mb_status WHERE mb_id = :mb_id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("mb_status", mb_status).setParameter("mb_id", mb_id).executeUpdate();
	}

	// **修改指定預約單*/
	@Override
	public void updateBooking(MaintainBookingBean update) {
		Session session = factory.getCurrentSession();
		session.update(update);
	}

}
