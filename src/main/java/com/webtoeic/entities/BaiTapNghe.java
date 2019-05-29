package com.webtoeic.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.webtoeic.jpautil.PartToeicTypeConverter;

@Entity
public class BaiTapNghe {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String tenBaiNghe;

	private int doKho; // 1: dễ, 2:trung bình, 3: khó

	@Transient
	@JsonIgnore
	private MultipartFile photoBaiNghe; // ảnh bài nghe nếu có

	private int part; // phần 1,2,3,4 ?

	@JsonIgnore
	@Transient
	private MultipartFile audio; // audio bài nghe

	@JsonIgnore
	@Transient
	private MultipartFile fileExcelCauHoi;
	
	@Column(columnDefinition = "TEXT")
	private String script; // chi tiết bài nghe

	@OneToMany(mappedBy = "baiTapNghe", cascade = CascadeType.ALL)
	@JsonBackReference
	List<CauHoiBaiTapNghe> listCauHoiBaiTapNghe;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTenBaiNghe() {
		return tenBaiNghe;
	}

	public void setTenBaiNghe(String tenBaiNghe) {
		this.tenBaiNghe = tenBaiNghe;
	}

	public MultipartFile getPhotoBaiNghe() {
		return photoBaiNghe;
	}

	public void setPhotoBaiNghe(MultipartFile photoBaiNghe) {
		this.photoBaiNghe = photoBaiNghe;
	}

	public MultipartFile getAudio() {
		return audio;
	}

	public void setAudio(MultipartFile audio) {
		this.audio = audio;
	}

	public List<CauHoiBaiTapNghe> getListCauHoiBaiTapNghe() {
		return listCauHoiBaiTapNghe;
	}

	public void setListCauHoiBaiTapNghe(List<CauHoiBaiTapNghe> listCauHoiBaiTapNghe) {
		this.listCauHoiBaiTapNghe = listCauHoiBaiTapNghe;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public MultipartFile getFileExcelCauHoi() {
		return fileExcelCauHoi;
	}

	public void setFileExcelCauHoi(MultipartFile fileExcelCauHoi) {
		this.fileExcelCauHoi = fileExcelCauHoi;
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

	@Override
	public String toString() {
		return "BaiTapNghe tenBaiNghe=" + tenBaiNghe;
	}

}
