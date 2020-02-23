package com.web.mobeva.service.shop;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.shop.ShopCartBean;
import com.web.mobeva.model.shop.ShopDetailsBean;
import com.web.mobeva.model.shop.ShopOrderBean;
import com.web.mobeva.model.shop.ShopProductsBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;

public interface ShopService {

//------------------------------仕杰開始------------------------
	// ------------------------------------前台開始----------------------------------
	List<ShopProductsBean> getAllProducts();

	List<ShopProductsBean> getProductsByCategory(int cid, int pageNo);

	ShopProductsBean getProductById(int id);

	List<ShopProductsBean> getRecommendProducts();

	List<ShopProductsBean> getRelatedProducts(int pid, int cid);

	List<ShopProductsBean> getProductsByPage(int pageNo);

	public int getTotalPages(int cid);

	public long getRecordCounts(int cid);

	public int addShopCart(ShopCartBean shopCartBean);

	public int updateShopCart(ShopCartBean shopCartBean);

	public ShopCartBean existByUidSpid(int u_id, int sp_id);

	public List<ShopProductsBean> getSearchProducts(String shopSearch, int pageNo);

	int getTotalPagesBySearch(String shopSearch);

	int getStocksBySpid(int sp_id);

	// 測試用的
	List<UserCarBean> getCarById(int id);

	List<UserInfoBean> getAllMember();

	List<MaintainBookingBean> getAllBooking();

	List<MaintainBookingBean> getBookingById(int id);

	UserInfoBean getUserById(int u_id);

	void MaintainBookingsave(MaintainBookingBean mbb);

	void updateUserInfo(UserInfoBean ui);

	List<MaintainStationBean> getStationList();

	List<Integer> getStage(String mb_date);

	// ------------------------------------前台結束----------------------------------

	// ------------------------------------後台開始----------------------------------

	List<ShopProductsBean> getProductsByCategory_B(int cid);

	void updateProduct_B(ShopProductsBean pb);
	
	//儲存前端上傳檔案(檔案,檔名,儲存路徑)
	void saveUploadFile_B(MultipartFile mpf,String saveName,String savePath);

	void insertProduct_B(ShopProductsBean pb);
	
	int delProduct(int sp_id);
	// ------------------------------------後台結束----------------------------------

//------------------------------仕杰結束------------------------	

//------------------------------小黑開始------------------------

	// ------------------------------------前台開始----------------------------------

	List<ShopCartBean> getShopcart(int u_id);

	void updateAllShopcart(int sp_id, int sc_pcs);

	List<ShopOrderBean> getshoporder(int u_id);

	List<ShopDetailsBean> getshopdetail(int so_id);

	void delectcartpd(int sp_id);

	ShopProductsBean getShopProductBeanbyId(int sp_id);

	ShopOrderBean getShopOrderBeanbyId(int so_id);

	void insertShopOrder(ShopOrderBean shopOrder);

	void insertShopdetails(ShopDetailsBean shopDetailsBean);

	void checkoutdeletecart(int u_id);

	void updatProductStockById(int sp_id, int sp_stock);

	// 後台得到全部訂單
	List<ShopOrderBean> getShopOrders();

	// 前後台刪除訂單so_status==0
	void updateOrderStatusById(int so_id, int so_status);

	// ------------------------------------前台結束----------------------------------

//------------------------------小黑結束------------------------	

}
