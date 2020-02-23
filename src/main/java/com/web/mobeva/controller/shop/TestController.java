package com.web.mobeva.controller.shop;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.model.user.UserLoginBean;
import com.web.mobeva.service.shop.ShopService;
import com.web.mobeva.service.user.UserInfoService;

@Controller
public class TestController {

	ShopService service;
	UserInfoService u_service;

	@Autowired
	public void setService(ShopService service) {
		this.service = service;
	}

	@Autowired
	public void setService(UserInfoService u_service) {
		this.u_service = u_service;
	}

	@RequestMapping("/car")
	public String test(Model model) {
		List<UserCarBean> lists = service.getCarById(1);
		model.addAttribute("Cars", lists);
		for (UserCarBean cb : lists) {
			System.out.println(cb.getUserInfoBean().getU_id());
		}
		return "test";
	}

	@RequestMapping("/member")
	public String test1(Model model) {
		List<UserInfoBean> lists = service.getAllMember();
		model.addAttribute("Members", lists);
		return "test1";
	}

	@RequestMapping("/orderdetail")
	public String test2(Model model) {
//		List<BookingBean> lists = service.getAllBooking();
		List<MaintainBookingBean> lists = service.getBookingById(1);
		for (MaintainBookingBean bb : lists) {
			System.out.println(bb.getUserInfoBean().getU_id());
		}
		model.addAttribute("odetails", lists);
		return "test2";
	}

//	@RequestMapping("/profile")
//	public String profile(Model model) {
//		List<UserCarBean> uc = service.getCarById(1);
//		model.addAttribute("ucars", uc);
//		return "profile";
//	}

//	@RequestMapping("/googletest")
//	public String googletest(Model model) {
//		return "GoogleStartPage";
//	}
//
//	@PostMapping("/google/oauth2callback")
//	public void verifyToken(String idtokenstr) {
//		String userId = null;
//		String name = null;
//		String email = null;
//		// 驗證Google登入----------開始
//		System.out.println("idtokenstr: " + idtokenstr);
//		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(),
//				JacksonFactory.getDefaultInstance())
//						.setAudience(Collections.singletonList(
//								"962906715437-c9ouhgk61ae9n3r1ivh546igfdmkc6sq.apps.googleusercontent.com"))
//						.build();
//
//		GoogleIdToken idToken = null;
//
//		try {
//			idToken = verifier.verify(idtokenstr);
//		} catch (GeneralSecurityException e) {
//			System.out.println("驗證時出現GeneralSecurityException異常");
//		} catch (IOException e) {
//			System.out.println("驗證時出現IOException異常");
//		}
//
//		if (idToken != null) {
//			Payload payload = idToken.getPayload();
//
//			// Print user identifier
//			userId = payload.getSubject();
//			System.out.println("User ID: " + userId);
//
//			// Get profile information from payload
//			email = payload.getEmail();
////			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
//			name = (String) payload.get("name");
//			String pictureUrl = (String) payload.get("picture");
//			String locale = (String) payload.get("locale");
//			String familyName = (String) payload.get("family_name");
//			String givenName = (String) payload.get("given_name");
//
//			// Use or store profile information
//			// ...
//			System.out.println(name);
//			System.out.println(pictureUrl);
//			System.out.println(locale);
//			System.out.println(familyName);
//			System.out.println(givenName);
//
//		} else {
//			System.out.println("Invalid ID token.");
//		}
//		;
//		// 驗證Google登入----------結束
//		UserInfoBean uib = u_service.saveOpenID(userId,name,email);
//		System.out.println("--------------------------------------------------");
//		System.out.println("u_id: " + uib.getU_id());
//		System.out.println("open_id: " + uib.getU_openid());
//		System.out.println("名字: " + uib.getU_name());
//		System.out.println("帳號: " + uib.getU_account());
//		System.out.println("密碼 " + uib.getU_password());
//		System.out.println("地址: " + uib.getU_address());
//		System.out.println("手機: " + uib.getU_mobile());
//		System.out.println("信箱: " + uib.getU_email());
//
//	}


	@RequestMapping("/test7")
	public String test7(Model model) {
		return "test7";
	}
	
	@RequestMapping("/testStage")
	@ResponseBody
	public String testStage(@RequestParam("mb_date")String mb_date) {
		List<Integer> mbb = service.getStage(mb_date);
		String str = "";
		for(int mb:mbb) {
			str += mb + " ";
		}
		System.out.println(str);
		return str;
	}
	
