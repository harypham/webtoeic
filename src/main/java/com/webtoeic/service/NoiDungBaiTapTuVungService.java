package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.BaiTapTuVung;
import com.webtoeic.entities.NoiDungBaiTapTuVung;

public interface NoiDungBaiTapTuVungService {
	
	void save(NoiDungBaiTapTuVung noidungbaitaptuvung);
	void delete(Integer id);
	
	List<NoiDungBaiTapTuVung> getListBaiTapTuVung(BaiTapTuVung baitaptuvung);
	
}
