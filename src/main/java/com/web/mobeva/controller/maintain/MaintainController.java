package com.web.mobeva.controller.maintain;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainDetailsBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.maintain.MaintainService;

@Controller
public class MaintainController {
	MaintainService mService;

	@Autowired
	public void setmService(MaintainService mService) {
		this.mService = mService;
	}

//	@RequestMapping("/order_detail")
//	public String m_orderDetailById(@RequestParam("u_id") Integer u_id,Model model) {
////		List<BookingBean> list = mService.getAllBooking(1);
//		model.addAttribute("order_detail", mService.getAllBooking(u_id));
//		return "order_detail";
//	}

	// --------------後台------------------
	/** 顯示所有預約單 */
	@RequestMapping("/m_order_desp")
	public String getAllM_Orders(Model model) {

		List<MaintainBookingBean> lists = mService.getAllBooking();
		for (MaintainBookingBean mb : lists) {
			System.out.println(mb.getUserInfoBean().getU_id());
		}
		model.addAttribute("m_orders", lists);
		return "admin/maintain_order_desp";
	}

	// --------------後台------------------
	/** 新增預約單 */
	@RequestMapping(value = "/m_detail_add", method = RequestMethod.POST)
	public String processAddNewBookingFrom(@ModelAttribute("MaintainBookingBean") MaintainBookingBean mbb) {

		// System.out.println(mbb.getUserInfoBean().getU_id());
		// System.out.println(mbb.getMaintainInfoBean().getMi_id());
		// System.out.println(mbb.getMb_date());
		// System.out.println(mbb.getMaintainStationBean().getMs_id());
		// System.out.println(mbb.getUserCarBean().getUc_id());
		// System.out.println(mbb.getMb_stage());
		mbb.getUserInfoBean().getU_id();
		mbb.getMaintainInfoBean().getMi_id();
		System.out.println("Date------>" + mbb.getMb_date());
		mbb.getMaintainStationBean().getMs_id();
		mbb.getUserCarBean().getUc_id();
		mbb.getMb_stage();
		mService.addBooking(mbb);
		return "admin/maintain_detail_add";
	}

	// --------------後台------------------
	/** 顯示指定預約單id保養明細 */
	@RequestMapping("/m_detail_edit")
	public String getM_Detail_EditByMb_id(@RequestParam("id") int mb_id, Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainDetailsBean> lists = mService.getMaintainDetailsById(mb_id);
		for (MaintainDetailsBean md : lists) {
			System.out.println(md.getMaintainBookingBean().getMb_id());
		}
		model.addAttribute("m_details", lists); // <c:forEach var='m_detail' items='${m_details}'>
		return "admin/maintain_detail_edit";
	}

	// --------------後台------------------
	/** 修改指定預約單id保養明細 */
	@RequestMapping(value = "/m_detail_edit", method = RequestMethod.POST)
//	public String processUpdatMo_detail(@ModelAttribute("MaintainDetailsBean") MaintainDetailsBean mdb, int[] mp_id) {
	public String processUpdatMo_detail(int md_id, int mp_id, int md_pcs) {
//		System.out.println(mdb.getMd_id());
//		System.out.println(mdb.getMaintainPartsBean().getMp_id());
//		System.out.println(mdb.getMaintainPartsBean().getMp_name());
//		System.out.println(mdb.getMd_pcs());
//		System.out.println(mdb.getMd_createdate());

		MaintainDetailsBean mdb = new MaintainDetailsBean();
//		mdb.setMaintainPartsBean(mService.getMaintainPartsBeanById(mp_id));
		System.out.println(md_id);
		System.out.println(mp_id);
		System.out.println(md_pcs);
		mdb.setMd_pcs(md_pcs);
		mdb.setMd_id(md_id);
		mService.updateMaintainDetailsBean(md_id, mp_id, md_pcs);

//		mdb.getMd_id(); //<form:input type="text" path="userInfoBean.u_id"/>
//		mdb.getMaintainPartsBean().getMp_id();
//		mdb.getMaintainPartsBean().getMp_name();
//		mdb.getMd_pcs();
//		mdb.getMd_createdate();
//		service.addBooking(mbb);	
		return "redirect:m_detail_edit?id=" + md_id;
	}

