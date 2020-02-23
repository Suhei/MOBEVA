package com.web.mobeva.dao.maintain;

import java.util.List;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainInfoBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;

public interface MaintainBookingDao {

	// ---------------------------前台Dao--------------------------------
	UserInfoBean queryMember(Integer id);

	MaintainStationBean getStationById(int stationId);

	UserCarBean getUserCarById(int usercarId);

	List<UserCarBean> getCarList(int u_id);

	List<MaintainInfoBean> getSet();

	List<Integer> selectDay(String mb_date, int ms_id);

	// -----------------------------共用Dao----------------------------

	void addBooking(MaintainBookingBean booking);

	List<MaintainStationBean> getStationList();

	// -----------------------------後台Dao------------------------------

	List<MaintainBookingBean> getAllbooking();

	void updatestatus(int mb_id, int mb_status);

	MaintainBookingBean getSinglebooking(int mb_id);

	void updateBooking(MaintainBookingBean update);

	UserInfoBean getSingleUser(String u_account);
}
