package com.web.mobeva.model.user;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
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

import com.web.mobeva.model.maintain.MaintainBookingBean;

@Entity
@Table(name = "Usercar")
@DynamicInsert(true)
@DynamicUpdate(true)
public class UserCarBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer uc_id;
	private String uc_number;
	private String uc_modelyear;
	private String uc_brand;
	private String uc_model;
	private String uc_engine;
	private Timestamp uc_createdate;
	private Timestamp uc_modifieddate;
	
	@ManyToOne
	@JoinColumn(name="u_id")
	private UserInfoBean userInfoBean;

	public UserInfoBean getUserInfoBean() {
		return userInfoBean;
	}
	public void setUserInfoBean(UserInfoBean userInfoBean) {
		this.userInfoBean = userInfoBean;
	}
	
	@OneToMany(mappedBy="userCarBean")
	private Set<MaintainBookingBean> maintainBookingBean;
		

	public Set<MaintainBookingBean> getMaintainBookingBean() {
		return maintainBookingBean;
	}
	public void setMaintainBookingBean(Set<MaintainBookingBean> maintainBookingBean) {
		this.maintainBookingBean = maintainBookingBean;
	}
	
	public UserCarBean() {
		
	}
		
	
	public UserCarBean(Integer uc_id, String uc_number, String uc_modelyear, String uc_brand, String uc_model,
			String uc_engine, Timestamp uc_createdate, Timestamp uc_modifieddate, UserInfoBean userInfoBean,
			Set<MaintainBookingBean> maintainBookingBean) {
		super();
		this.uc_id = uc_id;
		this.uc_number = uc_number;
		this.uc_modelyear = uc_modelyear;
		this.uc_brand = uc_brand;
		this.uc_model = uc_model;
		this.uc_engine = uc_engine;
		this.uc_createdate = uc_createdate;
		this.uc_modifieddate = uc_modifieddate;
		this.userInfoBean = userInfoBean;
		this.maintainBookingBean = maintainBookingBean;
	}
	
	public Integer getUc_id() {
		return uc_id;
	}
	public void setUc_id(Integer uc_id) {
		this.uc_id = uc_id;
	}
	public String getUc_number() {
		return uc_number;
	}
	public void setUc_number(String uc_number) {
		this.uc_number = uc_number;
	}
	public String getUc_modelyear() {
		return uc_modelyear;
	}
	public void setUc_modelyear(String uc_modelyear) {
		this.uc_modelyear = uc_modelyear;
	}
	public String getUc_brand() {
		return uc_brand;
	}
	public void setUc_brand(String uc_brand) {
		this.uc_brand = uc_brand;
	}
	public String getUc_model() {
		return uc_model;
	}
	public void setUc_model(String uc_model) {
		this.uc_model = uc_model;
	}
	public String getUc_engine() {
		return uc_engine;
	}
	public void setUc_engine(String uc_engine) {
		this.uc_engine = uc_engine;
	}
	public Timestamp getUc_createdate() {
		return uc_createdate;
	}
	public void setUc_createdate(Timestamp uc_createdate) {
		this.uc_createdate = uc_createdate;
	}
	public Timestamp getUc_modifieddate() {
		return uc_modifieddate;
	}
	public void setUc_modifieddate(Timestamp uc_modifieddate) {
		this.uc_modifieddate = uc_modifieddate;
	}
	
	
	
}
