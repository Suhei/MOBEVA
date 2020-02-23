package com.web.mobeva.controller.user;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.model.user.UserLoginBean;
import com.web.mobeva.model.user.UserQuizBean;
import com.web.mobeva.service.user.UserInfoService;

@Controller
public class LoginController {

	UserInfoService service;

	@Autowired
	public void setService(UserInfoService service) {
		this.service = service;
	}

//	==== 轉換前端傳回的時間（字串 -> 時間）==== 
	@org.springframework.web.bind.annotation.InitBinder
	public void InitBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}

//------------------------------小黑開始------------------------

	@GetMapping("/register")
	public String register1(Model model) {
		UserInfoBean ub = new UserInfoBean();
		model.addAttribute("UserInfoBean", ub);
		return "register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute("UserInfoBean") UserInfoBean ub, int safeQ, String safeAns, Model model) {
		if (service.checkAccountExist(ub.getU_account())) {
			model.addAttribute("ErrMsg", "帳號已存在");
			return "register";
		}
		service.insertUserinfo(ub);
		UserQuizBean userQuizData = new UserQuizBean();
		userQuizData.setUserInfoBean(ub);
		userQuizData.setUq_question(safeQ);
		userQuizData.setUq_answer(safeAns);
		service.insertQuiz(userQuizData);
		return "login";
	}

//	導入忘記密碼頁面輸入帳號,email
	@RequestMapping("/forgetPassword")
	public String forget(Model model) {
		return "forgetPassword";
	}

//	輸入帳號,email後帶出安全問題
	@RequestMapping("/checkedacc_email")
	public String checkedacc_email(Model model, String account, String email, HttpSession session) {
		UserInfoBean userInfoData = new UserInfoBean();
		try {
			userInfoData = service.getUserInfoBeanbyaccount(account);
			if (((userInfoData.getU_email()).equals(email)) == false) {
//				email輸入錯誤
				model.addAttribute("forgeterror", 0);
				return "forgetPassword";
			}
		} catch (Exception e) {
//			查無此帳號
			model.addAttribute("forgeterror", 1);
			return "forgetPassword";
		}
		UserQuizBean userQuizData = service.getUserQuizBeanByUid(userInfoData.getU_id());
		session.setAttribute("forgetuserData", userQuizData);
		return "checkedacc_email";
	}

//	安全問題回答正確寄出重置密碼驗證信
	@PostMapping("/modifiedpassword")
	public String modifiedpwd(Model model, String safeA, HttpSession session, HttpServletRequest req)
			throws ParseException {
		UserQuizBean userQuizData = (UserQuizBean) session.getAttribute("forgetuserData");
		System.out.println("2--------------------------------");
		System.out.println(userQuizData.getUserInfoBean().getU_block());
		// 判斷有無黑名單時間
		if (userQuizData.getUserInfoBean().getU_block() != null) {
			UserInfoBean blockuserData = userQuizData.getUserInfoBean();
			// 將黑名單時間轉回毫秒
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long block = sdf.parse(blockuserData.getU_block()).getTime();
			// 得到現在時間毫秒
			long nTime = new Date().getTime();
			// 如果黑名單時間大於現在時間10分鐘,代表此帳號已鎖定
			if (block > nTime) {
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String blocktime = sdf2.format(block);
				// Show出鎖定時間給前端
				model.addAttribute("blocktime", blocktime);
				// 傳出鎖定資訊給前端
				model.addAttribute("block", 1);
				return "login";
			}
		}
		if (((userQuizData.getUq_answer()).equals(safeA)) == false) {
			UserLoginBean userLoginData = new UserLoginBean();
			UserInfoBean erroruserData = userQuizData.getUserInfoBean();
			// 新增一個登入資訊
			erroruserData = service.getUserInfoBeanbyaccount(erroruserData.getU_account());
			userLoginData.setUserInfoBean(erroruserData);
			userLoginData.setUl_status(0);
			userLoginData.setUl_ip(req.getRemoteAddr());
			service.insertUserLoginBean(userLoginData);
			if (service.getUserLoginLastTimebyuId(erroruserData.getU_id()) >= 3) {
				// 產生SQL時間+10分鐘單位毫秒
				long dNow = new Date().getTime() + 600000;
				// 轉換成SQLdate格式
				SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd k:mm:ss.SSS");
				// 加入黑名單
				erroruserData.setU_block(ft.format(dNow));
//				把更新後的UserQuizBean()更新session
				session.setAttribute("forgetuserData", erroruserData.getUserQuizBean());
				service.upadtetUserInfo(erroruserData);
			}
//			如果答案不一致
			model.addAttribute("safeerror", 0);
			return "checkedacc_email";
		}
		String name = userQuizData.getUserInfoBean().getU_name();
		String toemail = userQuizData.getUserInfoBean().getU_email();
		String mailsubject = "MOBEVA重置密碼";
		String password = "Aso1!4e389";
		String mailmessage = "重置密碼";
//		先更改使用者原密碼
		UserInfoBean userinfoData = userQuizData.getUserInfoBean();
		userinfoData.setU_password(password);
		service.upadtetUserInfo(userinfoData);
		service.sendPwd(name, toemail, mailsubject, mailmessage, password);
		return "modifiedpassword";
	}

