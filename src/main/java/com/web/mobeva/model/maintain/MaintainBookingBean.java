package com.web.mobeva.model.maintain;



import java.util.Date;
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

import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;


@Entity
@Table(name = "Maintainbooking")
@DynamicInsert(true) 
@DynamicUpdate(true) 
public class MaintainBookingBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mb_id;
//	private Integer u_id;	
//	private Integer mi_id;
//	private Integer ms_id;
//	private Date mb_date;
	private String mb_date;
//	private Integer uc_id;
	private Date mb_createdate;
	private Integer mb_status;
	private Date mb_modifieddate;
	private Integer mb_stage;

	@ManyToOne
	@JoinColumn(name = "u_id")
	private UserInfoBean userInfoBean ;

	public UserInfoBean getUserInfoBean() {
		return userInfoBean;
	}
	public void setUserInfoBean(UserInfoBean userInfoBean) {
		this.userInfoBean = userInfoBean;
	}

	@ManyToOne
	@JoinColumn(name = "mi_id")
	private MaintainInfoBean maintainInfoBean;

	public MaintainInfoBean getMaintainInfoBean() {
		return maintainInfoBean;
	}
	public void setMaintainInfoBean(MaintainInfoBean maintainInfoBean) {
		this.maintainInfoBean = maintainInfoBean;
	}

	@ManyToOne
	@JoinColumn(name = "ms_id")
	private MaintainStationBean maintainStationBean;

	public MaintainStationBean getMaintainStationBean() {
		return maintainStationBean;
	}
	public void setMaintainStationBean(MaintainStationBean maintainStationBean) {
		this.maintainStationBean = maintainStationBean;
	}

	@ManyToOne
	@JoinColumn(name = "uc_id")
	private UserCarBean userCarBean;


	public UserCarBean getUserCarBean() {
		return userCarBean;
	}
	public void setUserCarBean(UserCarBean userCarBean) {
		this.userCarBean = userCarBean;
	}

	@OneToMany(mappedBy="maintainBookingBean")
	private Set<MaintainDetailsBean> mb_maintaindetails = new LinkedHashSet<>();	
	
	
	public Set<MaintainDetailsBean> getMb_maintaindetails() {
		return mb_maintaindetails;
	}

	public void setMb_maintaindetails(Set<MaintainDetailsBean> mb_maintaindetails) {
		this.mb_maintaindetails = mb_maintaindetails;
	}

	public MaintainBookingBean() {
	}
	
	public MaintainBookingBean(Integer mb_id, String mb_date, Date mb_createdate, Integer mb_status, Date mb_modifieddate,
			Integer mb_stage, UserInfoBean userInfoBean, MaintainInfoBean maintainInfoBean,
			MaintainStationBean maintainStationBean, UserCarBean userCarBean,
			Set<MaintainDetailsBean> mb_maintaindetails) {
		super();
		this.mb_id = mb_id;
		this.mb_date = mb_date;
		this.mb_createdate = mb_createdate;
		this.mb_status = mb_status;
		this.mb_modifieddate = mb_modifieddate;
		this.mb_stage = mb_stage;
		this.userInfoBean = userInfoBean;
		this.maintainInfoBean = maintainInfoBean;
		this.maintainStationBean = maintainStationBean;
		this.userCarBean = userCarBean;
		this.mb_maintaindetails = mb_maintaindetails;
	}
	public Integer getMb_id() {
		return mb_id;
	}

	public void setMb_id(Integer mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_date() {
		return mb_date;
	}

	public void setMb_date(String mb_date) {
		this.mb_date = mb_date;
	}

	public Date getMb_createdate() {
		return mb_createdate;
	}

	public void setMb_createdate(Date mb_createdate) {
		this.mb_createdate = mb_createdate;
	}

	public Integer getMb_status() {
		return mb_status;
	}

	public void setMb_status(Integer mb_status) {
		this.mb_status = mb_status;
	}

	public Date getMb_modifieddate() {
		return mb_modifieddate;
	}

	public void setMb_modifieddate(Date mb_modifieddate) {
		this.mb_modifieddate = mb_modifieddate;
	}
	public Integer getMb_stage() {
		return mb_stage;
	}
	public void setMb_stage(Integer mb_stage) {
		this.mb_stage = mb_stage;
	}
	
	

}