	// --------------前台------------------
	/** 顯示指定u_id預約單 */
//	@RequestMapping(value = {"/m_order","/m_order_desp"})
	@RequestMapping("/maintain_order")
	public String getMaintainOrderByU_id(Model model, HttpSession session) {

		// 抓Session看有沒有登入
		UserInfoBean uib = (UserInfoBean) session.getAttribute("loginuser");
		if (uib == null) {
			return "redirect:/login";
		}

//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainBookingBean> lists = mService.getBookingById(uib.getU_id());

		for (MaintainBookingBean mb : lists) {
			System.out.println(mb.getUserInfoBean().getU_id());
		}
		model.addAttribute("m_orders", lists);
		return "maintain_order";
	}

	// --------------前台------------------
	/** 顯示指定預約單id保養明細 */
	@RequestMapping("/m_detail")
	public String getMaintainDetailByMb_id(@RequestParam("id") int mb_id, Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainDetailsBean> lists = mService.getMaintainDetailsById(mb_id);
		for (MaintainDetailsBean md : lists) {
			System.out.println(md.getMaintainBookingBean().getMb_id());
		}
		model.addAttribute("m_details", lists); // <c:forEach var='m_detail' items='${m_details}'>
		return "maintain_detail";
	}
	
	// --------------前台------------------
	/** 指定預約單狀態變更 */
	@RequestMapping(value = "/updateMo_detail", method = RequestMethod.POST)
	public String processUpdatM_Order(int mb_id, int mb_status) {
		System.out.println("------------------------------");
		System.out.println("mb_id:" + mb_id);
		System.out.println(mb_status);
		mService.updateMaintainBooking(mb_id, 0);
		return "redirect:maintain_order";
	}
	
	

	/** 顯示所有據點 */
	@RequestMapping("/m_station")
	public String getAllMaintainStationBean(Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainStationBean> lists = mService.getAllStation();
		for (MaintainStationBean ms : lists) {
			System.out.println(ms.getMs_id());
		}
		model.addAttribute("m_stations", lists); // <c:forEach var='m_detail' items='${m_details}'>
		return "maintain_station";
	}

	@RequestMapping("/m_station/{ms_id}")
	public String getMaintainStationBeanById(@RequestParam("id") int ms_id, Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainStationBean> list = mService.getMaintainStationBeanById(ms_id);
		for (MaintainStationBean ms : list) {
			System.out.println(ms.getMs_id());
		}
		model.addAttribute("m_station", list); // <c:forEach var='m_detail' items='${m_details}'>
		return "maintain_station";
	}

//	 public String getsoid(@RequestParam("id") Integer so_id, Model model) {
//		  List<ShopDetailsBean> list = service.getshopdetail(so_id);
//		  model.addAttribute("order_detail", list);
//		  return "order_detail";
//		 }

//	@RequestMapping(value = "/test6", method = RequestMethod.POST)
//	public String processAddNewtest6(@ModelAttribute("MaintainBookingBean") MaintainBookingBean mbb) {
//		
//		System.out.println(mbb.getUserInfoBean().getU_id());
//		System.out.println(mbb.getMaintainInfoBean().getMi_id());
//		System.out.println(mbb.getMb_date());
//		System.out.println(mbb.getMaintainStationBean().getMs_id());
//		System.out.println(mbb.getUserCarBean().getUc_id());
//		System.out.println(mbb.getMb_stage());
//	
//		mbb.getUserInfoBean().getU_id();
//		mbb.getMaintainInfoBean().getMi_id();
//		mbb.getMb_date();
//		mbb.getMaintainStationBean().getMs_id();
//		mbb.getUserCarBean().getUc_id();
//		mbb.getMb_stage();
////		service.addBooking(mbb);	
//		return "redirect:/booking";
//	}

}
