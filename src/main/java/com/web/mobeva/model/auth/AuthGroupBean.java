package com.web.mobeva.model.auth;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

//@Entity
//@Table(name="Authgroup")
//@DynamicInsert(true)
//@DynamicUpdate(true)
public class AuthGroupBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ag_id;
	private Integer ag_type;
	private Integer ag_category;
	private String ag_categoryname;
	private Integer ag_page;
	private String ag_pagename;

	
	public AuthGroupBean() {
	}
	
	public AuthGroupBean(Integer ag_id, Integer ag_type, Integer ag_category, String ag_categoryname, Integer ag_page,
			String ag_pagename) {
		super();
		this.ag_id = ag_id;
		this.ag_type = ag_type;
		this.ag_category = ag_category;
		this.ag_categoryname = ag_categoryname;
		this.ag_page = ag_page;
		this.ag_pagename = ag_pagename;
	}


	public Integer getAg_id() {
		return ag_id;
	}

	public void setAg_id(Integer ag_id) {
		this.ag_id = ag_id;
	}




	public Integer getAg_type() {
		return ag_type;
	}




	public void setAg_type(Integer ag_type) {
		this.ag_type = ag_type;
	}




	public Integer getAg_category() {
		return ag_category;
	}




	public void setAg_category(Integer ag_category) {
		this.ag_category = ag_category;
	}




	public String getAg_categoryname() {
		return ag_categoryname;
	}




	public void setAg_categoryname(String ag_categoryname) {
		this.ag_categoryname = ag_categoryname;
	}




	public Integer getAg_page() {
		return ag_page;
	}




	public void setAg_page(Integer ag_page) {
		this.ag_page = ag_page;
	}




	public String getAg_pagename() {
		return ag_pagename;
	}




	public void setAg_pagename(String ag_pagename) {
		this.ag_pagename = ag_pagename;
	}

}
