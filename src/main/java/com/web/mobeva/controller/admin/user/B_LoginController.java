package com.web.mobeva.controller.admin.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.mobeva.model.auth.AuthLoginBean;
import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.service.auth.AuthinfoService;


@Controller
public class B_LoginController {

	AuthinfoService service;

	@Autowired
	public void setService(AuthinfoService service) {
		this.service = service;
	}

	@RequestMapping("/admin/b_login")
	public String adminlogin() {
		return "admin/b_login";
	}
	
	@RequestMapping(value="/admin/b_logindo",method = RequestMethod.POST)
	public String logindo(Model model, String account, String password, HttpServletRequest req) throws ParseException {
		System.out.println(account);
		System.out.println(password);
		AuthinfoBean authInfoData = new AuthinfoBean();
		AuthLoginBean authLoginData = new AuthLoginBean();
		try {
			authInfoData = service.getAuthinfoBeanByaccpwd(account, password);
			//判斷帳號是否註銷
			if (authInfoData.getA_status() == 0) {
				// 送出錯誤訊息2 帳號註銷
				model.addAttribute("b_loginerror", 2);
				return "/admin/b_login";
			}
			// 判斷黑名單時間是否為空,不為空進入撈時間,為空直接放行登入
			if (authInfoData.getA_block() != null) {
				// 將黑名單時間轉回毫秒
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long block = sdf.parse(authInfoData.getA_block()).getTime();
				// 得到現在時間毫秒
				long nTime = new Date().getTime()+60000;
				// 如果黑名單時間大於現在時間10分鐘,代表此帳號已鎖定
				if (block > nTime) {
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String blocktime = sdf2.format(block);
					// Show出鎖定時間給前端
					model.addAttribute("b_blocktime", blocktime);
					// 傳出鎖定資訊給前端
					model.addAttribute("b_block", 1);
					return "/admin/b_login";
				}
			}
			// 得到一個登入資訊
			HttpSession loginsession = req.getSession();
			authLoginData.setAuthinfoBean(authInfoData);
			authLoginData.setAl_ip(req.getRemoteAddr());
			service.insertAuthLoginBean(authLoginData);
			// 存入使用者資訊
			loginsession.setAttribute("b_loginuser", authInfoData);
			// 存入已登入訊息
			loginsession.setAttribute("b_loginsuccess", 1);
		} catch (Exception e) {
			// 帳號對密碼錯
			try {
				// 得到一個登入資訊
				authInfoData = service.getAuthinfoBeanbyaccount(account);
				System.out.println(authInfoData.getA_id());
				authLoginData.setAuthinfoBean(authInfoData);
				authLoginData.setAl_status(0);
				authLoginData.setAl_ip(req.getRemoteAddr());
				service.insertAuthLoginBean(authLoginData);
				
				String name = authInfoData.getA_account();
				String toemail = authInfoData.getA_email();
				String mailsubject = "MOBEVA後台系統登入異常";
				String mailmessage = "登入異常";
				String ip = authInfoData.getA_ip();
				service.sendAdminLoginError(name, toemail, mailsubject, mailmessage, ip);
				
				if (service.getAuthLoginLastTimebyaId(authInfoData.getA_id()) > 3) {
					// 產生SQL時間+10分鐘單位毫秒
					long dNow = new Date().getTime() + 600000;
					// 轉換成SQLdate格式
					SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd k:mm:ss.SSS");
					// 加入黑名單
					authInfoData.setA_block(ft.format(dNow));
					service.upadtetAuthinfo(authInfoData);
				}
				// 錯誤訊息1帳號錯誤
				model.addAttribute("b_loginerror", 1);
				return "admin/b_login";
			}
			// 帳密全錯
			catch (Exception e1) {
				// 得到一個登入資訊
				authInfoData = service.getAuthinfoBeanbyaccount("AccountNotExist");
				authLoginData.setAuthinfoBean(authInfoData);
				authLoginData.setAl_status(0);
				authLoginData.setAl_ip(req.getRemoteAddr());
				service.insertAuthLoginBean(authLoginData);
				// 錯誤訊息0帳號密碼錯誤
				model.addAttribute("b_loginerror", 0);
				return "admin/b_login";
			}
		}
		return "/admin/b_index";
	}
	@RequestMapping("/admin/b_logout")
	public String loginout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "/admin/b_login";
	}

//	@RequestMapping("/admin/b_logout")
//	public String changeblock(Model model,int a_id) {
//
//		return "/admin/b_login";
//	}
}
