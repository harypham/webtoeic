package com.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.BaiThiThu;
import com.webtoeic.entities.CauHoiBaiThiThu;
import com.webtoeic.repository.CauHoiBaiThiThuRespository;
import com.webtoeic.service.CauHoiBaiThiThuService;
@Service
public class CauHoiBaiThiThuImpl implements CauHoiBaiThiThuService{
	
	@Autowired
	CauHoiBaiThiThuRespository cauhoibaithithuRepo;
	
	@Override
	public void  save(CauHoiBaiThiThu cauhoibaithithu) {
		 cauhoibaithithuRepo.save(cauhoibaithithu);
	}
	
	@Override 
	public List<CauHoiBaiThiThu> getListCauHoi(BaiThiThu baithithu){
		return cauhoibaithithuRepo.findByBaithithu(baithithu);
	}
}
