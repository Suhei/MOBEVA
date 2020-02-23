package com.web.mobeva.controller.admin.maintain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.maintain.MaintainBookingService;


@Controller
public class adminbookingController {

	MaintainBookingService service;

	@Autowired
	public void setBservice(MaintainBookingService service) {
		this.service = service;
	}
	/**連結到後台新增預約*/
	@RequestMapping("/test")
	public String processinsert() {		
		return "admin/b_booking_process";
	}
	
	/**依照輸入的帳號尋找資料*/
	@RequestMapping(value="/goinsert", method = RequestMethod.GET)
	public String b_selectInsert(String u_account,Model model) {
		System.out.println("測試U_account："+u_account);
		UserInfoBean uib = service.getSingleUser(u_account);
		MaintainBookingBean mbb = new MaintainBookingBean();
		if(uib!=null) {
			mbb.setUserInfoBean(uib);
			model.addAttribute("in_booking", mbb);		
			model.addAttribute("CarList", service.getCarMap(uib.getU_id()));
			model.addAttribute("SetList", service.getSetMap());
			model.addAttribute("StationList", service.getStationMap());						
		}else {		
			model.addAttribute("errorMsg","此為無效帳號！！");
			return "admin/b_booking_process";
		}
		return "admin/b_booking_insert";
	}	
	
	/**依照輸入的帳號新增預約*/
	@RequestMapping(value="/goinsert" , method = RequestMethod.POST )
	public String b_insert(@ModelAttribute("in_booking") MaintainBookingBean mbb) {
//		System.out.println("");
		String name = mbb.getUserInfoBean().getU_name();
		String date = mbb.getMb_date();
		String mailsubject = "MOBEVA預約保養成功";
//		System.out.println("u_id---------->" + mbb.getUserInfoBean().getU_id());
		String toemail= mbb.getUserInfoBean().getU_email();
//		System.out.println("toemail---------->" + toemail);
		String mailmessage = "預約成功";
		service.addBooking(mbb);
		service.sendbookingsucess(name, toemail, mailsubject, mailmessage, date);	
		return "redirect:admin/b_booking_list";
	}
	

	/** 查詢所有預約單 */
	@RequestMapping(value = "/admin/b_booking_list", method = RequestMethod.GET)
	public String b_booking_list(Model model) {
		List<MaintainBookingBean> lists = service.getAllbooking();
		model.addAttribute("m_booking", lists);
		return "admin/b_booking_list";
	}

	/** 指定預約單狀態變更 */
	@RequestMapping(value = "/updatestatus", method = RequestMethod.POST)
	public String processupdatestatus(int mb_id, int mb_status) {
		service.updatestatus(mb_id, 0);
		return "redirect:admin/b_booking_list";
	}

	/** 依照單號生成修改表 */
	@RequestMapping(value = "/updatetest", method = RequestMethod.GET)
	public String Goupdatejsp(int mb_id, int u_id, Model model) {
		MaintainBookingBean mbb = service.getSinglebooking(mb_id);
		model.addAttribute("up_booking", mbb);
		model.addAttribute("CarList", service.getCarMap(u_id));
		model.addAttribute("SetList", service.getSetMap());
		model.addAttribute("StationList", service.getStationMap());
		return "admin/b_booking_update";
	}

	/** 確認預約單修正 */
	@RequestMapping(value = "/updatetest", method = RequestMethod.POST)
	public String updatebooking(@ModelAttribute("up_booking") MaintainBookingBean mbb) {
		service.updateBooking(mbb);
		return "redirect:admin/b_booking_list";
	}

	/** 轉換時間格式 */
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}
	
	//查詢時段ajax
	@RequestMapping(value = "/b_ajaxDay", method = RequestMethod.POST)
	@ResponseBody
	public String selectDay(@RequestParam("mb_date") String mb_date,@RequestParam("ms_id")int ms_id) {
		List<Integer> mbb = service.selectDay(mb_date,ms_id);
		String str = "";
		for (int mb : mbb) {
			str += mb + " ";
		}
		System.out.println(str);
		return str;
	}		
}
