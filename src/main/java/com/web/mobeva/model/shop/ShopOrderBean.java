package com.web.mobeva.model.shop;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.web.mobeva.model.user.UserInfoBean;


@Entity
@Table(name = "Shoporder")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ShopOrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer so_id;
	private Timestamp so_date;
	private Integer so_status;
	private Integer so_payment;
	private Integer so_totalprice;
	
	public Integer getSo_totalprice() {
		return so_totalprice;
	}

	public void setSo_totalprice(Integer so_totalprice) {
		this.so_totalprice = so_totalprice;
	}

	@ManyToOne
	@JoinColumn(name="u_id")
	private UserInfoBean userInfoBean; 

	public UserInfoBean getUserInfoBean() {
		return userInfoBean;
	}

	public void setUserInfoBean(UserInfoBean userInfoBean) {
		this.userInfoBean = userInfoBean;
	}

	@OneToMany(mappedBy="shopOrderBean")
	private Set<ShopDetailsBean> so_shopdetails = new LinkedHashSet<>();
	

	public Set<ShopDetailsBean> getSo_shopdetails() {
		return so_shopdetails;
	}

	public void setSo_shopdetails(Set<ShopDetailsBean> so_shopdetails) {
		this.so_shopdetails = so_shopdetails;
	}

	public ShopOrderBean() {
	}

	public ShopOrderBean(Integer so_id, Timestamp so_date, Integer so_status, Integer so_payment, Integer so_totalprice,
			UserInfoBean userInfoBean, Set<ShopDetailsBean> so_shopdetails) {
		super();
		this.so_id = so_id;
		this.so_date = so_date;
		this.so_status = so_status;
		this.so_payment = so_payment;
		this.so_totalprice = so_totalprice;
		this.userInfoBean = userInfoBean;
		this.so_shopdetails = so_shopdetails;
	}

	public Integer getSo_id() {
		return so_id;
	}

	public void setSo_id(Integer so_id) {
		this.so_id = so_id;
	}

	public Timestamp getSo_date() {
		return so_date;
	}

	public void setSo_date(Timestamp so_date) {
		this.so_date = so_date;
	}

	public Integer getSo_status() {
		return so_status;
	}

	public void setSo_status(Integer so_status) {
		this.so_status = so_status;
	}

	public Integer getSo_payment() {
		return so_payment;
	}

	public void setSo_payment(Integer so_payment) {
		this.so_payment = so_payment;
	}
	
	
}
