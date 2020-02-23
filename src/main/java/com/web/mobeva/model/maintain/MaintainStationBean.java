package com.web.mobeva.model.maintain;


import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Maintainstation")
public class MaintainStationBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ms_id;
	private String ms_name;
	private String ms_address;
	private String ms_phone;
	private Date ms_createdate;
	
	@OneToMany(mappedBy="maintainStationBean")
	private Set<MaintainBookingBean> maintainBookingBean;
	

	public Set<MaintainBookingBean> getMaintainBookingBean() {
		return maintainBookingBean;
	}

	public void setMaintainBookingBean(Set<MaintainBookingBean> maintainBookingBean) {
		this.maintainBookingBean = maintainBookingBean;
	}

	public MaintainStationBean() {
	}
	
	
	public MaintainStationBean(Integer ms_id, String ms_name, String ms_address, String ms_phone, Date ms_createdate,
			Set<MaintainBookingBean> maintainBookingBean) {
		super();
		this.ms_id = ms_id;
		this.ms_name = ms_name;
		this.ms_address = ms_address;
		this.ms_phone = ms_phone;
		this.ms_createdate = ms_createdate;
		this.maintainBookingBean = maintainBookingBean;
	}

	public Integer getMs_id() {
		return ms_id;
	}
	public void setMs_id(Integer ms_id) {
		this.ms_id = ms_id;
	}
	public String getMs_name() {
		return ms_name;
	}
	public void setMs_name(String ms_name) {
		this.ms_name = ms_name;
	}
	public String getMs_address() {
		return ms_address;
	}
	public void setMs_address(String ms_address) {
		this.ms_address = ms_address;
	}
	public String getMs_phone() {
		return ms_phone;
	}
	public void setMs_phone(String ms_phone) {
		this.ms_phone = ms_phone;
	}
	public Date getMs_createdate() {
		return ms_createdate;
	}
	public void setMs_createdate(Date ms_createdate) {
		this.ms_createdate = ms_createdate;
	}
	
	
}
