package com.web.mobeva.dao.maintain;

import java.util.List;

import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainDetailsBean;
import com.web.mobeva.model.maintain.MaintainPartsBean;
import com.web.mobeva.model.maintain.MaintainStationBean;

public interface MaintainDao {
	/** 取得單一會員預約單 */
	List<MaintainBookingBean> getBookingById(int u_id);

	/** 取得所有預約單 */
	List<MaintainBookingBean> getAllBooking();

	/** 取得單一預約單保養明細 */
	List<MaintainDetailsBean> getMaintainDetailsById(int mb_id);

	/** 取得所有據點 */
	List<MaintainStationBean> getAllStation();

	/** 取得指定據點 */
	List<MaintainStationBean> getMaintainStationBeanById(int ms_id);

//	void updateMaintainDetailsBean(MaintainDetailsBean maintainDetailsBean);
	/** 修改指定保養明細(int md_id, int mp_id, int md_pcs) */
	void updateMaintainDetailsBean(int md_id, int mp_id, int md_pcs);

	/** 新增預約單 */
	void addBooking(MaintainBookingBean maintainBookingBean);

	// ***********************************************************************
	/** 指定預約單狀態變更 */
	void updateMaintainBooking(int mb_id, int mb_status);

	/** 修改指定保養明細 */
	void update_admin_md_Bean(MaintainDetailsBean mdb);

	/** 新增保養明細 */
	void addMaintainDetail(MaintainDetailsBean mdb);

	/** 取得所有員工 */
	List<AuthinfoBean> getAllAuth();
}
