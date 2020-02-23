package com.web.mobeva.model.user;

import java.sql.Date;

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
@Table(name="Userlogin")
@DynamicInsert(true)
@DynamicUpdate(true)
public class UserLoginBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ul_id;
	private Integer ul_status;
	private String ul_ip;
	private String ul_date;
	
	@ManyToOne
	@JoinColumn(name="u_id")
	private UserInfoBean userInfoBean;
		
	public UserInfoBean getUserInfoBean() {
		return userInfoBean;
	}

	public void setUserInfoBean(UserInfoBean userInfoBean) {
		this.userInfoBean = userInfoBean;
	}

	public UserLoginBean() {

	}
	
	public UserLoginBean(Integer ul_id, Integer ul_status, String ul_ip, String ul_date, UserInfoBean userInfoBean) {
		super();
		this.ul_id = ul_id;
		this.ul_status = ul_status;
		this.ul_ip = ul_ip;
		this.ul_date = ul_date;
		this.userInfoBean = userInfoBean;
	}

	public Integer getUl_id() {
		return ul_id;
	}

	public void setUl_id(Integer ul_id) {
		this.ul_id = ul_id;
	}

	public Integer getUl_status() {
		return ul_status;
	}

	public void setUl_status(Integer ul_status) {
		this.ul_status = ul_status;
	}

	public String getUl_ip() {
		return ul_ip;
	}

	public void setUl_ip(String ul_ip) {
		this.ul_ip = ul_ip;
	}

	public String getUl_date() {
		return ul_date;
	}

	public void setUl_date(String ul_date) {
		this.ul_date = ul_date;
	}


}
