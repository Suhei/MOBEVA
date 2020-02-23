package com.web.mobeva.service.part.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.mobeva.dao.part.PartDao;
import com.web.mobeva.model.maintain.MaintainPartsBean;
import com.web.mobeva.service.part.PartService;

@Service
public class PartServiceImpl implements PartService{
	
	PartDao dao;
		
	@Autowired
	public void setDao(PartDao dao) {
		this.dao = dao;
	}

	/**新增零件*/
	@Transactional
	@Override
	public void addParts(MaintainPartsBean mpb) {
		dao.addParts(mpb);		
	}

	/**取得指定零件*/
	@Transactional
	@Override
	public MaintainPartsBean getMaintainPartsBeanById(int mp_id) {
		return dao.getMaintainPartsBeanById(mp_id);
	}

	/**取得所有零件*/
	@Transactional
	@Override
	public List<MaintainPartsBean> getAllParts() {
		return dao.getAllParts();
	}

	/**更新庫存量*/
	@Transactional
	@Override
	public void updatePartsStock(MaintainPartsBean mpb) {
		dao.updatePartsStock(mpb);		
	}	
	
}
