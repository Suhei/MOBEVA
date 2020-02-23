package com.web.mobeva.model.maintain;




import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.web.mobeva.model.auth.AuthinfoBean;

@Entity
@Table(name = "Maintaindetails")
@DynamicInsert(true) 
@DynamicUpdate(true) 
public class MaintainDetailsBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer md_id;

	private Float md_hours;

	private Integer md_pcs;
	private Date md_createdate;
	private Date md_modifieddate;
	
	@ManyToOne
	@JoinColumn(name="mb_id")
	private MaintainBookingBean maintainBookingBean;
	

	public MaintainBookingBean getMaintainBookingBean() {
		return maintainBookingBean;
	}

	public void setMaintainBookingBean(MaintainBookingBean maintainBookingBean) {
		this.maintainBookingBean = maintainBookingBean;
	}

	@ManyToOne
	@JoinColumn(name="a_id")
	private AuthinfoBean authinfoBean;

	public AuthinfoBean getAuthinfoBean() {
		return authinfoBean;
	}

	public void setAuthinfoBean(AuthinfoBean authinfoBean) {
		this.authinfoBean = authinfoBean;
	}
	

	@ManyToOne
	@JoinColumn(name="mp_id")
	private MaintainPartsBean maintainPartsBean;
	


	public MaintainPartsBean getMaintainPartsBean() {
		return maintainPartsBean;
	}

	public void setMaintainPartsBean(MaintainPartsBean maintainPartsBean) {
		this.maintainPartsBean = maintainPartsBean;
	}

	public MaintainDetailsBean() {
		super();
	}
	
	public MaintainDetailsBean(Integer md_id, Float md_hours, Integer md_pcs, Date md_createdate, Date md_modifieddate,
			MaintainBookingBean maintainBookingBean, AuthinfoBean authinfoBean, MaintainPartsBean maintainPartsBean) {
		super();
		this.md_id = md_id;
		this.md_hours = md_hours;
		this.md_pcs = md_pcs;
		this.md_createdate = md_createdate;
		this.md_modifieddate = md_modifieddate;
		this.maintainBookingBean = maintainBookingBean;
		this.authinfoBean = authinfoBean;
		this.maintainPartsBean = maintainPartsBean;
	}

	public Integer getMd_id() {
		return md_id;
	}

	public void setMd_id(Integer md_id) {
		this.md_id = md_id;
	}

	public Float getMd_hours() {
		return md_hours;
	}

	public void setMd_hours(Float md_hours) {
		this.md_hours = md_hours;
	}

	public Integer getMd_pcs() {
		return md_pcs;
	}

	public void setMd_pcs(Integer md_pcs) {
		this.md_pcs = md_pcs;
	}

	public Date getMd_createdate() {
		return md_createdate;
	}

	public void setMd_createdate(Date md_createdate) {
		this.md_createdate = md_createdate;
	}

	public Date getMd_modifieddate() {
		return md_modifieddate;
	}

	public void setMd_modifieddate(Date md_modifieddate) {
		this.md_modifieddate = md_modifieddate;
	}

	
}
