package com.web.mobeva.controller.user;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.user.UserCarService;
import com.web.mobeva.service.user.UserInfoService;

@Controller
public class UserController_Mi {
	UserInfoService uis;
	UserCarService ucs;

	@Autowired
	public void setUis(UserInfoService uis) {
		this.uis = uis;
	}

	@Autowired
	public void setUcs(UserCarService ucs) {
		this.ucs = ucs;
	}

	
//	==== 對前端表單傳回值進行轉換 ==== 
	 @org.springframework.web.bind.annotation.InitBinder
	 public void InitBinder(WebDataBinder binder) {
		 // 轉換前端傳回的時間（字串 -> 時間）
		 DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		 CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		 binder.registerCustomEditor(Date.class, dateEditor);
	  
		 // 轉換前端傳回的空值為NULL（字串 -> NULL） 
		 binder.registerCustomEditor( String.class, new StringTrimmerEditor( true ));	
	 }
	
	
	// 查詢會員資料 by u_id
	@GetMapping("/profile")
	public String profile(Model model, HttpSession session) {

		//抓Session看有沒有登入
		UserInfoBean uib = (UserInfoBean) session.getAttribute("loginuser");
		if(uib == null) {
			return "redirect:/login";
		}
		
		// 寫死 u_id = 2
//		UserInfoBean uib = uis.getUser(7);
		model.addAttribute("UserInfo", uib);

		// 列出 u_id = 2 的所有車籍資料
//		List<UserCarBean> lists = ucs.getAllUserCar(7);
		List<UserCarBean> lists = ucs.getAllUserCar(uib.getU_id());
		model.addAttribute("AllUserCar", lists);

		// 新增車籍資料用(空白表單)
		model.addAttribute("AddUserCar", new UserCarBean());

		// model.addAttribute("SelectedCarInfo", new UserCarBean());

		return "profile";
	}

	// 修改會員資料 by u_id
	@PostMapping("/profile")
	public String profileUpdate(Model model, @ModelAttribute("Users") UserInfoBean userInfoBean
			,HttpSession session) {

		// 寫死 u_id = 2
//		UserInfoBean uib = uis.getUser(7);
//		UserInfoBean uib = (UserInfoBean) session.getAttribute("loginuser");
//		userInfoBean.setU_id(uib.getU_id());

		// 取得 u_id = 2 的所有車籍資料
//		List<UserCarBean> lists = ucs.getAllUserCar(7);
//		List<UserCarBean> lists = ucs.getAllUserCar(uib.getU_id());
//		model.addAttribute("AllUserCar", lists);

		// 更新會員資料
		uis.updateUserInfo(userInfoBean);
		session.setAttribute("loginuser", userInfoBean);
		

		// 新增後，導回profile頁面
		return "redirect:profile";
	}

	// 處理新增車籍資料
	@PostMapping("/AddUserCar")
	public String addUserCar(Model model, @ModelAttribute("AddUserCar") UserCarBean userCarBean,HttpSession session) {

		// 寫死 u_id = 2
//		UserInfoBean uib = uis.getUser(7);
		UserInfoBean uib = (UserInfoBean) session.getAttribute("loginuser");
		userCarBean.setUserInfoBean(uib);

		// 新增車籍資料
		ucs.addUserCar(userCarBean);

		// 新增後，導回profile頁面
		return "redirect:/profile";
	}

	// 處理刪除車籍資料
	@PostMapping("/userCarDelete")
	public String userCarDelete(Model model, int uc_id,HttpSession session) {

		// 寫死 u_id = 2
//		UserInfoBean uib = uis.getUser(7);
		UserInfoBean uib = (UserInfoBean) session.getAttribute("loginuser");
		model.addAttribute("Users", uib);

		// 刪除車籍資料
		ucs.userCarDelete(uc_id);

		// 刪除後，取得 u_id = 2 的車籍資料
		List<UserCarBean> lists = ucs.getAllUserCar(uib.getU_id());
		model.addAttribute("AllUserCar", lists);

		// 刪除後，導回profile頁面
		return "redirect:/profile";
	}

	// 測試撈所有會員資料
	@RequestMapping("/user")
	public String member(Model model) {
		List<UserInfoBean> lists = uis.getAllUser();
		model.addAttribute("AllUsers", lists);
		return "user";
	}

}
