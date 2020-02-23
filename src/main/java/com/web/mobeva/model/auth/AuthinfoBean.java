package com.web.mobeva.model.auth;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.web.mobeva.model.maintain.MaintainDetailsBean;
@Entity
@Table(name="Authinfo")
@DynamicInsert(true)
@DynamicUpdate(true)
public class AuthinfoBean implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer a_id;
	private String a_account;
	private String a_password;
	private Integer ag_type;
	private Date a_createdate;
	private String a_modifieddate;
	private Integer a_status;
	private String a_block;
	private String a_ip;
	private String a_email;
//	private Integer a_id;
//	private String a_account;
//	private String a_password;
//	private Integer ag_type;
//	private Date a_createdate;
//	private Date a_modifieddate;
//	private Integer a_status;
//	private Date a_block;
//	private String a_ip;
	
	@OneToMany(mappedBy="authinfoBean")
	private Set<MaintainDetailsBean> maintainDetailsBean;
	
	public Set<MaintainDetailsBean> getMaintainDetailsBean() {
		return maintainDetailsBean;
	}

	public void setMaintainDetailsBean(Set<MaintainDetailsBean> maintainDetailsBean) {
		this.maintainDetailsBean = maintainDetailsBean;
	}
	
	@OneToMany(mappedBy="authInfoBean")
	private Set<AuthLoginBean> a_AuthLoginBean;
	

	public Set<AuthLoginBean> getA_AuthLoginBean() {
		return a_AuthLoginBean;
	}

	public void setA_AuthLoginBean(Set<AuthLoginBean> a_AuthLoginBean) {
		this.a_AuthLoginBean = a_AuthLoginBean;
	}
	
	

	public AuthinfoBean() {
		super();
	}

	public AuthinfoBean(Integer a_id, String a_account, String a_password, Integer ag_type, Date a_createdate,
			String a_modifieddate, Integer a_status, String a_block, String a_ip, String a_email,
			Set<MaintainDetailsBean> maintainDetailsBean, Set<AuthLoginBean> a_AuthLoginBean) {
		super();
		this.a_id = a_id;
		this.a_account = a_account;
		this.a_password = a_password;
		this.ag_type = ag_type;
		this.a_createdate = a_createdate;
		this.a_modifieddate = a_modifieddate;
		this.a_status = a_status;
		this.a_block = a_block;
		this.a_ip = a_ip;
		this.a_email = a_email;
		this.maintainDetailsBean = maintainDetailsBean;
		this.a_AuthLoginBean = a_AuthLoginBean;
	}

	public Integer getA_id() {
		return a_id;
	}

	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}

	public String getA_account() {
		return a_account;
	}

	public void setA_account(String a_account) {
		this.a_account = a_account;
	}

	public String getA_password() {
		return a_password;
	}

	public void setA_password(String a_password) {
		this.a_password = a_password;
	}

	public Integer getAg_type() {
		return ag_type;
	}

	public void setAg_type(Integer ag_type) {
		this.ag_type = ag_type;
	}

	public Date getA_createdate() {
		return a_createdate;
	}

	public void setA_createdate(Date a_createdate) {
		this.a_createdate = a_createdate;
	}


	public Integer getA_status() {
		return a_status;
	}

	public void setA_status(Integer a_status) {
		this.a_status = a_status;
	}

	public String getA_ip() {
		return a_ip;
	}

	public void setA_ip(String a_ip) {
		this.a_ip = a_ip;
	}

	public String getA_modifieddate() {
		return a_modifieddate;
	}

	public void setA_modifieddate(String a_modifieddate) {
		this.a_modifieddate = a_modifieddate;
	}

	public String getA_block() {
		return a_block;
	}

	public void setA_block(String a_block) {
		this.a_block = a_block;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email;
	}

	
	
}
