package com.web.mobeva.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.service.auth.AuthinfoService;


@Controller
public class adminController2 {

	AuthinfoService service;

	@Autowired
	public void setService(AuthinfoService service) {
		this.service = service;
	}
	
	@RequestMapping("/admin/admin_list")
	public String getAuthinfos(Model model) {
		List<AuthinfoBean> list =service.getAuthinfos();
		model.addAttribute("admins",list);
		return "/admin/admin_list";
	}
}
