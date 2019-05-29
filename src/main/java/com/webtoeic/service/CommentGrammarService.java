package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.BaiGrammar;
import com.webtoeic.entities.CommentGrammar;


public interface CommentGrammarService {
	List<CommentGrammar> findByBaiGrammar(BaiGrammar baigrammar);
	 void save(CommentGrammar commentGrammar);
}
