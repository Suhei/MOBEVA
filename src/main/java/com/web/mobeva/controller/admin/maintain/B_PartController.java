package com.web.mobeva.controller.admin.maintain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.mobeva.model.maintain.MaintainPartsBean;
import com.web.mobeva.service.part.PartService;

@Controller
public class B_PartController {
	PartService pService;

	@Autowired
	public void setpService(PartService pService) {
		this.pService = pService;
	}

	// --------------後台------------------
	/** 顯示所有零件 */
	@RequestMapping("/admin/b_mp_list")
	public String getAllM_parts(Model model) {
		/** 向資料庫取MaintainPartsBean 給前端modelAttribute="m_parts" */
		List<MaintainPartsBean> lists = pService.getAllParts();
		model.addAttribute("m_parts", lists);

		/** 興增空的MaintainPartsBean 給前端modelAttribute="New_Mp_Form" */
		model.addAttribute("New_Mp_Form", new MaintainPartsBean());
		return "/admin/b_mp_list";
	}

	// --------------後台------------------
	/** 顯示指定預約單id保養明細 */
	@RequestMapping(value = "/admin/b_mp_list", method = RequestMethod.POST)
	public String getM_Detail_EditByMb_id(@ModelAttribute("New_Mp_Form") MaintainPartsBean mpb) {

		System.out.println("===============進入update控制器====================");
		mpb.setMp_modifieddate(new Date());
		pService.updatePartsStock(mpb);
		System.out.println(mpb.getMp_status());

		return "redirect:b_mp_list";
	}

	@RequestMapping("/admin/b_mp_add")
	public String getNewPartForm(Model model) {

		MaintainPartsBean mpBean = new MaintainPartsBean();
		model.addAttribute("New_Mp_Form", mpBean);

		return "admin/b_mp_add";
	}

	// --------------後台------------------
	/** 新增選取預約單id保養明細 */
	@RequestMapping(value = "/admin/b_mp_add", method = RequestMethod.POST)
	public String processAddMo_detail(@ModelAttribute("New_Mp_Form") MaintainPartsBean mpb) {

		pService.addParts(mpb);

		return "redirect:b_mp_list";
	}

	/** 轉換時間格式 */
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		CustomDateEditor dateEditor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}

}
