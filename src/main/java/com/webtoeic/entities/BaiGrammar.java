package com.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bai_grammar")
public class BaiGrammar {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "baigrammarid", nullable = false)
	private Integer baigrammarid;
	
	@Column(name = "tenbaigrammar")
	private String tenbaigrammar;
	
	@Column(name = "anhbaigrammar")
	private String anhbaigrammar;
	
	@Column(columnDefinition = "TEXT",name="content_HTML")
	private String contentHTML;
	
	@Column(columnDefinition = "TEXT",name="content_MarkDown")
	private String contentMarkDown;

	public Integer getBaigrammarid() {
		return baigrammarid;
	}

	public void setBaigrammarid(Integer baigrammarid) {
		this.baigrammarid = baigrammarid;
	}

	public String getTenbaigrammar() {
		return tenbaigrammar;
	}

	public void setTenbaigrammar(String tenbaigrammar) {
		this.tenbaigrammar = tenbaigrammar;
	}

	public String getAnhbaigrammar() {
		return anhbaigrammar;
	}

	public void setAnhbaigrammar(String anhbaigrammar) {
		this.anhbaigrammar = anhbaigrammar;
	}


	public String getContentHTML() {
		return contentHTML;
	}

	public void setContentHTML(String contentHTML) {
		this.contentHTML = contentHTML;
	}

	public String getContentMarkDown() {
		return contentMarkDown;
	}

	public void setContentMarkDown(String contentMarkDown) {
		this.contentMarkDown = contentMarkDown;
	}

	public BaiGrammar() {
		
	}

	public BaiGrammar(Integer baigrammarid, String tenbaigrammar, String anhbaigrammar, String contentHTML,
			String contentMarkDown) {
		super();
		this.baigrammarid = baigrammarid;
		this.tenbaigrammar = tenbaigrammar;
		this.anhbaigrammar = anhbaigrammar;
		this.contentHTML = contentHTML;
		this.contentMarkDown = contentMarkDown;
	}


	
	

}
