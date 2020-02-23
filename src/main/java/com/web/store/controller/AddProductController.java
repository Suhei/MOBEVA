package com.web.store.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.web.store.model.BookBean;
import com.web.store.model.CompanyBean;
import com.web.store.service.ProductService;

@Controller
public class AddProductController {

	ProductService service;
	ServletContext context;

	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@GetMapping("/products/add")
	public String getAddNewProductForm(Model model) {
		BookBean bb = new BookBean();
		model.addAttribute("bookBean", bb);
		return "addProduct";
	}

	@PostMapping("/products/add")
	public String processAddNewProductForm(@ModelAttribute("bookBean") BookBean bb, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試輸入不允許的欄位：" + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		// 預設庫存量
		if (bb.getStock() == null) {
			bb.setStock(0);
		}

		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setFileName(originalFilename);
		// 建立Blob物件，交由Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setCoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}

		service.addProduct(bb);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
	
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists()) {
				imageFolder.mkdirs();
			}
			File file = new File(imageFolder, bb.getBookId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		} 
		
		return "redirect:/products";
	}

	@ModelAttribute("companyList")
	public Map<Integer, String> getCompanyList() {
		Map<Integer, String> companyMap = new HashMap<>();
		List<CompanyBean> list = service.getCompanyList();
		for (CompanyBean cb : list) {
			companyMap.put(cb.getId(), cb.getName());
		}
		return companyMap;
	}

	@ModelAttribute("categoryList")
	public List<String> getCategoryList() {
		return service.getAllCategories();
	}

	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("author", "bookNo", "category", "price", "title", "companyId","productImage");
	}
}
