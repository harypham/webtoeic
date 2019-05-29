package com.webtoeic.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.SlideBanner;
import com.webtoeic.repository.SlideBannerRespository;
import com.webtoeic.service.SlideBannerService;
@Service
public class SlideBannerServiceImpl implements SlideBannerService{

	@Autowired SlideBannerRespository slideBannerRespository;
	
	@Override
	public List<SlideBanner> findAll(){
		return slideBannerRespository.findAllByOrderBySlidebanneridAsc();
	}
}
