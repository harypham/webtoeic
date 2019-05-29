package com.webtoeic.entities;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "noi_dung_bai_tu_vung")
public class NoiDungBaiTapTuVung {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "noidungbaituvungid", nullable = false)
	private Integer noidungbaitaptuvungid;
	
	@Column(name = "number")
	private Integer number;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "transcribe")
	private String transcribe;
	
	@Column(name = "image")
	private String image;
	
	@Column(name = "audiomp3")
	private String audiomp3;
	
	@Column(name = "meaning")
	private String meaning;
	
	@Column(name = "sentence")
	private String sentence;
	
	@ManyToOne
	@JoinColumn(name="baitaptuvungid",nullable= false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private BaiTapTuVung baitaptuvung;

	public Integer getNoidungbaitaptuvungid() {
		return noidungbaitaptuvungid;
	}

	public void setNoidungbaitaptuvungid(Integer noidungbaitaptuvungid) {
		this.noidungbaitaptuvungid = noidungbaitaptuvungid;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTranscribe() {
		return transcribe;
	}

	public void setTranscribe(String transcribe) {
		this.transcribe = transcribe;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAudiomp3() {
		return audiomp3;
	}

	public void setAudiomp3(String audiomp3) {
		this.audiomp3 = audiomp3;
	}

	public String getMeaning() {
		return meaning;
	}

	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}

	public String getSentence() {
		return sentence;
	}

	public void setSentence(String sentence) {
		this.sentence = sentence;
	}

	public BaiTapTuVung getBaitaptuvung() {
		return baitaptuvung;
	}

	public void setBaitaptuvung(BaiTapTuVung baitaptuvung) {
		this.baitaptuvung = baitaptuvung;
	}
	
	

	
	
//	@Column(name="baitaptuvungid")
	

}
