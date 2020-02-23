package com.web.mobeva.model.maintain;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Maintaininfo")
public class MaintainInfoBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer mi_id;
	private String mi_name;
	private String mi_desc;
	
	@OneToMany(mappedBy = "maintainInfoBean")
	private Set<MaintainBookingBean> maintainBookingBean;
	

	public Set<MaintainBookingBean> getMaintainBookingBean() {
		return maintainBookingBean;
	}

	public void setMaintainBookingBean(Set<MaintainBookingBean> maintainBookingBean) {
		this.maintainBookingBean = maintainBookingBean;
	}

	public MaintainInfoBean() {
	}
	
	
	public MaintainInfoBean(Integer mi_id, String mi_name, String mi_desc, Set<MaintainBookingBean> maintainBookingBean) {
		super();
		this.mi_id = mi_id;
		this.mi_name = mi_name;
		this.mi_desc = mi_desc;
		this.maintainBookingBean = maintainBookingBean;
	}

	public Integer getMi_id() {
		return mi_id;
	}
	public void setMi_id(Integer mi_id) {
		this.mi_id = mi_id;
	}
	public String getMi_name() {
		return mi_name;
	}
	public void setMi_name(String mi_name) {
		this.mi_name = mi_name;
	}
	public String getMi_desc() {
		return mi_desc;
	}
	public void setMi_desc(String mi_desc) {
		this.mi_desc = mi_desc;
	}
}
