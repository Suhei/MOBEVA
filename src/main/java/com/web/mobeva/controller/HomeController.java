package com.web.mobeva.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.shop.ShopService;

@Controller
public class HomeController {

	ShopService service;

	@Autowired
	public void setService(ShopService service) {
		this.service = service;
	}


	@RequestMapping("/")
	public String home() {
		return "index";
	}

//	@RequestMapping("/login")
//	public String login(HttpSession session) {
//		UserInfoBean userInfoData = (UserInfoBean) session.getAttribute("loginuser");
//		if (userInfoData == null) {
//			return "login";
//		}
//		return "redirect:/profile";
//
//	}
	
	//小黑
	@RequestMapping("/login")
	public String login() {
		return "login";

	}

	@RequestMapping("/booking")
	public String GoBookingSet() {
		return "booking";	
	}
	
	@RequestMapping("/about_us")
	public String Goabout_us() {
		return "about_us";	

	}	
	
	@RequestMapping("/contact")
	public String Gocontact() {
		return "contact";	
	}
	
	@PostMapping("/sendemail")
	@ResponseBody
	public String sendemail(String name,String email,String tel,String review) {
//		sendmail.send(name, email, tel, review);
		return "success";	
	}
	

}
