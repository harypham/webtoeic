package com.webtoeic.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;



@Entity
public class CauHoiBaiTapDoc {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String soThuTu;
	@Column(columnDefinition = "TEXT")
	private String cauHoi;


	private String dapAn_1;
	private String dapAn_2;
	private String dapAn_3;
	private String dapAn_4;
	private String dapAnDung;
	private String giaiThich;
	
	@Column(columnDefinition = "TEXT")
	private String paragraph;
	

	@ManyToOne
	@JoinColumn(name = "baiTapDocId")
	private BaiTapDoc baiTapDoc;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSoThuTu() {
		return soThuTu;
	}

	public void setSoThuTu(String soThuTu) {
		this.soThuTu = soThuTu;
	}

	public String getCauHoi() {
		return cauHoi;
	}

	public void setCauHoi(String cauHoi) {
		this.cauHoi = cauHoi;
	}
	
	public String getParagraph() {
		return paragraph;
	}

	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}

	public String getDapAn_1() {
		return dapAn_1;
	}

	public void setDapAn_1(String dapAn_1) {
		this.dapAn_1 = dapAn_1;
	}

	public String getDapAn_2() {
		return dapAn_2;
	}

	public void setDapAn_2(String dapAn_2) {
		this.dapAn_2 = dapAn_2;
	}

	public String getDapAn_3() {
		return dapAn_3;
	}

	public void setDapAn_3(String dapAn_3) {
		this.dapAn_3 = dapAn_3;
	}

	public String getDapAn_4() {
		return dapAn_4;
	}

	public void setDapAn_4(String dapAn_4) {
		this.dapAn_4 = dapAn_4;
	}

	public String getDapAnDung() {
		return dapAnDung;
	}

	public void setDapAnDung(String dapAnDung) {
		this.dapAnDung = dapAnDung;
	}

	public String getGiaiThich() {
		return giaiThich;
	}

	public void setGiaiThich(String giaiThich) {
		this.giaiThich = giaiThich;
	}

	public BaiTapDoc getBaiTapDoc() {
		return baiTapDoc;
	}

	public void setBaiTapDoc(BaiTapDoc baiTapDoc) {
		this.baiTapDoc = baiTapDoc;
	}

	@Override
	public String toString() {
		return "CauHoiBaiTapDoc [id=" + id + ", soThuTu=" + soThuTu + ", cauHoi=" + cauHoi + ",  paragraph=" + paragraph + ", dapAn_1=" + dapAn_1 + ", dapAn_2=" + dapAn_2
				+ ", dapAn_3=" + dapAn_3 + ", dapAn_4=" + dapAn_4 + ", dapAnDung=" + dapAnDung + ", giaiThich="
				+ giaiThich + "]";
	}
	
	
}
