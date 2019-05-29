package com.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "bai_tap_tu_vung")
public class BaiTapTuVung {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "baitaptuvungid", nullable = false)
	private Integer baitaptuvungid;
	
	
	@Column(name = "tenbaituvung")
	private String tenbaituvung;
	
	@Column(name = "anhbaituvung")
	private String anhbaituvung;

	public BaiTapTuVung() {}
	


	public BaiTapTuVung(Integer baitaptuvungid, String tenbaituvung,String anhbaituvung) {
		this.baitaptuvungid = baitaptuvungid;
		this.tenbaituvung = tenbaituvung;
		this.anhbaituvung = anhbaituvung;
	
	}

	public Integer getBaitaptuvungid() {
		return baitaptuvungid;
	}

	public void setBaitaptuvungid(Integer baitaptuvungid) {
		this.baitaptuvungid = baitaptuvungid;
	}

	public String getTenbaituvung() {
		return tenbaituvung;
	}

	public void setTenbaituvung(String tenbaituvung) {
		this.tenbaituvung = tenbaituvung;
	}

	public String getAnhbaituvung() {
		return anhbaituvung;
	}

	public void setAnhbaituvung(String anhbaituvung) {
		this.anhbaituvung = anhbaituvung;
	}
	
}
