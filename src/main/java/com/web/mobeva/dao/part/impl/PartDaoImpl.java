package com.web.mobeva.dao.part.impl;

import java.util.ArrayList;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.part.PartDao;
import com.web.mobeva.model.maintain.MaintainPartsBean;

@Repository
public class PartDaoImpl implements PartDao {
	
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	/**新增零件*/
	@Override
	public void addParts(MaintainPartsBean mpb) {
		Session session = factory.getCurrentSession();
		session.save(mpb);
	}
	
	/**取得指定零件*/
	@Override
	public MaintainPartsBean getMaintainPartsBeanById(int mp_id) {
		Session session = factory.getCurrentSession();	
		MaintainPartsBean mpb = session.get(MaintainPartsBean.class,mp_id);
		return mpb;
	}
	
	/**取得所有零件*/
	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainPartsBean> getAllParts() {
		Session session = factory.getCurrentSession();
		List<MaintainPartsBean> list = new ArrayList<>();
		String hql = "FROM MaintainPartsBean";
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	/**更新庫存量*/
	@Override
	public void updatePartsStock(MaintainPartsBean mpb) {
		Session session = factory.getCurrentSession();
		session.update(mpb);		
	}
	
}
