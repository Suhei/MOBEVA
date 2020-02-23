package com.web.mobeva.model.user;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;



@Entity
@Table(name="UserQuiz")
@DynamicInsert(true)
@DynamicUpdate(true)
public class UserQuizBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer uq_id;
	private Integer uq_question;
	private String uq_answer;
	private Date uq_modifieddate;
	private Date uq_createdate;
	
	@OneToOne
	@JoinColumn(name="u_id")
	private UserInfoBean userInfoBean;
	
		
	public UserInfoBean getUserInfoBean() {
		return userInfoBean;
	}

	public void setUserInfoBean(UserInfoBean userInfoBean) {
		this.userInfoBean = userInfoBean;
	}

	public UserQuizBean() {
		
	}

	public UserQuizBean(Integer uq_id, Integer uq_question, String uq_answer, Date uq_modifieddate, Date uq_createdate,
			UserInfoBean userInfoBean) {
		super();
		this.uq_id = uq_id;
		this.uq_question = uq_question;
		this.uq_answer = uq_answer;
		this.uq_modifieddate = uq_modifieddate;
		this.uq_createdate = uq_createdate;
		this.userInfoBean = userInfoBean;
	}


	public Integer getUq_id() {
		return uq_id;
	}

	public void setUq_id(Integer uq_id) {
		this.uq_id = uq_id;
	}

	public Integer getUq_question() {
		return uq_question;
	}

	public void setUq_question(Integer uq_question) {
		this.uq_question = uq_question;
	}

	public String getUq_answer() {
		return uq_answer;
	}

	public void setUq_answer(String uq_answer) {
		this.uq_answer = uq_answer;
	}

	public Date getUq_modifieddate() {
		return uq_modifieddate;
	}

	public void setUq_modifieddate(Date uq_modifieddate) {
		this.uq_modifieddate = uq_modifieddate;
	}

	public Date getUq_createdate() {
		return uq_createdate;
	}

	public void setUq_createdate(Date uq_createdate) {
		this.uq_createdate = uq_createdate;
	}
		
}
