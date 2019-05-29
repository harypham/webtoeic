package com.webtoeic.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class BaiTapDoc {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String tenBaiDoc;
	private int doKho;
	
	@Transient
	@JsonIgnore
	private MultipartFile photoBaiDoc;
	
	private int part;
	
	@JsonIgnore
	@Transient
	private MultipartFile fileExcelCauHoi;
	
	@Column(columnDefinition = "TEXT")
	private String script;
	
	@OneToMany(mappedBy = "baiTapDoc", cascade = CascadeType.ALL)
	@JsonBackReference
	List<CauHoiBaiTapDoc> listCauHoiBaiTapDoc;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTenBaiDoc() {
		return tenBaiDoc;
	}

	public void setTenBaiDoc(String tenBaiDoc) {
		this.tenBaiDoc = tenBaiDoc;
	}

	public int getDoKho() {
		return doKho;
	}

	public void setDoKho(int doKho) {
		this.doKho = doKho;
	}


	public int getPart() {
		return part;
	}

	public void setPart(int part) {
		this.part = part;
	}
	

	public MultipartFile getPhotoBaiDoc() {
		return photoBaiDoc;
	}

	public void setPhotoBaiDoc(MultipartFile photoBaiDoc) {
		this.photoBaiDoc = photoBaiDoc;
	}

	public MultipartFile getFileExcelCauHoi() {
		return fileExcelCauHoi;
	}

	public void setFileExcelCauHoi(MultipartFile fileExcelCauHoi) {
		this.fileExcelCauHoi = fileExcelCauHoi;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public List<CauHoiBaiTapDoc> getListCauHoiBaiTapDoc() {
		return listCauHoiBaiTapDoc;
	}

	public void setListCauHoiBaiTapDoc(List<CauHoiBaiTapDoc> listCauHoiBaiTapDoc) {
		this.listCauHoiBaiTapDoc = listCauHoiBaiTapDoc;
	}

	@Override
	public String toString() {
		return "BaiTapDoc tenBaiDoc=" + tenBaiDoc;
	}


	

}