//	取得驗證信後至此視窗修改密碼
	@PostMapping("/updatepassword")
	public String changepassword(Model model, String password, String newpassword1, String newpassword2,
			HttpSession session) {
		UserQuizBean userQuizData = (UserQuizBean) session.getAttribute("forgetuserData");
		UserInfoBean userinfoData = new UserInfoBean();
		userinfoData = userQuizData.getUserInfoBean();
//		如果舊密碼不一樣
		if (((userinfoData.getU_password()).equals(password)) == false) {
			model.addAttribute("notsame", 0);
			return "/modifiedpassword";
		}
//		如果新密碼與再次輸入不一致
		if ((newpassword1.equals(newpassword2)) == false) {
			model.addAttribute("notsame", 1);
			return "/modifiedpassword";
		}
		// 如果都一樣更新密碼成功
		userinfoData.setU_password(newpassword1);
		service.upadtetUserInfo(userinfoData);
		model.addAttribute("notsame", 2);
		session.invalidate();
		return "login";
	}

	@PostMapping("/logindo")
	public String logindo(Model model, String account, String password, HttpServletRequest req) throws ParseException {
		UserInfoBean userInfoData = new UserInfoBean();
		UserLoginBean userLoginData = new UserLoginBean();
		try {
			userInfoData = service.getUserInfoBeanbyaccpwd(account, password);
			// 判斷是否有openID但未綁定
			if (userInfoData.getU_openid() != null && userInfoData.getU_status() != 2) {
				// 錯誤訊息0帳號密碼錯誤(其實是有openID但未綁定)
				model.addAttribute("loginerror", 0);
				return "login";
			}
			// 判斷帳號是否註銷
			if (userInfoData.getU_status() == 0) {
				// 送出錯誤訊息2 帳號註銷
				model.addAttribute("loginerror", 2);
				return "login";
			}
			// 判斷黑名單時間是否為空,不為空進入撈時間,為空直接放行登入
			if (userInfoData.getU_block() != null) {
				// 將黑名單時間轉回毫秒
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long block = sdf.parse(userInfoData.getU_block()).getTime();
				// 得到現在時間毫秒
				long nTime = new Date().getTime();
				// 如果黑名單時間大於現在時間,代表此帳號已鎖定
				if (block > nTime) {
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String blocktime = sdf2.format(block);
					// Show出鎖定時間給前端
					model.addAttribute("blocktime", blocktime);
					// 傳出鎖定資訊給前端
					model.addAttribute("block", 1);
					return "login";
				}
			}
			// 得到一個登入資訊
			HttpSession loginsession = req.getSession();
			userLoginData.setUserInfoBean(userInfoData);
			userLoginData.setUl_ip(req.getRemoteAddr());
			service.insertUserLoginBean(userLoginData);
			// 重新取得登入資訊將最後登入時間存入會員資料表
			UserLoginBean lastLoginData = service.getUserLoginBeanbyId(userLoginData.getUl_id());
			userInfoData.setU_lastlogin(lastLoginData.getUl_date());
			service.upadtetUserInfo(userInfoData);
			// 存入使用者資訊
			loginsession.setAttribute("loginuser", userInfoData);
			// 存入已登入訊息前端
			loginsession.setAttribute("loginsuccess", 1);
		} catch (Exception e) {
			// 帳號對密碼錯
			try {
				// 新增一個登入資訊
				userInfoData = service.getUserInfoBeanbyaccount(account);
				userLoginData.setUserInfoBean(userInfoData);
				userLoginData.setUl_status(0);
				userLoginData.setUl_ip(req.getRemoteAddr());
				service.insertUserLoginBean(userLoginData);
				// 判斷是否超過三次
				if (service.getUserLoginLastTimebyuId(userInfoData.getU_id()) >= 3) {
					// 產生SQL時間+10分鐘單位毫秒
					long dNow = new Date().getTime() + 600000;
					// 轉換成SQLdate格式
					SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd k:mm:ss.SSS");
					// 加入黑名單
					userInfoData.setU_block(ft.format(dNow));
					String name = userInfoData.getU_name();
					String toemail = userInfoData.getU_email();
					String mailsubject = "MOBEVA登入異常";
					String mailmessage = "登入異常";
					String ip = userLoginData.getUl_ip();
					service.sendloginerror(name, toemail, mailsubject, mailmessage, ip);
					service.upadtetUserInfo(userInfoData);
				}
				// 錯誤訊息1帳號錯誤
				model.addAttribute("loginerror", 1);
				return "login";
			}
			// 帳密全錯
			catch (Exception e1) {
				// 得到一個登入資訊
				userInfoData = service.getUserInfoBeanbyaccount("AccountNotExist");
				userLoginData.setUserInfoBean(userInfoData);
				userLoginData.setUl_status(0);
				userLoginData.setUl_ip(req.getRemoteAddr());
				service.insertUserLoginBean(userLoginData);
				// 錯誤訊息0帳號密碼錯誤
				model.addAttribute("loginerror", 0);
				return "login";
			}
		}
		return "index";
	}

	@RequestMapping("/logout")
	public String loginout(Model model, HttpSession session) {
		session.invalidate();
		return "login";
	}

