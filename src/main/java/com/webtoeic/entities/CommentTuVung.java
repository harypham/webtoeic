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
@Table(name = "comment_tu_vung")
public class CommentTuVung {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cmtvocabularyid", nullable = false)
	private Integer cmtvocabularyid;
	
	@Column(name = "cmtvocabularycontent")
	private String cmtvocabularycontent;
	
	@Column(name = "time")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+7")
	private Date ngaycomment;
	
	@Override
	public String toString() {
		return "{"+"\"cmtvocabularycontent\":"+"\""+cmtvocabularycontent+"\""
				+ ","+"\"nguoidung\":" + "\""+nguoidung.getHoTen() +"\""+"}";
	}

	@ManyToOne
	@JoinColumn(name="id",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private NguoiDung nguoidung;
	
	@ManyToOne
	@JoinColumn(name="baitaptuvungid",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private BaiTapTuVung baitaptuvung;

	
	public CommentTuVung() {
		
	}
	

	public CommentTuVung(Integer cmtvocabularyid, String cmtvocabularycontent, Date ngaycomment, NguoiDung nguoidung,
			BaiTapTuVung baitaptuvung) {
		super();
		this.cmtvocabularyid = cmtvocabularyid;
		this.cmtvocabularycontent = cmtvocabularycontent;
		this.ngaycomment = ngaycomment;
		this.nguoidung = nguoidung;
		this.baitaptuvung = baitaptuvung;
	}


	public Date getNgaycomment() {
		return ngaycomment;
	}


	public void setNgaycomment(Date ngaycomment) {
		this.ngaycomment = ngaycomment;
	}


	public Integer getCmtvocabularyid() {
		return cmtvocabularyid;
	}

	public void setCmtvocabularyid(Integer cmtvocabularyid) {
		this.cmtvocabularyid = cmtvocabularyid;
	}

	public String getCmtvocabularycontent() {
		return cmtvocabularycontent;
	}

	public void setCmtvocabularycontent(String cmtvocabularycontent) {
		this.cmtvocabularycontent = cmtvocabularycontent;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public BaiTapTuVung getBaitaptuvung() {
		return baitaptuvung;
	}

	public void setBaitaptuvung(BaiTapTuVung baitaptuvung) {
		this.baitaptuvung = baitaptuvung;
	}

}
