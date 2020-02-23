package com.web.mobeva.model.shop;

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

@Entity
@Table(name="Shopdetails")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ShopDetailsBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer sd_id;
	private Integer sd_price;
	private Integer sd_pcs;
	

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="so_id")
	private ShopOrderBean shopOrderBean;

	public ShopOrderBean getShopOrderBean() {
		return shopOrderBean;
	}

	public void setShopOrderBean(ShopOrderBean shopOrderBean) {
		this.shopOrderBean = shopOrderBean;
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

	public ShopDetailsBean() {
	}


	public ShopDetailsBean(Integer sd_id, Integer sd_price, Integer sd_pcs, ShopOrderBean shopOrderBean,
			ShopProductsBean shopProductsBean) {
		super();
		this.sd_id = sd_id;
		this.sd_price = sd_price;
		this.sd_pcs = sd_pcs;
		this.shopOrderBean = shopOrderBean;
		this.shopProductsBean = shopProductsBean;
	}

	public Integer getSd_id() {
		return sd_id;
	}

	public void setSd_id(Integer sd_id) {
		this.sd_id = sd_id;
	}

	public Integer getSd_price() {
		return sd_price;
	}

	public void setSd_price(Integer sd_price) {
		this.sd_price = sd_price;
	}

	public Integer getSd_pcs() {
		return sd_pcs;
	}

	public void setSd_pcs(Integer sd_pcs) {
		this.sd_pcs = sd_pcs;
	}
	
	
	
	
}
