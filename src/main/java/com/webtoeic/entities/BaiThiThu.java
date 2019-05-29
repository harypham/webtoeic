package com.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bai_thi_thu")
public class BaiThiThu {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "baithithuid", nullable = false)
	private Integer baithithuid;
	
	
	@Column(name = "tenbaithithu")
	private String tenbaithithu;
	
	@Column(name = "anhbaithithu")
	private String anhbaithithu;
	


	public BaiThiThu() {
		
	}

	public BaiThiThu(Integer baithithuid, String tenbaithithu, String anhbaithithu) {
		super();
		this.baithithuid = baithithuid;
		this.tenbaithithu = tenbaithithu;
		this.anhbaithithu = anhbaithithu;
	}

	public Integer getBaithithuid() {
		return baithithuid;
	}

	public void setBaithithuid(Integer baithithuid) {
		this.baithithuid = baithithuid;
	}

	public String getTenbaithithu() {
		return tenbaithithu;
	}

	public void setTenbaithithu(String tenbaithithu) {
		this.tenbaithithu = tenbaithithu;
	}

	public String getAnhbaithithu() {
		return anhbaithithu;
	}

	public void setAnhbaithithu(String anhbaithithu) {
		this.anhbaithithu = anhbaithithu;
	}

	
//	@Override
//	public String toString() {
//		return "{"+"\"baithithuid\":"+"\""+BaiThiThu.class.get+"\""
//				+ ","+"\"nguoidung\":" + "\""+nguoidung.getHoTen() +"\""+"}";
//	}
	
}
