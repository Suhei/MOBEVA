package com.web.mobeva.controller.admin.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.model.user.UserLoginBean;
import com.web.mobeva.service.auth.AuthinfoService;
import com.web.mobeva.service.user.UserInfoService;


@Controller
public class B_UserController {

	UserInfoService service;
	AuthinfoService a_service;
	
	@Autowired
	public void setService(UserInfoService service) {
		this.service = service;
	}

	// 撈出所有會員資料
	@RequestMapping("/admin/b_user_list")
	public String getuserlist(Model model) {
		List<UserInfoBean> list = service.getUserInfoBeans();
		model.addAttribute("users", list);
		return "/admin/b_user_list";
	}

	// 撈出會員資料
	@RequestMapping("/admin/b_user_detail")
	public String getuserdetail(@RequestParam("id") Integer u_id, Model model) {
		UserInfoBean uib = service.getUserInfoBeanById(u_id);
		model.addAttribute("user", uib);
		return "/admin/b_user_detail";
	}

	// 更新會員資料
	@PostMapping("/admin/updateuser")
	public String updateuser(Model model, int u_id, String u_name, String u_email, String u_mobile, String u_address,
			String u_block, int u_status) {

		// 轉換成SQLdate格式
		long dNow = new Date().getTime();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd k:mm:ss.SSS");
		String u_modifieddate = ft.format(dNow);
		service.updatebUserInfoBeanById(u_id, u_name, u_email, u_mobile, u_address, u_block, u_modifieddate, u_status);
		List<UserInfoBean> list = service.getUserInfoBeans();
		model.addAttribute("users", list);
		return "redirect:/admin/b_user_list";
	}

	// 解鎖黑名單
	@GetMapping("/admin/unlockblock")
	public String updateblock(Model model, @RequestParam("id") int u_id) {
		// 轉換成SQLdate格式
		UserInfoBean uib = service.getUserInfoBeanById(u_id);
		long dNow = new Date().getTime();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd k:mm:ss.SSS");
		String u_modifieddate = ft.format(dNow);
		uib.setU_modifieddate(u_modifieddate);
		uib.setU_block(u_modifieddate);
		service.upadtetUserInfo(uib);
		return "redirect:/admin/b_user_list";
	}

	// 從會員明細查詢登入記錄
	@GetMapping("/admin/selectloginlist")
	public String selectloginlistfromdetail(Model model, @RequestParam("id") int u_id) {
		List<UserLoginBean> list = service.getUserLoginDatasByUid(u_id);
		model.addAttribute("logindata", list);
		return "/admin/b_user_loginlist";

	}

	// 更新黑名單狀態
	@RequestMapping("/admin/deleteuser")
	public String deleteuser(@RequestParam("id") int u_id, Model model) {
		// 轉換成SQLdate格式
		long dNow = new Date().getTime();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd k:mm:ss.SSS");
		String u_modifieddate = ft.format(dNow);
		service.deletebUserInfoBeanById(u_id, 0, u_modifieddate);
		List<UserInfoBean> list = service.getUserInfoBeans();
		model.addAttribute("users", list);
		return "redirect:/admin/b_user_list";
	}

	// 撈出所有登入資訊
	@RequestMapping("/admin/b_user_loginlist")
	public String getuserloginlist(Model model) {
		List<UserLoginBean> list = service.getUserLoginDatas();
		model.addAttribute("logindata", list);
		return "/admin/b_user_loginlist";
	}

	// 時間模糊查詢登入資訊
	@PostMapping("/admin/selectdate")
	public String getselectdate(Model model, String startdate, String enddate,int ul_status) {
		List<UserLoginBean> list = service.getUserLoginDatasByDate(startdate, enddate,ul_status);
		model.addAttribute("logindata", list);
		return "/admin/b_user_loginlist";
	}

	// 帳號時間模糊查詢登入資訊
	@GetMapping("/admin/selectaccount")
	public String getselecaccountdate(Model model, String account, String startdate, String enddate,int ul_status) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		try {
		UserInfoBean UserData = service.getUserInfoBeanbyaccount(account);
		List<UserLoginBean> list = service.getUserLoginDatasByUidDate(UserData.getU_id(), startdate, enddate,ul_status);
		model.addAttribute("logindata", list);
		return "/admin/b_user_loginlist";
		}catch (Exception e) {
			errorMsg.put("errorId", "查無此帳號");
			model.addAttribute("MsgMap",errorMsg);
			return "/admin/b_user_loginlist";
		}
	}
	
	// IP時間模糊查詢登入資訊
	@GetMapping("/admin/selectip")
	public String getselectipdate(Model model, String ul_ip, String startdate, String enddate,int ul_status) {
		List<UserLoginBean> list = service.getUserLoginDatasByIPDate(ul_ip, startdate, enddate,ul_status);
		model.addAttribute("logindata", list);
		return "/admin/b_user_loginlist";
	}	
}
