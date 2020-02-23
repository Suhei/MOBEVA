package com.web.mobeva.dao.shop.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.mobeva.dao.shop.ShopDao;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.shop.ShopCartBean;
import com.web.mobeva.model.shop.ShopDetailsBean;
import com.web.mobeva.model.shop.ShopOrderBean;
import com.web.mobeva.model.shop.ShopProductsBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.store.exception.ProductNotFoundException;

@Repository
public class ShopDaoImpl implements ShopDao {
	private int PAGESIZE = 9;
	private int totalPage = -1;
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

//------------------------------仕杰開始------------------------
	// ------------------------------前台開始------------------------

	// 查詢所有商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopProductsBean> getAllProducts() {
		String hql = "FROM ShopProductsBean";
		Session session = factory.getCurrentSession();
		List<ShopProductsBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).getResultList();
		return lists;
	}

	// 透過sp_id查詢單一商品
	@Override
	public ShopProductsBean getProductById(int id) {
		Session session = factory.getCurrentSession();
		ShopProductsBean pb = session.get(ShopProductsBean.class, id);
		if (pb == null) {
			throw new ProductNotFoundException("產品編號：" + id + "找不到");
		}
		return pb;
	}

	// 透過類別查詢商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopProductsBean> getProductsByCategory(int cid, int pageNo) {
		String hql = "FROM ShopProductsBean WHERE sp_category = :cid";
		Session session = factory.getCurrentSession();
		List<ShopProductsBean> lists = new ArrayList<>();
		int startPage = (pageNo - 1) * PAGESIZE;
		lists = session.createQuery(hql).setParameter("cid", cid).setFirstResult(startPage).setMaxResults(PAGESIZE)
				.getResultList();
		return lists;
	}

	// 取得推薦商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopProductsBean> getRecommendProducts() {
		String hql = "FROM ShopProductsBean WHERE sp_recommend = 1";
		Session session = factory.getCurrentSession();
		List<ShopProductsBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).getResultList();
		return lists;
	}

	// 查詢相關商品(按照同類別但不含自己)
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopProductsBean> getRelatedProducts(int pid, int cid) {
		String hql = "FROM ShopProductsBean WHERE sp_category = :cid AND sp_id <> :pid";
		Session session = factory.getCurrentSession();
		List<ShopProductsBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).setParameter("cid", cid).setParameter("pid", pid).setMaxResults(3)
				.getResultList();
		return lists;
	}

	// 按照頁數查詢商品
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopProductsBean> getProductsByPage(int pageNo) {
		String hql = "FROM ShopProductsBean";
		Session session = factory.getCurrentSession();
		List<ShopProductsBean> lists = new ArrayList<>();
		int startPage = (pageNo - 1) * PAGESIZE;
		lists = session.createQuery(hql).setFirstResult(startPage).setMaxResults(PAGESIZE).getResultList();
		return lists;
	}

	// 計算販售的商品總共有幾頁
	@Override
	public int getTotalPages(int cid) {
		totalPage = (int) (Math.ceil(getRecordCounts(cid) / (double) PAGESIZE));
		return totalPage;
	}

	// 查詢的商品共有幾個
	@SuppressWarnings("unchecked")
	@Override
	public long getRecordCounts(int cid) {
		long count = 0; // 必須使用 long 型態
		String hql;
		Session session = factory.getCurrentSession();
		if (cid == 0) {
			hql = "SELECT count(*) FROM ShopProductsBean WHERE sp_category > :cid";
		} else {
			hql = "SELECT count(*) FROM ShopProductsBean WHERE sp_category = :cid";
		}
		List<Long> list = session.createQuery(hql).setParameter("cid", cid).getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		return count;
	}

	// 模糊查詢的總頁數
	@SuppressWarnings("unchecked")
	@Override
	public int getTotalPagesBySearch(String shopSearch) {
		long count = 0; // 必須使用 long 型態
		Session session = factory.getCurrentSession();
		String hql = "SELECT count(*) FROM ShopProductsBean WHERE sp_name like'%" + shopSearch + "%'";
		List<Long> list = session.createQuery(hql).getResultList();
		if (list.size() > 0) {
			count = list.get(0);
		}
		totalPage = (int) (Math.ceil(count / (double) PAGESIZE));
		return totalPage;
	}

	// 增加商品去購物車
	@Override
	public int addShopCart(ShopCartBean shopCartBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(shopCartBean);
		return n;
	}

	// 更新購物車
	@Override
	public int updateShopCart(ShopCartBean shopCartBean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.update(shopCartBean);
		return n;
	}

	// 判斷購物車裡面有沒有這個人買的這個東西
	@Override
	public ShopCartBean existByUidSpid(int u_id, int sp_id) {
		String hql = "FROM ShopCartBean WHERE u_id = :uid AND sp_id = :spid";
		Session session = factory.getCurrentSession();
		ShopCartBean sc;
		try {
			sc = (ShopCartBean) session.createQuery(hql).setParameter("uid", u_id).setParameter("spid", sp_id)
					.getSingleResult();
		} catch (NoResultException ex) {
			sc = null;
			ex.getStackTrace();
		}
		return sc;
	}

	// 模糊查詢
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopProductsBean> getSearchProducts(String shopSearch, int pageNo) {
		String hql = "FROM ShopProductsBean WHERE sp_name like'%" + shopSearch + "%'";
		Session session = factory.getCurrentSession();
		List<ShopProductsBean> lists = new ArrayList<>();
		int startPage = (pageNo - 1) * PAGESIZE;
		lists = session.createQuery(hql).setFirstResult(startPage).setMaxResults(PAGESIZE).getResultList();
		return lists;
	}

	// 查詢庫存
	@Override
	public int getStocksBySpid(int sp_id) {
		String hql = "SELECT sp_stock FROM ShopProductsBean WHERE sp_id = :sp_id";
		Session session = factory.getCurrentSession();
		int n = (int) session.createQuery(hql).setParameter("sp_id", sp_id).getSingleResult();
		System.out.println("stock----------->" + n);
		return n;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserCarBean> getCarById(int id) {
		String hql = "FROM UserCarBean WHERE u_id = :uid";
		Session session = factory.getCurrentSession();
		List<UserCarBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).setParameter("uid", id).getResultList();
		return lists;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserInfoBean> getAllMember() {
		String hql = "FROM UserInfoBean";
		Session session = factory.getCurrentSession();
		List<UserInfoBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).getResultList();
		return lists;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainBookingBean> getAllBooking() {
		String hql = "FROM MaintainBookingBean";
		Session session = factory.getCurrentSession();
		List<MaintainBookingBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).getResultList();
		return lists;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainBookingBean> getBookingById(int id) {
		String hql = "FROM MaintainBookingBean WHERE u_id = :uid";
		Session session = factory.getCurrentSession();
		List<MaintainBookingBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).setParameter("uid", id).getResultList();
		return lists;
	}

	@Override
	public UserInfoBean getUserById(int u_id) {
		Session session = factory.getCurrentSession();
		UserInfoBean uc = session.get(UserInfoBean.class, u_id);
		return uc;
	}

	@Override
	public void MaintainBookingsave(MaintainBookingBean mbb) {
		Session session = factory.getCurrentSession();
		session.save(mbb);
	}

	@Override
	public void updateUserInfo(UserInfoBean ui) {
		Session session = factory.getCurrentSession();
		session.update(ui);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MaintainStationBean> getStationList() {
		String hql = "FROM MaintainStationBean";
		Session session = factory.getCurrentSession();
		List<MaintainStationBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).getResultList();
		return lists;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getStage(String mb_date) {
		String hql = "SELECT mb_stage FROM MaintainBookingBean WHERE mb_date = :mb_date";
		Session session = factory.getCurrentSession();
		List<Integer> lists = session.createQuery(hql).setParameter("mb_date", mb_date).getResultList();
		return lists;
	}

	// ------------------------------前台結束------------------------
	// ------------------------------後台開始------------------------
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopProductsBean> getProductsByCategory_B(int cid) {
		String hql = "FROM ShopProductsBean WHERE sp_category = :cid ORDER BY sp_id";
		Session session = factory.getCurrentSession();
		List<ShopProductsBean> lists = new ArrayList<>();
		lists = session.createQuery(hql).setParameter("cid", cid).getResultList();
		return lists;
	}
	
	@Override
	public void updateProduct_B(ShopProductsBean pb) {
		Session session = factory.getCurrentSession();
		session.update(pb);
	}
	
	@Override
	public void insertProduct_B(ShopProductsBean pb) {
		Session session = factory.getCurrentSession();
		session.save(pb);
	}
	
	@Override
	public int delProduct(int sp_id) {
		System.out.println("--------------DAOIMPL-----------");
		int n = 0 ;
		String hql = "UPDATE ShopProductsBean SET sp_status = 0 ,sp_modifieddate =:modifyDate WHERE sp_id = :sp_id";
		Session session = factory.getCurrentSession();
		n = session.createQuery(hql).setParameter("sp_id", sp_id).setParameter("modifyDate", new Date()).executeUpdate();
		return n;
	}


	
	
	// ------------------------------後台結束------------------------
//------------------------------仕杰結束------------------------	

//------------------------------小黑開始------------------------
	// 由u_id撈出購物車總商品;
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopCartBean> getShopcart(int u_id) {
		String hql = "FROM ShopCartBean WHERE u_id = :uid";
		List<ShopCartBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("uid", u_id).getResultList();
		return list;
	}

	// 更新購物車數量;
	@Override
	public void updateShopcart(int sp_id, int sc_pcs) {
		String hql = "UPDATE ShopCartBean SET sc_pcs = :pcs WHERE sp_id = :pid";
		Session session = factory.getCurrentSession();
		int n = session.createQuery(hql).setParameter("pid", sp_id).setParameter("pcs", sc_pcs).executeUpdate();
	}

	// 由u_id撈總訂單量;
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopOrderBean> getshoporder(int u_id) {
		String hql = "FROM ShopOrderBean WHERE u_id = :uid";
		List<ShopOrderBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("uid", u_id).getResultList();
		return list;
	}

	// 由so_id撈出訂單明細
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopDetailsBean> getshopdetail(int so_id) {
		String hql = "FROM ShopDetailsBean WHERE so_id = :so_id";
		List<ShopDetailsBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("so_id", so_id).getResultList();
		return list;
	}

	// 刪除購物車商品
	@Override
	public void delectcartpd(int sp_id) {
		String hql = "DELETE ShopCartBean WHERE sp_id = :sp_id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("sp_id", sp_id).executeUpdate();
	}

	// 新增訂單
	@Override
	public void insertShopOrder(ShopOrderBean shopOrder) {
		Session session = factory.getCurrentSession();
		session.save(shopOrder);
	}

	// 獲取一個ShopOrderBean
	@Override
	public ShopProductsBean getShopProductBeanbyId(int sp_id) {
		Session session = factory.getCurrentSession();
		ShopProductsBean sob = session.get(ShopProductsBean.class, sp_id);
		return sob;
	}

	// 新增訂單明細
	@Override
	public void insertShopdetails(ShopDetailsBean shopDetailsBean) {
		Session session = factory.getCurrentSession();
		session.save(shopDetailsBean);
	}

	// 得到訂單
	@Override
	public ShopOrderBean getShopOrderBeanbyId(int so_id) {
		Session session = factory.getCurrentSession();
		ShopOrderBean spb = session.get(ShopOrderBean.class, so_id);
		return spb;
	}

	// 結帳刪除購物車
	@Override
	public void checkoutdeletecart(int u_id) {
		String hql = "DELETE ShopCartBean WHERE u_id = :u_id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("u_id", u_id).executeUpdate();
	}

	// 更新庫存量
	@Override
	public void updatProductStockById(int sp_id, int sp_stock) {
		String hql = "UPDATE ShopProductsBean SET sp_stock = :stock WHERE sp_id = :pid";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("stock", sp_stock).setParameter("pid", sp_id).executeUpdate();
	}
	
	//後台得到全部訂單
		@SuppressWarnings("unchecked")
		@Override
		public List<ShopOrderBean> getShopOrders() {
			String hql = "FROM ShopOrderBean";
			Session session = factory.getCurrentSession();
			List<ShopOrderBean> list = new ArrayList<>();
			list = session.createQuery(hql).getResultList();
			return list;
		}
		//前後台刪除訂單
		@Override		
		public void updateOrderStatusById(int so_id,int so_status) {
			String hql = "UPDATE ShopOrderBean SET so_status = :so_status WHERE so_id = :so_id";
			Session session = factory.getCurrentSession();
			session.createQuery(hql).setParameter("so_id", so_id).setParameter("so_status", so_status).executeUpdate();
		}


//------------------------------小黑結束------------------------	

}
