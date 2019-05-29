package com.webtoeic.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;

import com.webtoeic.entities.BaiTapTuVung;


public interface BaiTapTuVungService {
	
	List<BaiTapTuVung> findAll();
	void save(BaiTapTuVung baitaptuvung);
	void delete(Integer id);
	
	Page<BaiTapTuVung> getBaiTapTuVung(int page, int limit);
	
	Optional<BaiTapTuVung>  getBaiTuVungById(Integer id);
	
	List<BaiTapTuVung> getBaiTapTuVung(int id);
	
	List<BaiTapTuVung> searchListBaiTapTuVung(String search);

}
