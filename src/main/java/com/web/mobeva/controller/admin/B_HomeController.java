package com.web.mobeva.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.mobeva.model.auth.AuthinfoBean;


@Controller
public class B_HomeController {


	@RequestMapping("/admin/b_index")
	public String backendhome(HttpSession session) {
		AuthinfoBean aib = (AuthinfoBean) session.getAttribute("b_loginuser");
		if(aib == null) {
			return "redirect:/admin/b_login";
		}
		return "admin/b_index";
	}

	@RequestMapping("/admin/welcome")
	public String welcome() {
		return "admin/welcome";
	}
	
	//test
	
	@RequestMapping("/admin/b_testlogin")
	public String testlogin() {
		return "admin/b_testlogin";
	}
	
	@RequestMapping("/admin/b_testlogout")
	public String testlogout() {
		return "admin/b_testlogout";
	}
	
	@PostMapping("/admin/b_testloginProcess")
	public String testloginProcess(String username) {
		System.out.println("進到b_testloginProcess");
		System.out.println("username" + username);
		return "admin/b_testindex";
	}
	
}
