package com.web.store.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.store.exception.ProductNotFoundException;
import com.web.store.model.BookBean;
import com.web.store.model.CompanyBean;
import com.web.store.service.ProductService;

@Controller
public class ProductController {

	ProductService service;
	ServletContext context;

	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}

//	@RequestMapping("/product")
//	public String list(Model model) {
//		CompanyBean cb = new CompanyBean(1, "學貫行銷股份有限公司", "台北市林森北路四號6樓", "http://www.xbook.com.tw/");
//
//		BookBean bb = new BookBean(1002, "PHP&MySQL程式設計實例講座", "陳惠貞", 580.0, 0.6, "bookxb002.jpg", "P832", null, 25,
//				"Web", cb);
//		model.addAttribute("product", bb);
//		return "products";
//	}

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@RequestMapping("/products")
	public String allList(Model model) {
		List<BookBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "products";
	}

	@RequestMapping("/update/stock")
	public String updateStock(Model model) {
		service.updateAllStocks();
		return "redirect:/products";
	}

	@RequestMapping("/queryByCategory")
	public String getCategoryList(Model model) {
		List<String> list = service.getAllCategories();
		model.addAttribute("categoryList", list);
		return "types/category";
	}

	@RequestMapping("/products/{category}")
	public String getProductByCategory(@PathVariable("category") String category, Model model) {
		List<BookBean> products = service.getProductsByCategory(category);
		model.addAttribute("products", products);
		return "products";
	}

	@RequestMapping("/product")
	public String getProductById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", service.getProductById(id));
		return "product";
	}

	// 轉發：將與下一棒的程式共用同一個請求物件
	@RequestMapping("/forwardDemo")
	public String forward(Model model, HttpServletRequest req) {
		String uri = req.getRequestURI();
		model.addAttribute("modelData0", "這是以/forwardDemo送來的請求");
		model.addAttribute("uri0", uri);
		return "forward:/anotherFWD";
	}

	// 被轉發的方法，將與前一個方法共用同一個請求物件
	@RequestMapping("/anotherFWD")
	public String forwardA(Model model, HttpServletRequest req) {
		String uri = req.getRequestURI();
		model.addAttribute("modelData1", "這是以/anotherFWD送來的請求");
		model.addAttribute("uri1", uri);
		return "forwardedPage";
	}

	// redirect：另外一個請求
	@RequestMapping("/redirectDemo")
	public String redirect(Model model, RedirectAttributes redirectAttributes, HttpServletRequest req) {
		String uri = req.getRequestURI();
		model.addAttribute("modelData2", "這是以/redirectDemo送來的請求，即將通知瀏覽器對新網址發出請求，但瀏覽器不會顯示這樣的訊息。");
		model.addAttribute("uri2", uri);
		redirectAttributes.addFlashAttribute("modelData3", "這是加在RedirectAttributes物件內的屬性物件，瀏覽器會顯示。");
		redirectAttributes.addFlashAttribute("uri3", uri);
		return "redirect:/redirectAnother";
	}

	// 瀏覽器對新網址重新發出的請求將會由這個請求器方法來處理
	@RequestMapping("/redirectAnother")
	public String redirectA(Model model, HttpServletRequest req) {
		return "redirectedPage";
	}

	@GetMapping("/getPicture/{bookId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable("bookId") Integer bookId) {
		String filePath = "/resources/images/NoImage.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		BookBean bean = service.getProductById(bookId);
		if (bean != null) {
			Blob blob = bean.getCoverImage();
			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);// blob.getBytes是1開頭。JDBC相關的類別都是1開頭
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException：" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	//例外處理
	@ExceptionHandler({ ProductNotFoundException.class })
	public ModelAndView handleError(HttpServletRequest req, ProductNotFoundException exception) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("invalidBookId",exception.getBookId());
		mv.addObject("exception", exception);
		mv.addObject("url", req.getRequestURI() + "?" + req.getQueryString());
		mv.setViewName("productNotFound");
		return mv;
	}
}
