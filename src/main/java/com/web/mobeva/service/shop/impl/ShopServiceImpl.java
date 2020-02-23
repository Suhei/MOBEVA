package com.web.mobeva.service.shop.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.web.mobeva.dao.shop.ShopDao;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.shop.ShopCartBean;
import com.web.mobeva.model.shop.ShopDetailsBean;
import com.web.mobeva.model.shop.ShopOrderBean;
import com.web.mobeva.model.shop.ShopProductsBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.shop.ShopService;

@Service
public class ShopServiceImpl implements ShopService {

	ShopDao dao;

	@Autowired
	public void setDao(ShopDao dao) {
		this.dao = dao;
	}

//------------------------------仕杰開始------------------------	
	// ------------------------------------前台開始----------------------------------

	// 取得所有商品
	@Transactional
	@Override
	public List<ShopProductsBean> getAllProducts() {
		return dao.getAllProducts();
	}

	// 透過sp_id取得商品
	@Transactional
	@Override
	public ShopProductsBean getProductById(int id) {
		return dao.getProductById(id);
	}

	// 透過類別取得商品
	@Transactional
	@Override
	public List<ShopProductsBean> getProductsByCategory(int cid, int pageNo) {
		return dao.getProductsByCategory(cid, pageNo);
	}

	// 取得推薦商品
	@Transactional
	@Override
	public List<ShopProductsBean> getRecommendProducts() {
		return dao.getRecommendProducts();
	}

	// 取得相關商品
	@Transactional
	@Override
	public List<ShopProductsBean> getRelatedProducts(int pid, int cid) {
		return dao.getRelatedProducts(pid, cid);
	}

	@Transactional
	@Override
	public List<ShopProductsBean> getProductsByPage(int pageNo) {
		return dao.getProductsByPage(pageNo);
	}

	@Transactional
	@Override
	public int getTotalPages(int cid) {
		return dao.getTotalPages(cid);
	}

	@Override
	public long getRecordCounts(int cid) {
		return dao.getRecordCounts(cid);
	}

	@Transactional
	@Override
	public int addShopCart(ShopCartBean shopCartBean) {
		return dao.addShopCart(shopCartBean);
	}

	@Transactional
	@Override
	public int updateShopCart(ShopCartBean shopCartBean) {
		return dao.updateShopCart(shopCartBean);
	}

	@Transactional
	@Override
	public ShopCartBean existByUidSpid(int u_id, int sp_id) {
		return dao.existByUidSpid(u_id, sp_id);
	}

	@Transactional
	@Override
	public List<ShopProductsBean> getSearchProducts(String shopSearch, int pageNo) {
		return dao.getSearchProducts(shopSearch, pageNo);
	}

	@Transactional
	@Override
	public int getTotalPagesBySearch(String shopSearch) {
		return dao.getTotalPagesBySearch(shopSearch);
	}

	@Transactional
	@Override
	public int getStocksBySpid(int sp_id) {
		return dao.getStocksBySpid(sp_id);
	}

//測試用

	@Transactional
	@Override
	public List<UserCarBean> getCarById(int id) {
		return dao.getCarById(id);
	}

	@Transactional
	@Override
	public List<UserInfoBean> getAllMember() {
		return dao.getAllMember();
	}

	@Transactional
	@Override
	public List<MaintainBookingBean> getAllBooking() {
		return dao.getAllBooking();
	}

	@Transactional
	@Override
	public List<MaintainBookingBean> getBookingById(int id) {
		return dao.getBookingById(id);
	}

	@Transactional
	@Override
	public UserInfoBean getUserById(int u_id) {
		return dao.getUserById(u_id);
	}

	@Transactional
	@Override
	public void MaintainBookingsave(MaintainBookingBean mbb) {
		dao.MaintainBookingsave(mbb);
	}

	@Transactional
	@Override
	public void updateUserInfo(UserInfoBean ui) {
		dao.updateUserInfo(ui);
	}

