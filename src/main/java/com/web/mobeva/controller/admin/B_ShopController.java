package com.web.mobeva.controller.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.model.shop.ShopDetailsBean;
import com.web.mobeva.model.shop.ShopOrderBean;
import com.web.mobeva.model.shop.ShopProductsBean;
import com.web.mobeva.service.shop.ShopService;

@Controller
public class B_ShopController {

	ShopService service;
	private String noImage = "NoImg.png";

	@Autowired
	public void setService(ShopService service) {
		this.service = service;
	}

	// 表單日期字串轉成Date格式(前端的日期格式只撈到yyyy-MM-dd)時分秒撈不到
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}

	// 查詢各類別的商品資料
	@RequestMapping("/admin/b_cate")
	public String allProducts(Model model,HttpSession session) {
		
		AuthinfoBean aib = (AuthinfoBean) session.getAttribute("b_loginuser");
		if(aib == null) {
			return "redirect:/admin/b_login";
		}
		if(aib.getAg_type() != 1 && aib.getAg_type() != 0) {
			model.addAttribute("ErrMsg", "商城部門");
			return "admin/b_forbidden";
		}
		
		model.addAttribute("produceBycate1", service.getProductsByCategory_B(1));
		model.addAttribute("produceBycate2", service.getProductsByCategory_B(2));
		model.addAttribute("produceBycate3", service.getProductsByCategory_B(3));
		return "admin/b_cate";
	}

	// 取得要更新的商品資料並填入表格
	@GetMapping("/admin/product/update")
	public String preUpdateProduct(Model model, @RequestParam("id") int sp_id) {
		ShopProductsBean pb = service.getProductById(sp_id);
		System.out.println("Sp_createdate: " + pb.getSp_createdate());
		model.addAttribute("ProductBean", pb);
		return "admin/b_productedit";
	}

	// 更新商品資料
	@PostMapping("/admin/product/update")
	public String productDetailUpdate(Model model, @ModelAttribute("ProductBean") ShopProductsBean pb) {
		System.out.println(pb.getSp_createdate());

		String savePath = "C:\\_JSP\\MOBEVA\\images";
		String fileOriginalName;
		String saveName;

		// 判斷是否上傳圖片
		// 如果沒有上傳
		if (pb.getUploadImg1().getSize() != 0) {
			fileOriginalName = pb.getUploadImg1().getOriginalFilename();
			saveName = pb.getSp_id() + "_1" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			service.saveUploadFile_B(pb.getUploadImg1(), saveName, savePath);
			pb.setSp_img1(saveName);
		};
		if (pb.getUploadImg2().getSize() != 0) {
			fileOriginalName = pb.getUploadImg2().getOriginalFilename();
			saveName = pb.getSp_id() + "_2" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			service.saveUploadFile_B(pb.getUploadImg2(), saveName, savePath);
			pb.setSp_img2(saveName);
		};
		if (pb.getUploadImg3().getSize() != 0) {
			fileOriginalName = pb.getUploadImg3().getOriginalFilename();
			saveName = pb.getSp_id() + "_3" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			service.saveUploadFile_B(pb.getUploadImg3(), saveName, savePath);
			pb.setSp_img3(saveName);
		};
		if (pb.getUploadintro().getSize() != 0) {
			fileOriginalName = pb.getUploadintro().getOriginalFilename();
			saveName = pb.getSp_id() + "_i" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			service.saveUploadFile_B(pb.getUploadintro(), saveName, savePath);
			pb.setSp_intro(saveName);
		};
		pb.setSp_modifieddate(new Date());
		service.updateProduct_B(pb);
		return "redirect:/admin/b_cate";
	}

	// 增加商品資料(取得空白表單)
	@GetMapping("/admin/product/add_product")
	public String preAddProduct(Model model) {
		model.addAttribute("ProductBean", new ShopProductsBean());
		return "admin/b_addproduct";
	}

	// 增加商品資料
	@PostMapping("/admin/product/add_product")
	public String AddProduct(Model model, @ModelAttribute("ProductBean") ShopProductsBean pb, HttpServletRequest req) {
//		System.out.println("路徑---->"+req.getServletContext().getRealPath("/resources/images/"));

		// 先儲存ShopProductsBean取得sp_id(圖片部分先為Null)
		pb.setSp_createdate(new Date());
		service.insertProduct_B(pb);
		System.out.println("前端新增的商品sp_id：" + pb.getSp_id());
		System.out.println("前端新增的商品sp_id：" + pb.getSp_createdate());
		// 取得新增商品的sp_id
		String spid = String.valueOf(pb.getSp_id());
		// 取得要儲存檔案的資料夾路徑(本機目錄)
		String savePath = "C:\\_JSP\\MOBEVA\\images";
			
		// 判斷是否有上傳圖片
		// 如果沒有上傳
		if (pb.getUploadImg1().getSize() == 0) {
			// 設定固定的找不到圖片的檔名
			pb.setSp_img1(noImage);
		} else {
			// 取得原始檔名
			String fileOriginalName = pb.getUploadImg1().getOriginalFilename();
			// 透過原始檔名取得副檔名
			String saveName = spid + "_1" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			// 更新Bean
			pb.setSp_img1(saveName);
			// 儲存在SERVER資料夾(MutiPartFile,新檔名,儲存路徑)
			service.saveUploadFile_B(pb.getUploadImg1(), saveName, savePath);
		}

		if (pb.getUploadImg2().getSize() == 0) {
			pb.setSp_img2(noImage);
		} else {
			String fileOriginalName = pb.getUploadImg2().getOriginalFilename();
			String saveName = spid + "_2" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			pb.setSp_img2(saveName);
			service.saveUploadFile_B(pb.getUploadImg2(), saveName, savePath);
		}
		if (pb.getUploadImg3().getSize() == 0) {
			pb.setSp_img3(noImage);
		} else {
			String fileOriginalName = pb.getUploadImg3().getOriginalFilename();
			String saveName = spid + "_3" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			pb.setSp_img3(saveName);
			service.saveUploadFile_B(pb.getUploadImg3(), saveName, savePath);
		}

		if (pb.getUploadintro().getSize() == 0) {
			pb.setSp_intro(noImage);
		} else {
			String fileOriginalName = pb.getUploadintro().getOriginalFilename();
			String saveName = spid + "_i" + fileOriginalName.substring(fileOriginalName.lastIndexOf("."));
			pb.setSp_intro(saveName);
			service.saveUploadFile_B(pb.getUploadintro(), saveName, savePath);
		}

		// 更新資料庫的Bean
		service.updateProduct_B(pb);

		return "redirect:/admin/b_cate"; 
	}
	
	//刪除商品
	@PostMapping("/admin/product/del_product")
	@ResponseBody
	public String delProduct(Model model,@RequestParam("sp_id")int sp_id) {
		int n = service.delProduct(sp_id);
		System.out.println("-------------------------");		
		System.out.println(n);
		return "success";
	}
	
	//------------------------------小黑開始------------------------
	@RequestMapping("/admin/b_order_list")
	public String b_order_list(Model model,HttpSession session) {
		AuthinfoBean aib = (AuthinfoBean) session.getAttribute("b_loginuser");
		if(aib == null) {
			return "redirect:/admin/b_login";
		}
		if(aib.getAg_type() != 1 && aib.getAg_type() != 0) {
			model.addAttribute("ErrMsg", "商城部門");
			return "admin/b_forbidden";
		}
		List<ShopOrderBean> list = service.getShopOrders();
		model.addAttribute("orders", list);
		return "/admin/b_order_list";
	}

	@RequestMapping("/admin/b_order_detail")
	public String b_order_detail(@RequestParam("id") int so_id, Model model) {
		List<ShopDetailsBean> list = service.getshopdetail(so_id);
		model.addAttribute("detail", list);
		return "/admin/b_order_detail";
	}

	@RequestMapping("/admin/delorder")
	public String delorder(@RequestParam("id") int so_id, Model model) {
		System.out.println(so_id);
		service.updateOrderStatusById(so_id, 0);
		return "redirect:/admin/b_order_list";
	}
	//------------------------------小黑結束------------------------
}
