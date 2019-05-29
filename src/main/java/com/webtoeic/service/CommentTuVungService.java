package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.BaiTapTuVung;
import com.webtoeic.entities.CommentTuVung;


public interface CommentTuVungService {
	
 List<CommentTuVung> findByBaiTapTuVung(BaiTapTuVung baitaptuvung);
 void save(CommentTuVung commentTuVung);
 
}
