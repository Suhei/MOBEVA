package com.web.mobeva.model.user;


import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.shop.ShopCartBean;
import com.web.mobeva.model.shop.ShopOrderBean;


@Entity
@Table(name="Userinfo")
@DynamicInsert(true) 
@DynamicUpdate(true) 
@JsonIgnoreProperties(value = {"u_orders","u_shopcart","u_car","u_book","userLoginBean","userQuizBean"})
public class UserInfoBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer u_id;
	String u_account;
	String u_password;
	String u_openid;
	String u_name;
	String u_idcard;
	String u_email;
	String u_mobile;
	String u_address;
	Integer u_status;
	String u_block;
	String u_modifieddate;
	Date u_createdate;
	String u_lastlogin;
	
	@OneToMany(mappedBy = "userInfoBean")
	private Set<ShopOrderBean> u_orders = new LinkedHashSet<>(); 
	
	@OneToMany(mappedBy = "userInfoBean")
	private Set<ShopCartBean> u_shopcart = new LinkedHashSet<>(); 
	
	@OneToMany(mappedBy = "userInfoBean")
	private Set<UserCarBean> u_car = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "userInfoBean")
	private Set<MaintainBookingBean> u_book = new LinkedHashSet<>();
	
	
	public Set<MaintainBookingBean> getU_book() {
		return u_book;
	}

	public void setU_book(Set<MaintainBookingBean> u_book) {
		this.u_book = u_book;
	}

	@OneToMany(mappedBy="userInfoBean")
	private Set<UserLoginBean> userLoginBean;
	
	public Set<UserLoginBean> getUserLoginBean() {
		return userLoginBean;
	}

	public void setUserLoginBean(Set<UserLoginBean> userLoginBean) {
		this.userLoginBean = userLoginBean;
	}

	@OneToOne(mappedBy="userInfoBean")
	private UserQuizBean userQuizBean;
	

	public UserQuizBean getUserQuizBean() {
		return userQuizBean;
	}

	public void setUserQuizBean(UserQuizBean userQuizBean) {
		this.userQuizBean = userQuizBean;
	}

	public Set<UserCarBean> getU_car() {
		return u_car;
	}

	public void setU_car(Set<UserCarBean> u_car) {
		this.u_car = u_car;
	}

	public Set<ShopCartBean> getU_shopcart() {
		return u_shopcart;
	}

	public void setU_shopcart(Set<ShopCartBean> u_shopcart) {
		this.u_shopcart = u_shopcart;
	}

	public Set<ShopOrderBean> getU_orders() {
		return u_orders;
	}

	public void setU_orders(Set<ShopOrderBean> u_orders) {
		this.u_orders = u_orders;
	}

	public UserInfoBean() {
		super();
	}
	
	public UserInfoBean(Integer u_id, String u_account, String u_password, String u_openid, String u_name,
			String u_idcard, String u_email, String u_mobile, String u_address, Integer u_status, String u_block,
			String u_modifieddate, Date u_createdate, String u_lastlogin, Set<ShopOrderBean> u_orders,
			Set<ShopCartBean> u_shopcart, Set<UserCarBean> u_car, Set<MaintainBookingBean> u_book,
			Set<UserLoginBean> userLoginBean, UserQuizBean userQuizBean) {
		super();
		this.u_id = u_id;
		this.u_account = u_account;
		this.u_password = u_password;
		this.u_openid = u_openid;
		this.u_name = u_name;
		this.u_idcard = u_idcard;
		this.u_email = u_email;
		this.u_mobile = u_mobile;
		this.u_address = u_address;
		this.u_status = u_status;
		this.u_block = u_block;
		this.u_modifieddate = u_modifieddate;
		this.u_createdate = u_createdate;
		this.u_lastlogin = u_lastlogin;
		this.u_orders = u_orders;
		this.u_shopcart = u_shopcart;
		this.u_car = u_car;
		this.u_book = u_book;
		this.userLoginBean = userLoginBean;
		this.userQuizBean = userQuizBean;
	}
	
	public UserInfoBean(String u_account, String u_password, String u_openid, String u_name, String u_idcard,
			String u_email, String u_mobile, String u_address) {
		super();
		this.u_account = u_account;
		this.u_password = u_password;
		this.u_openid = u_openid;
		this.u_name = u_name;
		this.u_idcard = u_idcard;
		this.u_email = u_email;
		this.u_mobile = u_mobile;
		this.u_address = u_address;
	}
	
	public UserInfoBean(String u_account, String u_password, String u_openid, String u_name, String u_idcard,
			String u_email, String u_mobile, String u_address,Integer u_status) {
		super();
		this.u_account = u_account;
		this.u_password = u_password;
		this.u_openid = u_openid;
		this.u_name = u_name;
		this.u_idcard = u_idcard;
		this.u_email = u_email;
		this.u_mobile = u_mobile;
		this.u_address = u_address;
		this.u_status = u_status;
	}

	public Integer getU_id() {
		return u_id;
	}

	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}

	public String getU_account() {
		return u_account;
	}

	public void setU_account(String u_account) {
		this.u_account = u_account;
	}

	public String getU_password() {
		return u_password;
	}

	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	public String getU_openid() {
		return u_openid;
	}

	public void setU_openid(String u_openid) {
		this.u_openid = u_openid;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_idcard() {
		return u_idcard;
	}

	public void setU_idcard(String u_idcard) {
		this.u_idcard = u_idcard;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_mobile() {
		return u_mobile;
	}

	public void setU_mobile(String u_mobile) {
		this.u_mobile = u_mobile;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public Integer getU_status() {
		return u_status;
	}

	public void setU_status(Integer u_status) {
		this.u_status = u_status;
	}


	public Date getU_createdate() {
		return u_createdate;
	}

	public void setU_createdate(Date u_createdate) {
		this.u_createdate = u_createdate;
	}

	public String getU_block() {
		return u_block;
	}

	public void setU_block(String u_block) {
		this.u_block = u_block;
	}

	public String getU_modifieddate() {
		return u_modifieddate;
	}

	public void setU_modifieddate(String u_modifieddate) {
		this.u_modifieddate = u_modifieddate;
	}

	public String getU_lastlogin() {
		return u_lastlogin;
	}

	public void setU_lastlogin(String u_lastlogin) {
		this.u_lastlogin = u_lastlogin;
	}
	

}
