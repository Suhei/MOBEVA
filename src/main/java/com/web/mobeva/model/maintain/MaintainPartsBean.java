package com.web.mobeva.model.maintain;

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

@Entity
@Table(name="Maintainparts")
@DynamicInsert(true) 
@DynamicUpdate(true) 
public class MaintainPartsBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer mp_id;
	private String mp_name;
	private Integer mp_price;
	private Integer mp_stock;
	private Date mp_createdate;
	private Date mp_modifieddate;
	private Integer mp_status;
	
	@OneToMany(mappedBy="maintainPartsBean")
	private Set<MaintainDetailsBean> maintainDetailsBean;
	

	public Set<MaintainDetailsBean> getMaintainDetailsBean() {
		return maintainDetailsBean;
	}

	public void setMaintainDetailsBean(Set<MaintainDetailsBean> maintainDetailsBean) {
		this.maintainDetailsBean = maintainDetailsBean;
	}

	public MaintainPartsBean() {
		super();
	}

	public MaintainPartsBean(Integer mp_id, String mp_name, Integer mp_price, Integer mp_stock, Date mp_createdate,
			Date mp_modifieddate, Integer mp_status, Set<MaintainDetailsBean> maintainDetailsBean) {
		super();
		this.mp_id = mp_id;
		this.mp_name = mp_name;
		this.mp_price = mp_price;
		this.mp_stock = mp_stock;
		this.mp_createdate = mp_createdate;
		this.mp_modifieddate = mp_modifieddate;
		this.mp_status = mp_status;
		this.maintainDetailsBean = maintainDetailsBean;
	}

	public Integer getMp_id() {
		return mp_id;
	}

	public void setMp_id(Integer mp_id) {
		this.mp_id = mp_id;
	}

	public String getMp_name() {
		return mp_name;
	}

	public void setMp_name(String mp_name) {
		this.mp_name = mp_name;
	}

	public Integer getMp_price() {
		return mp_price;
	}

	public void setMp_price(Integer mp_price) {
		this.mp_price = mp_price;
	}

	public Integer getMp_stock() {
		return mp_stock;
	}

	public void setMp_stock(Integer mp_stock) {
		this.mp_stock = mp_stock;
	}

	public Date getMp_createdate() {
		return mp_createdate;
	}

	public void setMp_createdate(Date mp_createdate) {
		this.mp_createdate = mp_createdate;
	}

	public Date getMp_modifieddate() {
		return mp_modifieddate;
	}

	public void setMp_modifieddate(Date mp_modifieddate) {
		this.mp_modifieddate = mp_modifieddate;
	}

	public Integer getMp_status() {
		return mp_status;
	}

	public void setMp_status(Integer mp_status) {
		this.mp_status = mp_status;
	}
	
	
	

}
