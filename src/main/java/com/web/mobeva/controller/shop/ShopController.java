package com.web.mobeva.controller.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.shop.ShopCartBean;
import com.web.mobeva.model.shop.ShopDetailsBean;
import com.web.mobeva.model.shop.ShopOrderBean;
import com.web.mobeva.model.shop.ShopProductsBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.shop.ShopService;

@Controller
@SessionAttributes("userInfoSession")
public class ShopController {

	ShopService service;

	@Autowired
	public void setService(ShopService service) {
		this.service = service;
	}
//------------------------------仕杰開始------------------------	

//	@RequestMapping("/shop")
//	public String shop(Model model) {
//		List<ShopProductsBean> lists = service.getAllProducts();
//		List<ShopProductsBean> lists = service.getProductsByPage(1);
//		List<ShopProductsBean> recommendlists = service.getRecommendProducts();
//		model.addAttribute("pageNo", 1);
//		model.addAttribute("totalPages", service.getTotalPages());
//		model.addAttribute("shopproducts", lists);
//		model.addAttribute("recommendproducts", recommendlists);
//		return "shop";
//	}
	// 查詢所有類別商品(按照頁碼)，查詢推薦商品
	@RequestMapping("/shop")
	public String shop(Model model, @RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo) {
//		List<ShopProductsBean> lists = service.getAllProducts();
		List<ShopProductsBean> lists = service.getProductsByPage(pageNo);
		// 查詢推薦商品
		List<ShopProductsBean> recommendlists = service.getRecommendProducts();
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPages", service.getTotalPages(0));
		model.addAttribute("shopproducts", lists);
		model.addAttribute("recommendproducts", recommendlists);
		return "shop";
	}

	// 查詢類別商品
	@RequestMapping("/shop/{category}")
	public String getProductsByCategory(@PathVariable("category") int cid, Model model,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo) {
		List<ShopProductsBean> lists = service.getProductsByCategory(cid, pageNo);
		// 查詢推薦商品
		List<ShopProductsBean> recommendlists = service.getRecommendProducts();
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPages", service.getTotalPages(cid));
		model.addAttribute("category", cid);
		model.addAttribute("shopproducts", lists);
		model.addAttribute("recommendproducts", recommendlists);
		return "shop";
	}

	// 查詢個別商品
	@RequestMapping("/shopdetail/{id}")
	public String getProductById(@PathVariable("id") int id, Model model) {
		ShopProductsBean sp = service.getProductById(id);
		List<ShopProductsBean> lists = service.getRelatedProducts(sp.getSp_id(), sp.getSp_category());
		List<ShopProductsBean> recommendlists = service.getRecommendProducts();
		model.addAttribute("product", sp);
		model.addAttribute("relatedproducts", lists);
		model.addAttribute("recommendproducts", recommendlists);
		return "shop_detail";
	}

	// 商品加入購物車
	@PostMapping("/shopCart/add")
	@ResponseBody
	public String addProductToShopCart(@RequestParam("sp_id") int sp_id, @RequestParam("sc_pcs") int sc_pcs,
			Model model, HttpSession session) {

		// 抓Session看有沒有登入
		UserInfoBean ui = (UserInfoBean) session.getAttribute("loginuser");
		if (ui == null) {
			return "visitor";
		}

		ShopCartBean sc = service.existByUidSpid(ui.getU_id(), sp_id);
		int n = service.getStocksBySpid(sp_id);

		// 如果庫存數量為0
		if (sc_pcs > n) {
			System.out.println("進到SOLDOUT");
			return "soldout";
		}
		if (sc != null) {
			sc.setSc_pcs(sc.getSc_pcs() + sc_pcs);
			service.updateShopCart(sc);
		} else {
			sc = new ShopCartBean();
			sc.setUserInfoBean(ui);
			sc.setShopProductsBean(service.getProductById(sp_id));
			sc.setSc_pcs(sc_pcs);
			service.addShopCart(sc);
		}
		return "true";
	}