	@RequestMapping(value = "/test8" , produces="application/json")
	public @ResponseBody List<UserInfoBean > test8(Model model) {
		return service.getAllMember();
	}
	
//	
//	@RequestMapping("/Mlogin")
//	public String Mlogin(Model model) {
//		return "Mlogin";
//	}
//	
//	@PostMapping("/Mlogindo")
//	public String Mlogindo(Model model, String account, String password, HttpServletRequest req) throws ParseException {
//		UserInfoBean userInfoData = new UserInfoBean();
//		UserLoginBean userLoginData = new UserLoginBean();
//		try {
//			userInfoData = u_service.getUserInfoBeanbyaccpwd(account, password);
//			// 判斷是否有openID但未綁定
//			if (userInfoData.getU_openid() != null && userInfoData.getU_status() != 2) {
//				// 錯誤訊息0帳號密碼錯誤(其實是有openID但未綁定)
//				model.addAttribute("loginerror", 0);
//				return "Mlogin";
//			}
//			// 判斷帳號是否註銷
//			if (userInfoData.getU_status() == 0) {
//				// 送出錯誤訊息2 帳號註銷
//				model.addAttribute("loginerror", 2);
//				return "Mlogin";
//			}
//			// 判斷黑名單時間是否為空,不為空進入撈時間,為空直接放行登入
//			if (userInfoData.getU_block() != null) {
//				// 將黑名單時間轉回毫秒
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				long block = sdf.parse(userInfoData.getU_block()).getTime();
//				// 得到現在時間毫秒
//				long nTime = new Date().getTime();
//				// 如果黑名單時間大於現在時間,代表此帳號已鎖定
//				if (block > nTime) {
//					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//					String blocktime = sdf2.format(block);
//					// Show出鎖定時間給前端
//					model.addAttribute("blocktime", blocktime);
//					// 傳出鎖定資訊給前端
//					model.addAttribute("block", 1);
//					return "Mlogin";
//				}
//			}
//			// 得到一個登入資訊
//			HttpSession loginsession = req.getSession();
//			userLoginData.setUserInfoBean(userInfoData);
//			userLoginData.setUl_ip(req.getRemoteAddr());
//			u_service.insertUserLoginBean(userLoginData);
//			// 重新取得登入資訊將最後登入時間存入會員資料表
//			UserLoginBean lastLoginData = u_service.getUserLoginBeanbyId(userLoginData.getUl_id());
//			userInfoData.setU_lastlogin(lastLoginData.getUl_date());
//			u_service.upadtetUserInfo(userInfoData);
//			// 存入使用者資訊
//			loginsession.setAttribute("loginuser", userInfoData);
//			// 存入已登入訊息前端
//			loginsession.setAttribute("loginsuccess", 1);
//		} catch (Exception e) {
//			// 帳號對密碼錯
//			try {
//				// 新增一個登入資訊
//				userInfoData = u_service.getUserInfoBeanbyaccount(account);
//				userLoginData.setUserInfoBean(userInfoData);
//				userLoginData.setUl_status(0);
//				userLoginData.setUl_ip(req.getRemoteAddr());
//				u_service.insertUserLoginBean(userLoginData);
//				// 判斷是否超過三次
//				if (u_service.getUserLoginLastTimebyuId(userInfoData.getU_id()) >= 3) {
//					// 產生SQL時間+10分鐘單位毫秒
//					long dNow = new Date().getTime() + 600000;
//					// 轉換成SQLdate格式
//					SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd k:mm:ss.SSS");
//					// 加入黑名單
//					userInfoData.setU_block(ft.format(dNow));
//					String name = userInfoData.getU_name();
//					String toemail = userInfoData.getU_email();
//					String mailsubject = "MOBEVA登入異常";
//					String mailmessage = "登入異常";
//					String ip = userLoginData.getUl_ip();
//					u_service.sendloginerror(name, toemail, mailsubject, mailmessage, ip);
//					u_service.upadtetUserInfo(userInfoData);
//				}
//				// 錯誤訊息1帳號錯誤
//				model.addAttribute("loginerror", 1);
//				return "Mlogin";
//			}
//			// 帳密全錯
//			catch (Exception e1) {
//				// 得到一個登入資訊
//				userInfoData = u_service.getUserInfoBeanbyaccount("AccountNotExist");
//				userLoginData.setUserInfoBean(userInfoData);
//				userLoginData.setUl_status(0);
//				userLoginData.setUl_ip(req.getRemoteAddr());
//				u_service.insertUserLoginBean(userLoginData);
//				// 錯誤訊息0帳號密碼錯誤
//				model.addAttribute("loginerror", 0);
//				return "Mlogin";
//			}
//		}
//		return "index";
//	}
	
}
