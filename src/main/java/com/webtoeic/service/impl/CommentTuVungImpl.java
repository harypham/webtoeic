package com.webtoeic.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.BaiTapTuVung;
import com.webtoeic.entities.CommentTuVung;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.repository.CommentTuVungRepository;
import com.webtoeic.service.CommentTuVungService;

@Service
public class CommentTuVungImpl implements CommentTuVungService {
	
	@Autowired
	CommentTuVungRepository commenttuvungRepo;
	
	@Override
	public List<CommentTuVung> findByBaiTapTuVung(BaiTapTuVung baitaptuvung){
		return commenttuvungRepo.findByBaitaptuvung(baitaptuvung);
	}
	
	 @Override
	 public void save(CommentTuVung commentTuVung) {
		  commenttuvungRepo.save(commentTuVung);
		 
	 }
	

}
