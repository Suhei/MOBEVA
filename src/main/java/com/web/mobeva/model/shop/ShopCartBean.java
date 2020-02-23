package com.web.mobeva.model.shop;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.web.mobeva.model.user.UserInfoBean;


@Entity
@Table(name="Shopcart")
@DynamicInsert(true) 
@DynamicUpdate(true) 
public class ShopCartBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer sc_id;
	
	private Integer sc_pcs;
	private Date sc_createdate;
	private Date sc_modifieddate;	
	

	@ManyToOne
	@JoinColumn(name="u_id")
	private UserInfoBean userInfoBean; 

	public UserInfoBean getUserInfoBean() {
		return userInfoBean;
	}

	public void setUserInfoBean(UserInfoBean userInfoBean) {
		this.userInfoBean = userInfoBean;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="sp_id")
	private ShopProductsBean shopProductsBean; 

	public ShopProductsBean getShopProductsBean() {
		return shopProductsBean;
	}

	public void setShopProductsBean(ShopProductsBean shopProductsBean) {
		this.shopProductsBean = shopProductsBean;
	}

	public ShopCartBean() {
	}


	public ShopCartBean(Integer sc_id, Integer sc_pcs, Date sc_createdate, Date sc_modifieddate,
			UserInfoBean userInfoBean, ShopProductsBean shopProductsBean) {
		super();
		this.sc_id = sc_id;
		this.sc_pcs = sc_pcs;
		this.sc_createdate = sc_createdate;
		this.sc_modifieddate = sc_modifieddate;
		this.userInfoBean = userInfoBean;
		this.shopProductsBean = shopProductsBean;
	}

	public Integer getSc_id() {
		return sc_id;
	}

	public void setSc_id(Integer sc_id) {
		this.sc_id = sc_id;
	}

	public Integer getSc_pcs() {
		return sc_pcs;
	}

	public void setSc_pcs(Integer sc_pcs) {
		this.sc_pcs = sc_pcs;
	}

	public Date getSc_createdate() {
		return sc_createdate;
	}

	public void setSc_createdate(Date sc_createdate) {
		this.sc_createdate = sc_createdate;
	}

	public Date getSc_modifieddate() {
		return sc_modifieddate;
	}

	public void setSc_modifieddate(Date sc_modifieddate) {
		this.sc_modifieddate = sc_modifieddate;
	}
	
}