	// 模糊查詢
	@RequestMapping("/shopsearch")
	public String shopSearch(@RequestParam("searchstr") String shopSearch, Model model,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") int pageNo) {
		List<ShopProductsBean> lists = service.getSearchProducts(shopSearch, pageNo);
		List<ShopProductsBean> recommendlists = service.getRecommendProducts();
		model.addAttribute("searchstr", shopSearch);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("totalPages", service.getTotalPagesBySearch(shopSearch));
		model.addAttribute("shopproducts", lists);
		model.addAttribute("recommendproducts", recommendlists);
		return "shop_search";
	}

//	//配合SESSION一開始是空值的時候
//	@ModelAttribute("shopCartSession")
//	List<ShopCartBean> getList() {
//	  return new ArrayList<>();
//	}

	// 測試SESSION_SessionAttributes
	@RequestMapping("/test3")
	public String test3(Model model, HttpSession session, SessionStatus status) {
		// 清空Session_SessionAttributes
//		status.setComplete();
		return "test3";
	}

	// 測試SESSION_HttpSession
	@RequestMapping("/test4")
	public String test4(Model model, HttpSession session) {
		// 清空Session_手動加入的Session
//		session.invalidate();
		return "test4";
	}

	// Form:form表單有包含其他Bean
	@GetMapping("/test5")
	public String test5(Model model, HttpServletRequest req) {
		// 用戶1登入
		HttpSession sessionTest = req.getSession();
		UserInfoBean ui = new UserInfoBean();
		ui = service.getUserById(1);
		sessionTest.setAttribute("userSession", ui);

		MaintainBookingBean mbb = new MaintainBookingBean();
		mbb.setUserInfoBean(ui);
		model.addAttribute("MaintainBookingBean", mbb);
		return "test5";
	}

	@PostMapping("/test5")
	public String test5(Model model, @ModelAttribute("MaintainBookingBean") MaintainBookingBean mbb,
			HttpSession session) {
		System.out.println("前端輸入的主鍵單號：" + mbb.getMb_id());
		System.out.println("前端輸入的預約狀態：" + mbb.getMb_status());
		System.out.println("前端輸入的登入用戶：" + mbb.getUserInfoBean().getU_name());
		System.out.println("前端輸入的IDcard：" + mbb.getUserInfoBean().getU_idcard());
//		System.out.println("前端輸入的保養車廠ID：" + mbb.getMaintainStationBean().getMs_id());
//		System.out.println("前端輸入的保養車廠：" + mbb.getMaintainStationBean().getMs_name());
//		System.out.println("前端輸入的保養方案流水號：" + mbb.getMaintainInfoBean().getMi_idx());
//		System.out.println("前端輸入的保養方案：" + mbb.getMaintainInfoBean().getMi_name());
//		System.out.println("前端輸入的保養方案ID：" + mbb.getMaintainInfoBean().getMi_id());
		System.out.println("前端輸入的車牌號碼：" + mbb.getUserCarBean().getUc_number());
		System.out.println("前端輸入的預約時段：" + mbb.getMb_stage());

		service.MaintainBookingsave(mbb);
		return "index";
	}

	@ModelAttribute("StationList")
	public Map<Integer, String> getStationList() {
		Map<Integer, String> stationMap = new HashMap<>();
		List<MaintainStationBean> list = service.getStationList();
		for (MaintainStationBean msb : list) {
			stationMap.put(msb.getMs_id(), msb.getMs_name());
		}
		return stationMap;
	}

	@GetMapping("/test6")
	public String test6(Model model) {
		UserInfoBean ui = new UserInfoBean();
		ui = service.getUserById(1);
		model.addAttribute("UsersInfo", ui);

		return "test6";
	}

	@PostMapping("/test6")
	public String test6(Model model, @ModelAttribute("UsersInfo") UserInfoBean ui) {
		System.out.println(ui.getU_name());
		System.out.println(ui.getU_email());
		System.out.println(ui.getU_address());
		System.out.println(ui.getU_account());
		System.out.println(ui.getU_idcard());
		System.out.println("--------------------------------");
		UserInfoBean uc = new UserInfoBean();
		uc = service.getUserById(1);
		uc.setU_name(ui.getU_name());
		uc.setU_mobile(ui.getU_mobile());
		uc.setU_email(ui.getU_email());
		uc.setU_address(ui.getU_address());
		System.out.println(uc.getU_id());
		System.out.println(uc.getU_email());
		System.out.println(uc.getU_name());
		System.out.println(uc.getU_account());

		service.updateUserInfo(uc);
		return "index";
	}

//------------------------------仕杰結束------------------------

//------------------------------小黑開始------------------------
	
