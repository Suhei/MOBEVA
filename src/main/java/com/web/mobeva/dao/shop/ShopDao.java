package com.web.mobeva.dao.shop;

import java.util.List;

import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.shop.ShopCartBean;
import com.web.mobeva.model.shop.ShopDetailsBean;
import com.web.mobeva.model.shop.ShopOrderBean;
import com.web.mobeva.model.shop.ShopProductsBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;

public interface ShopDao {

//------------------------------仕杰開始------------------------
	
	//------------------------------前台用開始------------------------

	List<ShopProductsBean> getAllProducts();

	ShopProductsBean getProductById(int id);

	List<ShopProductsBean> getProductsByCategory(int cid, int pageNo);

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

//測試用

	List<UserCarBean> getCarById(int id);

	List<UserInfoBean> getAllMember();

	List<MaintainBookingBean> getAllBooking();

	List<MaintainBookingBean> getBookingById(int id);

	public UserInfoBean getUserById(int u_id);

	void MaintainBookingsave(MaintainBookingBean mbb);

	void updateUserInfo(UserInfoBean ui);

	List<MaintainStationBean> getStationList();

	List<Integer> getStage(String mb_date);
	
	//------------------------------前台結束------------------------
	//------------------------------後台開始------------------------
	
	List<ShopProductsBean> getProductsByCategory_B(int cid);
	
	void updateProduct_B(ShopProductsBean pb);
	
	void insertProduct_B(ShopProductsBean pb);
	
	int delProduct(int sp_id);
	
	//------------------------------後台結束------------------------

//------------------------------仕杰結束------------------------

//------------------------------小黑開始------------------------
	// 由u_id撈出購物車總商品;
	List<ShopCartBean> getShopcart(int u_id);

	// 更新購物車數量;
	void updateShopcart(int sp_id, int sc_pcs);

	// 由so_id刪除購物車內商品
	void delectcartpd(int sp_id);

	// 由u_id撈總訂單量;
	List<ShopOrderBean> getshoporder(int u_id);

	// 由so_id撈出訂單明細;
	List<ShopDetailsBean> getshopdetail(int so_id);

	// 新增Shoporder
	void insertShopOrder(ShopOrderBean shopOrder);

	// 新增成ShopProductsBean
	ShopProductsBean getShopProductBeanbyId(int sp_id);

	// 新增成ShopOrderBean
	ShopOrderBean getShopOrderBeanbyId(int so_id);

	// 新增Shopdetails
	void insertShopdetails(ShopDetailsBean shopDetailsBean);

	// 結帳後刪除購物車內所有商品
	void checkoutdeletecart(int u_id);

	// 結帳後減少庫存量
	void updatProductStockById(int sp_id, int sp_stock);
	
	//後台得到全部訂單
	List<ShopOrderBean> getShopOrders();

	//前後台刪除訂單so_status==0
	void updateOrderStatusById(int so_id,int so_status);

	
//------------------------------小黑結束------------------------


}
