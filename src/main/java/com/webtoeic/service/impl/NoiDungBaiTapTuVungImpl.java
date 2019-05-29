package com.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.BaiTapTuVung;
import com.webtoeic.entities.NoiDungBaiTapTuVung;
import com.webtoeic.repository.NoiDungBaiTapTuVungRepository;
import com.webtoeic.service.NoiDungBaiTapTuVungService;

@Service
public class NoiDungBaiTapTuVungImpl implements NoiDungBaiTapTuVungService {
	
	@Autowired
	NoiDungBaiTapTuVungRepository ndbaitaptuvungrepository;
	@Override
	public void save(NoiDungBaiTapTuVung noidungbaitaptuvung) {
		ndbaitaptuvungrepository.save(noidungbaitaptuvung);
	}
	
	
	@Override
	public void delete(Integer id) {
		ndbaitaptuvungrepository.deleteById(id);
	}
	
	
	@Override
	public List<NoiDungBaiTapTuVung> getListBaiTapTuVung(BaiTapTuVung baitaptuvung){
		
		return ndbaitaptuvungrepository.findByBaitaptuvung(baitaptuvung);
	}

}
