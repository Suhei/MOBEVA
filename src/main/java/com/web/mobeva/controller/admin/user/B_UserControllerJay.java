package com.web.mobeva.controller.admin.user;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.service.auth.AuthinfoService;

@Controller
public class B_UserControllerJay {

	AuthinfoService a_service;

	@Autowired
	public void setService(AuthinfoService a_service) {
		this.a_service = a_service;
	}

//	==== 對前端表單傳回值進行轉換 ==== 
	@org.springframework.web.bind.annotation.InitBinder
	public void InitBinder(WebDataBinder binder) {
		// 轉換前端傳回的時間（字串 -> 時間）
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);

		// 轉換前端傳回的空值為NULL（字串 -> NULL）
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	}

	// ----------------------仕杰開始-------------------

	@RequestMapping("/admin/b_authlist")
	public String getAuthList(Model model) {
		List<AuthinfoBean> list = a_service.getAuthinfos();
		model.addAttribute("Authinfos", list);
		return "admin/b_auth_list";
	}

	@GetMapping("/admin/registerForm")
	public String preRegister(Model model) {
		AuthinfoBean aib = new AuthinfoBean();
		model.addAttribute("RegisterAuthInfoBean", aib);
		return "admin/b_registerForm";
	}

	@PostMapping("/admin/registerForm")
	public String RegisterForm(Model model, @ModelAttribute("RegisterAuthInfoBean") AuthinfoBean aib) {
		if (a_service.checkAccountExist(aib.getA_account())) {
			model.addAttribute("ErrMsg", "帳號已存在");
			return "admin/b_registerForm";
		}
		a_service.saveAuthinfo(aib);
		return "redirect:/admin/b_auth_list";
	}

	@GetMapping("/admin/auth_detail")
	public String authDetails(Model model, @RequestParam("id") int a_id) {
		AuthinfoBean aib = a_service.getAuthinfoByID(a_id);
		model.addAttribute("authinfo", aib);
		return "admin/b_auth_detail";
	}

	@PostMapping("/admin/auth_detail")
	public String authUpdate(Model model, @ModelAttribute("authinfo") AuthinfoBean aib) {
		a_service.upadtetAuthinfo(aib);
		return "redirect:/admin/b_authlist";
	}

	@GetMapping("/admin/auth_del")
	public String authDel(Model model, @RequestParam("id") int a_id) {
		AuthinfoBean aib = a_service.getAuthinfoByID(a_id);
		aib.setA_status(0);
		a_service.upadtetAuthinfo(aib);
		return "redirect:/admin/b_authlist";
	}

	@GetMapping("/admin/b_auth")
	public String authDetail(Model model, @RequestParam("id") int a_id) {
		model.addAttribute("authinfo", a_service.getAuthinfoByID(a_id));
		return "/admin/b_auth";
	}

	@PostMapping("/admin/b_auth")
	public String authDetailUpdate(Model model, @ModelAttribute("authinfo") AuthinfoBean aib,HttpSession session) {
		a_service.upadtetAuthinfo(aib);
		model.addAttribute("id", aib.getA_id());
		session.setAttribute("MsgSuccess", Boolean.TRUE);
		return "redirect:/admin/b_auth";
	}

	// ----------------------仕杰結束-------------------

}