	// 購物車網頁
	@RequestMapping("/cart")
	public String allcart(Model model, HttpSession session) {
		// 檢視登入狀態
		try {
			int login = (int) session.getAttribute("loginsuccess");
		} catch (Exception e) {
			return "login";
		}
		UserInfoBean userInfoData = (UserInfoBean) session.getAttribute("loginuser");
		List<ShopCartBean> list = service.getShopcart(userInfoData.getU_id());
		// 儲存庫存不足的商品
		List<ShopProductsBean> getdeletepid = new ArrayList<ShopProductsBean>();
		for (ShopCartBean ShopCartDate : list) {
			if (ShopCartDate.getShopProductsBean().getSp_stock() < ShopCartDate.getSc_pcs()) {
				getdeletepid.add(ShopCartDate.getShopProductsBean());
				service.delectcartpd(ShopCartDate.getShopProductsBean().getSp_id());
			}
		}
		// 重新取得判斷庫存後的購物車
		List<ShopCartBean> list2 = service.getShopcart(userInfoData.getU_id());
		model.addAttribute("deletepid", getdeletepid);
//		判斷購物車內是否有商品
		model.addAttribute("cart", list2);
		return "cart";
	}

	// 訂單紀錄
	@RequestMapping("/order_list")
	public String allorder(Model model, HttpSession session) {
		// 檢視登入狀態
		try {
			int login = (int) session.getAttribute("loginsuccess");
		} catch (Exception e) {
			return "login";
		}
		UserInfoBean userInfoData = (UserInfoBean) session.getAttribute("loginuser");
		List<ShopOrderBean> list = service.getshoporder(userInfoData.getU_id());
		model.addAttribute("order_list", list);
		return "order_list";
	}

	// 訂單明細
	@RequestMapping("/order_detail")
	public String getsoid(@RequestParam("id") Integer so_id, Model model) {
		List<ShopDetailsBean> list = service.getshopdetail(so_id);
		model.addAttribute("order_detail", list);
		return "order_detail";
	}

	// ajax更新購物車
	@RequestMapping(value = "/updatecart2", method = RequestMethod.POST)
	@ResponseBody
	public String updatecart2(Model model, @RequestParam("sp_id") int sp_id, @RequestParam("sc_pcs") int sc_pcs) {
		service.updateAllShopcart(sp_id, sc_pcs);
		return "true";
	}

	// ajax取消購物車商品
	@RequestMapping(value = "/deletecart2", method = RequestMethod.POST)
	@ResponseBody
	public String deletecartpd2(Model model, @RequestParam("sp_id2") int sp_id) {
		service.delectcartpd(sp_id);
		return "true";
	}

	// 轉跳結帳頁面
	@RequestMapping("/checkout")
	public String getcheckout(Model model, int so_totalprice, String[] productid, String[] sd_pcs, String[] sp_price,
			int payment, HttpSession session) {
		//判斷庫存方法開始
		UserInfoBean userInfoData = (UserInfoBean) session.getAttribute("loginuser");
		List<ShopCartBean> list = service.getShopcart(userInfoData.getU_id());
		// 儲存庫存不足的商品
		List<ShopProductsBean> getdeletepid = new ArrayList<ShopProductsBean>();
		//存入是否做過庫存判斷次數
		int count=0;
		//做庫存判斷;
		for (ShopCartBean ShopCartDate : list) {
			if (ShopCartDate.getShopProductsBean().getSp_stock() < ShopCartDate.getSc_pcs()) {
				getdeletepid.add(ShopCartDate.getShopProductsBean());
				service.delectcartpd(ShopCartDate.getShopProductsBean().getSp_id());
				count++;
			}
		}
		if(count!=0) {
			// 重新取得判斷庫存後的購物車
			List<ShopCartBean> list2 = service.getShopcart(userInfoData.getU_id());
			model.addAttribute("cart",list2);
			model.addAttribute("deletepid", getdeletepid);
			return "cart";
		}
		session.setAttribute("sp_id", productid);
		session.setAttribute("sd_pcs", sd_pcs);
		session.setAttribute("sp_price", sp_price);
		session.setAttribute("so_totalprice", so_totalprice);
		session.setAttribute("payment", payment);
		model.addAttribute("checkout", so_totalprice);
		return "checkout";
	}

