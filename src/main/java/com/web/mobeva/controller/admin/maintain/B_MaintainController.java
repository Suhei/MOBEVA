package com.web.mobeva.controller.admin.maintain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainDetailsBean;
import com.web.mobeva.model.maintain.MaintainPartsBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.maintain.MaintainService;
import com.web.mobeva.service.part.PartService;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Controller
public class B_MaintainController {
	MaintainService mService;
	PartService pService;

	@Autowired
	public void setmService(MaintainService mService) {
		this.mService = mService;
	}
	
	@Autowired
	public void setpService(PartService pService) {
		this.pService = pService;
	}

	// --------------後台------------------
	/** 顯示所有預約單 */
	@RequestMapping("/admin/b_md_list")
	public String getAllM_Orders(Model model) {

		List<MaintainBookingBean> lists = mService.getAllBooking();
		for (MaintainBookingBean mb : lists) {
			System.out.println(mb.getUserInfoBean().getU_id());
		}
		model.addAttribute("m_orders", lists);
		return "/admin/b_md_list";
	}

	// --------------後台------------------
	/** 新增預約單 */
//	@RequestMapping(value = "/admin/m_detail_add", method = RequestMethod.POST)
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
	/** 新增指定預約單id保養明細 */

	@RequestMapping("/admin/b_md_add")
	public String getAllM_Detail_ByMb_id(@RequestParam("mb_id") int mb_id, Model model) {

		/** 將前頁面預約單號暫存 */
		model.addAttribute("Orderlist_mb_id", mb_id);

		MaintainDetailsBean mdBean = new MaintainDetailsBean();
		model.addAttribute("New_Md_Form", mdBean);

		return "admin/b_md_add";
	}

	// 建立承攬人員下拉選單內容
	@ModelAttribute("AllAuthLists")
	public Map<Integer, String> getAuthList() {
		Map<Integer, String> authMap = new HashMap<>();
		List<AuthinfoBean> list = mService.getAllAuth();
		for (AuthinfoBean aib : list) {
			authMap.put(aib.getA_id(), aib.getA_account());
		}
		return authMap;
	}

// 建立承攬人員下拉選單內容
	@ModelAttribute("AllPartsList")
	public Map<Integer, String> getPartsList() {
		Map<Integer, String> partsMap = new HashMap<>();
		List<MaintainPartsBean> list = pService.getAllParts();
		for (MaintainPartsBean mpb : list) {
			partsMap.put(mpb.getMp_id(), mpb.getMp_name());
		}
		return partsMap;
	}

	// --------------後台------------------
	/** 新增選取預約單id保養明細 */
	@RequestMapping(value = "/admin/b_md_add", method = RequestMethod.POST)
	public String processAddMo_detail(@ModelAttribute("New_Md_Form") MaintainDetailsBean mdb) {

				
		System.out.println("===============進入update控制器====================");
		System.out.println(mdb.getAuthinfoBean().getA_id());
		System.out.println(mdb.getMaintainPartsBean().getMp_id());
		System.out.println(mdb.getMd_pcs());
		System.out.println(mdb.getMd_hours());
		System.out.println(mdb.getMaintainBookingBean().getMb_id());
		System.out.println("===============進入尾巴控制器====================");
		/** 下單數量*/
		int o_Stock = mdb.getMd_pcs();
		/** 原庫存數量*/
		/** 因原Bean沒帶庫存值，需建一個Bean靠Id建立查庫存 **/
		MaintainPartsBean maintainPartsData = pService.getMaintainPartsBeanById(mdb.getMaintainPartsBean().getMp_id());
		int r_stock = maintainPartsData.getMp_stock();
		System.out.println(r_stock);
		/** 剩餘庫存數量*/
		int stock_cnt = r_stock - o_Stock;
		//set 回 MaintainPartsBean stock數量
		maintainPartsData.setMp_stock(stock_cnt);
		pService.updatePartsStock(maintainPartsData);
		if (stock_cnt <=5) {
			String name = "sales1";
			String toemail = "arieschienhao@gmail.com";
			String mailsubject = "stock test";
			String mailmessage ="stock test";
			int stock = stock_cnt;
			String mp_name = maintainPartsData.getMp_name();
			mService.sendLessStock(name, toemail, mailsubject, mailmessage, stock, mp_name);
		}
		mService.addMaintainDetail(mdb);

//			return "redirect:b_md_list"+ mdb.getMd_id();
		return "redirect:b_md_edit?mb_id=" + mdb.getMaintainBookingBean().getMb_id();
	}

	// --------------後台------------------
	/** 顯示指定預約單id保養明細 */
	@RequestMapping("/admin/b_md_edit")
	public String getM_Detail_EditByMb_id(@RequestParam("mb_id") int mb_id, Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainDetailsBean> lists = mService.getMaintainDetailsById(mb_id);
		
		model.addAttribute("Orderlist_mb_id", mb_id);
		model.addAttribute("m_details", lists); // <c:forEach var='m_detail' items='${m_details}'>
//		MaintainDetailsBean mdb = new MaintainDetailsBean();
		model.addAttribute("md_Bean", new MaintainDetailsBean());
		return "admin/b_md_edit";
	}

	// --------------後台------------------
	/** 修改選取預約單id保養明細 */
	@RequestMapping(value = "/admin/b_md_edit", method = RequestMethod.POST)
	public String processUpdatMo_detail(@ModelAttribute("md_Bean") MaintainDetailsBean mdb) {

		System.out.println("===============進入update控制器====================");
		mService.update_admin_md_Bean(mdb);

//		return "redirect:b_md_list"+ mdb.getMd_id();
		return "redirect:/admin/b_md_edit?mb_id=" + mdb.getMaintainBookingBean().getMb_id();
	}


	// --------------前台------------------
	/** 顯示指定u_id預約單 */
//	@RequestMapping(value = {"/m_order","/m_order_desp"})
	@RequestMapping("/admin/maintain_order")
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
	@RequestMapping("/admin/m_detail")
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
//	@RequestMapping(value = "/admin/updateMo_detail", method = RequestMethod.POST)
	public String processUpdatM_Order(int mb_id, int mb_status) {
		System.out.println("------------------------------");
		System.out.println("mb_id:" + mb_id);
		System.out.println(mb_status);
		mService.updateMaintainBooking(mb_id, 0);
		return "redirect:maintain_order";
	}

	/** 顯示所有據點 */
//	@RequestMapping("/m_station")
	public String getAllMaintainStationBean(Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainStationBean> lists = mService.getAllStation();
		for (MaintainStationBean ms : lists) {
			System.out.println(ms.getMs_id());
		}
		model.addAttribute("m_stations", lists); // <c:forEach var='m_detail' items='${m_details}'>
		return "maintain_station";
	}

//	@RequestMapping("/m_station/{ms_id}")
	public String getMaintainStationBeanById(@RequestParam("id") int ms_id, Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainStationBean> list = mService.getMaintainStationBeanById(ms_id);
		for (MaintainStationBean ms : list) {
			System.out.println(ms.getMs_id());
		}
		model.addAttribute("m_station", list); // <c:forEach var='m_detail' items='${m_details}'>
		return "maintain_station";
	}

	/** 轉換時間格式 */
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}



}
