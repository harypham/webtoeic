package com.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.BaiGrammar;
import com.webtoeic.repository.BaiGrammarRepository;
import com.webtoeic.service.BaiGrammarService;

@Service
public class BaiGrammarImpl implements BaiGrammarService {
	@Autowired
	BaiGrammarRepository baigrammarRepo;
	
	@Override
	public void save(BaiGrammar baigrammar) {
		baigrammarRepo.save(baigrammar);
	}
	
	@Override
	public List<BaiGrammar> getBaiGrammar(int id){
		return baigrammarRepo.findByBaigrammarid(id);
	}
	
	@Override
	public Page<BaiGrammar> getBaiGrammar(int page, int size){
		return baigrammarRepo.findAll(PageRequest.of(page, size));
		
	}
	
	@Override
	public List<BaiGrammar>getAllBaiGrammar(){
		return baigrammarRepo.findAll();
	}
	
	@Override
	public void delete(int id) {
		baigrammarRepo.deleteById(id);
	}
	
	@Override
	public List<BaiGrammar> searchListBaiGrammar(String search){
		return baigrammarRepo.searchGrammar(search);
		
	}
}