	@Transactional
	@Override
	public List<MaintainStationBean> getStationList() {
		return dao.getStationList();
	}

	@Transactional
	@Override
	public List<Integer> getStage(String mb_date) {
		return dao.getStage(mb_date);
	}

	// ------------------------------------前台結束----------------------------------

	// ------------------------------------後台開始----------------------------------
	@Transactional
	@Override
	public List<ShopProductsBean> getProductsByCategory_B(int cid) {
		return dao.getProductsByCategory_B(cid);
	}

	@Transactional
	@Override
	public void updateProduct_B(ShopProductsBean pb) {
		dao.updateProduct_B(pb);
	}
	
	@Override
	public void saveUploadFile_B(MultipartFile mpf, String saveName, String savePath) {

		System.out.println("SavePath---------->" + savePath);

		// 在該路徑產生一個File檔案，並給她原始檔名
		File temp = new File(savePath, saveName);
		// 如果該資料夾不存在，就建立資料夾
//		if (!temp.exists()) {
//			System.out.println("--------------進到temp IF--------------");
//			temp.mkdirs();
//		}
		try {
			System.out.println("--------------進到TRY--------------");
			mpf.transferTo(temp);
		} catch (IllegalStateException | IOException e) {
			System.out.println("--------------進到CATCH--------------");
			e.printStackTrace();
		}
	}

	@Transactional
	@Override
	public void insertProduct_B(ShopProductsBean pb) {
		dao.insertProduct_B(pb);
	}
	
	@Transactional
	@Override
	public int delProduct(int sp_id) {
		return dao.delProduct(sp_id);
		
	}


	// ------------------------------------後台結束----------------------------------

//------------------------------仕杰結束------------------------	

//------------------------------小黑開始------------------------

	// ------------------------------------前台開始----------------------------------

	@Transactional
	@Override
	public List<ShopCartBean> getShopcart(int u_id) {
		return dao.getShopcart(u_id);
	}

	@Transactional
	@Override
	public void updateAllShopcart(int sp_id, int sc_pcs) {
		dao.updateShopcart(sp_id, sc_pcs);
	}

	@Transactional
	@Override
	public List<ShopOrderBean> getshoporder(int u_id) {
		return dao.getshoporder(u_id);
	}

	@Transactional
	@Override
	public List<ShopDetailsBean> getshopdetail(int so_id) {
		return dao.getshopdetail(so_id);
	}

	@Transactional
	@Override
	public void delectcartpd(int sp_id) {
		dao.delectcartpd(sp_id);
	}

	@Transactional
	@Override
	public void insertShopOrder(ShopOrderBean shopOrder) {
		dao.insertShopOrder(shopOrder);
	}

	@Transactional
	@Override
	public ShopProductsBean getShopProductBeanbyId(int sp_id) {
		return dao.getShopProductBeanbyId(sp_id);
	}

	@Transactional
	@Override
	public void insertShopdetails(ShopDetailsBean shopDetailsBean) {
		dao.insertShopdetails(shopDetailsBean);
	}

	@Transactional
	@Override
	public ShopOrderBean getShopOrderBeanbyId(int so_id) {
		return dao.getShopOrderBeanbyId(so_id);
	}

	@Transactional
	@Override
	public void checkoutdeletecart(int u_id) {
		dao.checkoutdeletecart(u_id);
	}

	@Transactional
	@Override
	public void updatProductStockById(int sp_id, int sp_stock) {
		dao.updatProductStockById(sp_id, sp_stock);
	}

	// 後台得到全部訂單
	@Transactional
	@Override
	public List<ShopOrderBean> getShopOrders() {
		return dao.getShopOrders();
	}

	// 前後台刪除訂單
	@Transactional
	@Override
	public void updateOrderStatusById(int so_id, int so_status) {
		dao.updateOrderStatusById(so_id, so_status);
	}


	// ------------------------------------前台結束----------------------------------
//------------------------------小黑結束------------------------	

}