	// 結帳完跳回購物訂單查詢
	@RequestMapping("/checkoutfinshed")
	public String checkoutfinshed(Model model, HttpSession session) {
		//判斷庫存方法開始
		UserInfoBean userInfoData = (UserInfoBean) session.getAttribute("loginuser");
		List<ShopCartBean> list1 = service.getShopcart(userInfoData.getU_id());
		// 儲存庫存不足的商品
		List<ShopProductsBean> getdeletepid = new ArrayList<ShopProductsBean>();
		//存入是否做過庫存判斷次數
		int count=0;
		//做庫存判斷;
		for (ShopCartBean ShopCartDate : list1) {
			if (ShopCartDate.getShopProductsBean().getSp_stock() < ShopCartDate.getSc_pcs()) {
				getdeletepid.add(ShopCartDate.getShopProductsBean());
				service.delectcartpd(ShopCartDate.getShopProductsBean().getSp_id());
				count++;
			}
		}
		if(count!=0) {
			// 重新取得判斷庫存後的購物車
			List<ShopCartBean> list2 = service.getShopcart(userInfoData.getU_id());
			model.addAttribute("cart",list2);
			model.addAttribute("deletepid", getdeletepid);
			return "cart";
		}	
		// 結帳後先存大單
		ShopOrderBean shopOrderData = new ShopOrderBean();
		shopOrderData.setUserInfoBean((UserInfoBean) session.getAttribute("loginuser"));
		int payment = (int) session.getAttribute("payment");
		int so_totalprice = (int) session.getAttribute("so_totalprice");
		shopOrderData.setSo_payment(payment);
		shopOrderData.setSo_totalprice(so_totalprice);
		service.insertShopOrder(shopOrderData);
		// 再存出明細
		String[] sp_id = (String[]) session.getAttribute("sp_id");
		String[] sd_pcs = (String[]) session.getAttribute("sd_pcs");
		String[] sp_price = (String[]) session.getAttribute("sp_price");
		int so_id = shopOrderData.getSo_id();
		for (int i = 0; i < sp_id.length; i++) {
			ShopProductsBean shopProductsDate = service.getShopProductBeanbyId(Integer.parseInt(sp_id[i]));
			ShopDetailsBean shopDetailsData = new ShopDetailsBean();
			ShopOrderBean shopOrderDatelast = service.getShopOrderBeanbyId(so_id);
			shopDetailsData.setShopProductsBean(shopProductsDate);
			shopDetailsData.setShopOrderBean(shopOrderDatelast);
			shopDetailsData.setSd_pcs(Integer.parseInt(sd_pcs[i]));
			int price = Integer.parseInt(sp_price[i]) * Integer.parseInt(sd_pcs[i]);
			shopDetailsData.setSd_price(price);
			service.insertShopdetails(shopDetailsData);
			// 商品原庫存-商品結帳數量塞入方法做庫存更新
			System.out.println(shopProductsDate.getSp_stock());
			System.out.println(Integer.parseInt(sd_pcs[i]));
			int stock = shopProductsDate.getSp_stock() - Integer.parseInt(sd_pcs[i]);
			service.updatProductStockById(Integer.parseInt(sp_id[i]), stock);
		}
		List<ShopOrderBean> list = service.getshoporder(userInfoData.getU_id());
		service.checkoutdeletecart(userInfoData.getU_id());
		model.addAttribute("order_list", list);
		return "redirect:/order_list";
	}
	@PostMapping("/deluserorder")
	public String deluserorder(int so_id, Model model) {
		System.out.println(so_id);
		service.updateOrderStatusById(so_id, 0);
		return "redirect:/order_list";
	}
	
//------------------------------小黑結束------------------------

}
