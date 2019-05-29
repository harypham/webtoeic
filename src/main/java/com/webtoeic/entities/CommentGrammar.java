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
@Table(name = "comment_grammar")
public class CommentGrammar {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cmtgrammarid", nullable = false)
	private Integer cmtgrammarid;
	
	@Column(name = "cmtgrammarcontent")
	private String cmtgrammarcontent;
	
	
	@Column(name = "time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+7")
	private Date ngaycomment;
	
	@ManyToOne
	@JoinColumn(name="id",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private NguoiDung nguoidung;
	
	@ManyToOne
	@JoinColumn(name="baigrammarid",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private BaiGrammar baigrammar;

	public Integer getCmtgrammarid() {
		return cmtgrammarid;
	}

	public void setCmtgrammarid(Integer cmtgrammarid) {
		this.cmtgrammarid = cmtgrammarid;
	}

	public String getCmtgrammarcontent() {
		return cmtgrammarcontent;
	}

	public void setCmtgrammarcontent(String cmtgrammarcontent) {
		this.cmtgrammarcontent = cmtgrammarcontent;
	}

	public Date getNgaycomment() {
		return ngaycomment;
	}

	public void setNgaycomment(Date ngaycomment) {
		this.ngaycomment = ngaycomment;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public BaiGrammar getBaigrammar() {
		return baigrammar;
	}

	public void setBaigrammar(BaiGrammar baigrammar) {
		this.baigrammar = baigrammar;
	}

	
	public CommentGrammar() {
		
	}
	
	
	@Override
	public String toString() {
		return "{"+"\"cmtgrammarcontent\":"+"\""+cmtgrammarcontent+"\""
				+ ","+"\"date\":"+"\""+ngaycomment+"\""
				+","+"\"nguoidung\":" + "\""+nguoidung.getHoTen() +"\""+"}";
	}
	
	public CommentGrammar(Integer cmtgrammarid, String cmtgrammarcontent, Date ngaycomment, NguoiDung nguoidung,
			BaiGrammar baigrammar) {
		super();
		this.cmtgrammarid = cmtgrammarid;
		this.cmtgrammarcontent = cmtgrammarcontent;
		this.ngaycomment = ngaycomment;
		this.nguoidung = nguoidung;
		this.baigrammar = baigrammar;
	}


}
