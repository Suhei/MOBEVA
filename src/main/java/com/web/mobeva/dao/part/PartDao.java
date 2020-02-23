package com.web.mobeva.dao.part;

import java.util.List;

import com.web.mobeva.model.maintain.MaintainPartsBean;

public interface PartDao {
	
	/**新增零件*/
	void addParts(MaintainPartsBean mpb);
	
	/**取得指定零件*/
	MaintainPartsBean getMaintainPartsBeanById(int mp_id);

	/**取得所有零件*/
	List<MaintainPartsBean> getAllParts();
	
	/**更新庫存量*/
	void updatePartsStock(MaintainPartsBean mpb);
}