//------------------------------小黑結束------------------------	

//------------------------------仕杰開始------------------------
	@PostMapping("/google/oauth2callback")
	@ResponseBody
	public String verifyToken(String idtokenstr, HttpServletRequest req) {
		String userId = null;
		String name = null;
		String email = null;
		// 驗證Google登入----------開始
		System.out.println("idtokenstr: " + idtokenstr);
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(),
				JacksonFactory.getDefaultInstance())
						.setAudience(Collections.singletonList(
								"962906715437-c9ouhgk61ae9n3r1ivh546igfdmkc6sq.apps.googleusercontent.com"))
						.build();

		GoogleIdToken idToken = null;

		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}

		if (idToken != null) {
			Payload payload = idToken.getPayload();

			// Print user identifier
			userId = payload.getSubject();
			System.out.println("User ID: " + userId);

			// Get profile information from payload
			email = payload.getEmail();
//			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");
			String locale = (String) payload.get("locale");
			String familyName = (String) payload.get("family_name");
			String givenName = (String) payload.get("given_name");

			// Use or store profile information
			// ...
			System.out.println(name);
			System.out.println(pictureUrl);
			System.out.println(locale);
			System.out.println(familyName);
			System.out.println(givenName);

		} else {
			System.out.println("Invalid ID token.");
		}
		;
		// 驗證Google登入----------結束
		UserInfoBean uib = service.saveOpenID(userId, name, email);
//		System.out.println(uib.getU_name() + "-------------" + uib.getU_id());
//		System.out.println(uib.getU_name() + "------status-------" + uib.getU_status());
//		System.out.println(uib.getU_name() + "------block-------" + uib.getU_block());

		try {
			// 字串轉時間
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date blockTime = sdf.parse(uib.getU_block());
			// 判斷封鎖時間是否大於現在時間
			if (blockTime.after(new Date())) {
				return "block";
			}
		} catch (ParseException e) {
			System.out.println("ParseException");
			e.printStackTrace();
			// 當沒有封鎖時間的時候，catch NullPointerException
		} catch (NullPointerException e) {
			System.out.println("NullPointerException");
		}
		// 判斷目前帳號是否被註銷
		if (uib.getU_status() == 0) {
			return "del";
		}

		HttpSession loginsession = req.getSession();
		loginsession.setAttribute("loginuser", uib);
		loginsession.setAttribute("loginsuccess", 1);
		System.out.println("--------------------------------------------------");
		System.out.println("u_id: " + uib.getU_id());
		System.out.println("open_id: " + uib.getU_openid());
		System.out.println("名字: " + uib.getU_name());
		System.out.println("帳號: " + uib.getU_account());
		System.out.println("密碼 " + uib.getU_password());
		System.out.println("地址: " + uib.getU_address());
		System.out.println("手機: " + uib.getU_mobile());
		System.out.println("信箱: " + uib.getU_email());
		// 寫入登入資訊
		UserLoginBean userLoginData = new UserLoginBean();
		userLoginData.setUserInfoBean(uib);
		userLoginData.setUl_ip(req.getRemoteAddr());
		service.insertUserLoginBean(userLoginData);

		return "success";

	}
//------------------------------仕杰結束------------------------	

//------------------------------小米哥開始------------------------	

//==== openid綁定帳號開始 ====
	@GetMapping("/openid_binding")
	public String openidBinding(Model model, HttpSession session) {
		// 抓 Session 是否已登入
		UserInfoBean ub = (UserInfoBean) session.getAttribute("loginuser");
		if (ub == null) {
			return "redirect:/login";
		} else if (ub != null && ub.getU_openid() == null) {
			return "redirect:/profile";
		}
		ub.setU_account("");
		ub.setU_password("");
		ub.setU_idcard("");
		model.addAttribute("openid_binding", ub);
		return "openid_binding";
	}

	@PostMapping("/openid_binding")
	public String openidBindingDo(@ModelAttribute("UserInfoBean") UserInfoBean ub, HttpSession session, Model model,
			Integer safeQ, String safeAns) {
		// openid 綁定帳號時，檢查帳號是否存在
		if (service.checkAccountExist(ub.getU_account())) {
			model.addAttribute("ErrMsg", "帳號已存在");
			model.addAttribute("openid_binding", ub);
			return "openid_binding";
		}
		// 進行綁定帳號資料更新
		service.updateUserInfo(ub);

		// 進行綁定安全問題新增
		UserQuizBean uqb = new UserQuizBean();
		uqb.setUq_question(safeQ);
		uqb.setUq_answer(safeAns);
		uqb.setUserInfoBean(ub);
		service.insertQuiz(uqb);
		session.setAttribute("loginuser", ub);
		return "redirect:/profile";
	}
//			==== openid綁定帳號結束 ====

//------------------------------小米哥結束------------------------	

}
