package com.webtoeic.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ket_qua")
public class KetQuaBaiTest {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ketquaid", nullable = false)
	private Integer ketquaid;
	
	@Column(name = "socaudung")
	private int socaudung;

	@Column(name = "socausai")
	private int socausai;
	
	@Column(name = "time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+7")
	private Date ngaythi;
	
	
	@Column(name = "correctread")
	private int correctreading;
	
	@Column(name = "correctlisten")
	private int correctlisten;
	
	@ManyToOne
	@JoinColumn(name="nguoidungid",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private NguoiDung nguoidung;
	
	@ManyToOne
	@JoinColumn(name="baithithuid",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private BaiThiThu baithithu;

	
	
public KetQuaBaiTest() {
		
	}


	
	
	public KetQuaBaiTest(Integer ketquaid, int socaudung, int socausai, Date ngaythi, int correctreading, int correctlisten,
		NguoiDung nguoidung, BaiThiThu baithithu) {
	super();
	this.ketquaid = ketquaid;
	this.socaudung = socaudung;
	this.socausai = socausai;
	this.ngaythi = ngaythi;
	this.correctreading = correctreading;
	this.correctlisten = correctlisten;
	this.nguoidung = nguoidung;
	this.baithithu = baithithu;
}




	public int getSocaudung() {
		return socaudung;
	}




	public void setSocaudung(int socaudung) {
		this.socaudung = socaudung;
	}




	public int getSocausai() {
		return socausai;
	}




	public void setSocausai(int socausai) {
		this.socausai = socausai;
	}




	public int getCorrectreading() {
		return correctreading;
	}




	public void setCorrectreading(int correctreading) {
		this.correctreading = correctreading;
	}




	public int getCorrectlisten() {
		return correctlisten;
	}




	public void setCorrectlisten(int correctlisten) {
		this.correctlisten = correctlisten;
	}




	public Integer getKetquaid() {
		return ketquaid;
	}

	public void setKetquaid(Integer ketquaid) {
		this.ketquaid = ketquaid;
	}

	
	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public BaiThiThu getBaithithu() {
		return baithithu;
	}

	public void setBaithithu(BaiThiThu baithithu) {
		this.baithithu = baithithu;
	}
	public Date getNgaythi() {
		return ngaythi;
	}

	public void setNgaythi(Date ngaythi) {
		this.ngaythi = ngaythi;
	}


}
