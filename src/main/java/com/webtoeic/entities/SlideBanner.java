package com.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "slidebanner")
public class SlideBanner {
	
		@Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @Column(name = "slidebannerid", nullable = false)
	    private Integer slidebannerid;

		
		 @Column(name = "slidename", nullable = false)
		 private String slidename;
		    
		 @Column(name = "slidecontent")
		 private String slidecontent;

	    @Column(name = "slideimage")
	    private String slideimage;

		public Integer getSlidebannerid() {
			return slidebannerid;
		}

		public void setSlidebannerid(Integer slidebannerid) {
			this.slidebannerid = slidebannerid;
		}

		public String getSlidename() {
			return slidename;
		}

		public void setSlidename(String slidename) {
			this.slidename = slidename;
		}

		public String getSlidecontent() {
			return slidecontent;
		}

		public void setSlidecontent(String slidecontent) {
			this.slidecontent = slidecontent;
		}

		public String getSlideimage() {
			return slideimage;
		}

		public void setSlideimage(String slideimage) {
			this.slideimage = slideimage;
		}
		 public SlideBanner() {
		    }

		    public SlideBanner(int slidebannerid, String slidename, String slidecontent, String slideimage) {
		        this.slidebannerid = slidebannerid;
		        this.slidename = slidename;
		        this.slidecontent = slidecontent;
		        this.slideimage= slideimage;
		    }

	    
}
