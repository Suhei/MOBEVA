package com.web.mobeva.controller.maintain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainInfoBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.maintain.MaintainBookingService;

@Controller
public class BookingController {
	MaintainBookingService service;

	@Autowired
	public void setService(MaintainBookingService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	// 建立新的預約單並將預先知道的資料填入
	@RequestMapping(value = "/bookingForm/{mi}", method = RequestMethod.GET)
	public String getAddNewBookingForm(@PathVariable("mi") int mi_id, Model model, HttpSession session) {
		// 抓Session看有沒有登入
		UserInfoBean uib = (UserInfoBean) session.getAttribute("loginuser");
		if (uib == null) {
			return "redirect:/login";
		}
//		UserInfoBean uib = service.queryMember(3);

		MaintainBookingBean mbb = new MaintainBookingBean();
		mbb.setUserInfoBean(uib);

		MaintainInfoBean mib = new MaintainInfoBean();
		mib.setMi_id(mi_id);

		mbb.setMaintainInfoBean(mib);
		model.addAttribute("MaintainBookingBean", mbb);
		model.addAttribute("CarList", service.getCarMap(uib.getU_id()));
		model.addAttribute("SetList", service.getSetMap());
		return "bookingForm";
	}

	// 將預約資料寫入資料庫
	@RequestMapping(value = "/bookingForm/{mi}", method = RequestMethod.POST)
	public String processAddNewBookingFrom(@ModelAttribute("MaintainBookingBean") MaintainBookingBean mbb) {
//		System.out.println(mbb.getUserInfoBean().getU_id());
//		System.out.println(mbb.getMaintainInfoBean().getMi_id());
//		System.out.println(mbb.getMb_date());
//		System.out.println(mbb.getMaintainStationBean().getMs_id());
//		System.out.println(mbb.getUserCarBean().getUc_id());
//		System.out.println(mbb.getMb_stage());	
		mbb.getUserInfoBean().getU_id();
		mbb.getMaintainInfoBean().getMi_id();
		System.out.println("Date------>" + mbb.getMb_date());
		mbb.getMaintainStationBean().getMs_id();
		mbb.getUserCarBean().getUc_id();
		mbb.getMb_stage();
		service.addBooking(mbb);
		return "redirect:/maintain_order";
	}

	// 查詢時段ajax
	@RequestMapping(value = "/ajaxDay", method = RequestMethod.POST)
	@ResponseBody
	public String selectDay(@RequestParam("mb_date") String mb_date, @RequestParam("ms_id") int ms_id) {
		List<Integer> mbb = service.selectDay(mb_date, ms_id);
		String str = "";
		for (int mb : mbb) {
			str += mb + " ";
		}
		System.out.println(str);
		return str;
	}

	// 建立維修廠下拉選單內容
	@ModelAttribute("StationList")
	public Map<Integer, String> getStationList() {
		Map<Integer, String> stationMap = new HashMap<>();
		List<MaintainStationBean> list = service.getStationList();
		for (MaintainStationBean msb : list) {
			stationMap.put(msb.getMs_id(), msb.getMs_name());
		}
		return stationMap;
	}

}
