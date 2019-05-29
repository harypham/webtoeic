package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.BaiGrammar;
@Repository
public interface BaiGrammarRepository extends JpaRepository<BaiGrammar,Integer> {
	List<BaiGrammar> findByBaigrammarid(int id);
	
	@Query("select grammar FROM BaiGrammar grammar WHERE grammar.tenbaigrammar LIKE CONCAT('%',:search,'%')")
	List<BaiGrammar> searchGrammar( @Param("search") String search);
}
