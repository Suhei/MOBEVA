package com.web.mobeva.model.shop;


import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Shopproducts")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ShopProductsBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer sp_id;
	private String sp_name;
	private Integer sp_category;
	private Integer sp_price;
	private Integer sp_stock;
	private Integer sp_discount;
	private String sp_desc;
	private String sp_img1;
	private String sp_img2;
	private String sp_img3;
	private String sp_intro;
	private Integer sp_recommend;
	private Integer sp_status;
	private Date sp_modifieddate;
	private Date sp_createdate;
	
	//後台仕杰新增
	@Transient
	private MultipartFile uploadImg1;
	@Transient
	private MultipartFile uploadImg2;
	@Transient
	private MultipartFile uploadImg3;
	@Transient
	private MultipartFile uploadintro;

	
	public MultipartFile getUploadImg1() {
		return uploadImg1;
	}

	public void setUploadImg1(MultipartFile uploadImg1) {
		this.uploadImg1 = uploadImg1;
	}

	public MultipartFile getUploadImg2() {
		return uploadImg2;
	}

	public void setUploadImg2(MultipartFile uploadImg2) {
		this.uploadImg2 = uploadImg2;
	}

	public MultipartFile getUploadImg3() {
		return uploadImg3;
	}

	public void setUploadImg3(MultipartFile uploadImg3) {
		this.uploadImg3 = uploadImg3;
	}

	public MultipartFile getUploadintro() {
		return uploadintro;
	}

	public void setUploadintro(MultipartFile uploadintro) {
		this.uploadintro = uploadintro;
	}

	
	@OneToMany(mappedBy="shopProductsBean")
	private Set<ShopCartBean> sp_shopcart = new LinkedHashSet<>(); 
		
	public Set<ShopCartBean> getSp_shopcart() {
		return sp_shopcart;
	}

	public void setSp_shopcart(Set<ShopCartBean> sp_shopcart) {
		this.sp_shopcart = sp_shopcart;
	}
	
	@OneToMany(mappedBy="shopProductsBean")
	private Set<ShopDetailsBean> sp_shopdetails = new LinkedHashSet<>(); 
	
	
	public Set<ShopDetailsBean> getSp_shopdetails() {
		return sp_shopdetails;
	}

	public void setSp_shopdetails(Set<ShopDetailsBean> sp_shopdetails) {
		this.sp_shopdetails = sp_shopdetails;
	}

	public ShopProductsBean() {
		
	}
	public ShopProductsBean(Integer sp_id, String sp_name, Integer sp_category, Integer sp_price, Integer sp_stock,
			Integer sp_discount, String sp_desc, String sp_img1, String sp_img2, String sp_img3, String sp_intro,
			Integer sp_recommend, Integer sp_status, Date sp_modifieddate, Date sp_createdate,
			Set<ShopCartBean> sp_shopcart, Set<ShopDetailsBean> sp_shopdetails) {
		super();
		this.sp_id = sp_id;
		this.sp_name = sp_name;
		this.sp_category = sp_category;
		this.sp_price = sp_price;
		this.sp_stock = sp_stock;
		this.sp_discount = sp_discount;
		this.sp_desc = sp_desc;
		this.sp_img1 = sp_img1;
		this.sp_img2 = sp_img2;
		this.sp_img3 = sp_img3;
		this.sp_intro = sp_intro;
		this.sp_recommend = sp_recommend;
		this.sp_status = sp_status;
		this.sp_modifieddate = sp_modifieddate;
		this.sp_createdate = sp_createdate;
		this.sp_shopcart = sp_shopcart;
		this.sp_shopdetails = sp_shopdetails;
	}

	public Integer getSp_id() {
		return sp_id;
	}

	public void setSp_id(Integer sp_id) {
		this.sp_id = sp_id;
	}

	public String getSp_name() {
		return sp_name;
	}

	public void setSp_name(String sp_name) {
		this.sp_name = sp_name;
	}

	public Integer getSp_category() {
		return sp_category;
	}

	public void setSp_category(Integer sp_category) {
		this.sp_category = sp_category;
	}

	public Integer getSp_price() {
		return sp_price;
	}

	public void setSp_price(Integer sp_price) {
		this.sp_price = sp_price;
	}

	public Integer getSp_stock() {
		return sp_stock;
	}

	public void setSp_stock(Integer sp_stock) {
		this.sp_stock = sp_stock;
	}

	public Integer getSp_discount() {
		return sp_discount;
	}

	public void setSp_discount(Integer sp_discount) {
		this.sp_discount = sp_discount;
	}

	public String getSp_desc() {
		return sp_desc;
	}

	public void setSp_desc(String sp_desc) {
		this.sp_desc = sp_desc;
	}


	public Integer getSp_recommend() {
		return sp_recommend;
	}

	public void setSp_recommend(Integer sp_recommend) {
		this.sp_recommend = sp_recommend;
	}

	public Integer getSp_status() {
		return sp_status;
	}

	public void setSp_status(Integer sp_status) {
		this.sp_status = sp_status;
	}

	public Date getSp_modifieddate() {
		return sp_modifieddate;
	}

	public void setSp_modifieddate(Date sp_modifieddate) {
		this.sp_modifieddate = sp_modifieddate;
	}

	public Date getSp_createdate() {
		return sp_createdate;
	}

	public void setSp_createdate(Date sp_createdate) {
		this.sp_createdate = sp_createdate;
	}

	
	public String getSp_img1() {
		return sp_img1;
	}

	public void setSp_img1(String sp_img1) {
		this.sp_img1 = sp_img1;
	}

	public String getSp_img2() {
		return sp_img2;
	}

	public void setSp_img2(String sp_img2) {
		this.sp_img2 = sp_img2;
	}

	public String getSp_img3() {
		return sp_img3;
	}

	public void setSp_img3(String sp_img3) {
		this.sp_img3 = sp_img3;
	}

	public String getSp_intro() {
		return sp_intro;
	}

	public void setSp_intro(String sp_intro) {
		this.sp_intro = sp_intro;
	}
	
	
}
