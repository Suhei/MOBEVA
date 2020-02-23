package com.web.mobeva.model.auth;

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
@Table(name="Authlogin")
@DynamicInsert(true)
@DynamicUpdate(true)
public class AuthLoginBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer al_id;
	private Date al_date;
	private Integer al_status;
	private String al_ip;

	
	
	@ManyToOne
	@JoinColumn(name = "a_id")
	private AuthinfoBean authInfoBean;

	public AuthinfoBean getAuthinfoBean() {
		return authInfoBean;
	}

	public void setAuthinfoBean(AuthinfoBean authInfoBean) {
		this.authInfoBean = authInfoBean;
	}

	public AuthLoginBean(Integer al_id, Date al_date, Integer al_status, String al_ip, AuthinfoBean authInfoBean) {
		super();
		this.al_id = al_id;
		this.al_date = al_date;
		this.al_status = al_status;
		this.al_ip = al_ip;
		this.authInfoBean = authInfoBean;
	}


	public AuthLoginBean() {
	}



	public Integer getAl_id() {
		return al_id;
	}



	public void setAl_id(Integer al_id) {
		this.al_id = al_id;
	}



	public Date getAl_date() {
		return al_date;
	}



	public void setAl_date(Date al_date) {
		this.al_date = al_date;
	}
	public Integer getAl_status() {
		return al_status;
	}

	public void setAl_status(Integer al_status) {
		this.al_status = al_status;
	}

	public String getAl_ip() {
		return al_ip;
	}

	public void setAl_ip(String al_ip) {
		this.al_ip = al_ip;
	}

	
	
}
