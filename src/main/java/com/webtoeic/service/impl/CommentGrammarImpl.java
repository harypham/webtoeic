package com.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.BaiGrammar;
import com.webtoeic.entities.CommentGrammar;
import com.webtoeic.repository.CommentGrammarRepository;
import com.webtoeic.service.CommentGrammarService;

@Service
public class CommentGrammarImpl implements  CommentGrammarService {
	@Autowired
	CommentGrammarRepository commentgrammarRepo;
	
	@Override
	public List<CommentGrammar> findByBaiGrammar(BaiGrammar baigrammar){
		return commentgrammarRepo.findByBaigrammar(baigrammar);
	}
	
	 @Override
	 public void save(CommentGrammar commentGrammar) {
		 commentgrammarRepo.save(commentGrammar);
		 
	 }
}
