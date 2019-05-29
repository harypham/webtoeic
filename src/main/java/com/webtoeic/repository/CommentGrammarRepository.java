package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.BaiGrammar;
import com.webtoeic.entities.CommentGrammar;

@Repository
public interface CommentGrammarRepository  extends JpaRepository<CommentGrammar,Integer>{

	List<CommentGrammar> findByBaigrammar(BaiGrammar baigrammar);

}
