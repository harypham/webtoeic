package com.webtoeic.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.webtoeic.entities.BaiGrammar;

public interface BaiGrammarService {
	void save(BaiGrammar baigrammar);
	List<BaiGrammar> getBaiGrammar(int id);
	
	Page<BaiGrammar> getBaiGrammar(int page, int limit);
	
	List<BaiGrammar> getAllBaiGrammar();
	void delete(int id);
	
	List<BaiGrammar> searchListBaiGrammar(String search);

}
