package com.web.mobeva.service.maintain;

import java.util.List;
import java.util.Map;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;

public interface MaintainBookingService {
	// ==================================前台service====================================

	UserInfoBean queryMember(Integer id);

	MaintainStationBean getStationById(int stationId);

	UserCarBean getUserCarById(int usercarId);

	List<UserCarBean> getCarList(int u_id);

	Map<Integer, String> getCarMap(int u_id);

	Map<Integer, String> getSetMap();

	List<Integer> selectDay(String mb_date, int ms_id);

	List<MaintainStationBean> getStationList();

	// ==================================共用service====================================

	void addBooking(MaintainBookingBean booking);

	Map<Integer, String> getStationMap();

	void sendbookingsucess(String name, String toemail, String mailsubject, String mailmessage, String date);

	// ==================================後台service====================================

	List<MaintainBookingBean> getAllbooking();

	void updatestatus(int mb_id, int mb_status);

	MaintainBookingBean getSinglebooking(int mb_id);

	void updateBooking(MaintainBookingBean update);

	UserInfoBean getSingleUser(String u_account);
}
