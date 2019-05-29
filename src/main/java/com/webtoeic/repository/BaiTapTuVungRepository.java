package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.BaiTapTuVung;

@Repository
public interface BaiTapTuVungRepository extends JpaRepository<BaiTapTuVung,Integer> {
	
	List<BaiTapTuVung> findByBaitaptuvungid(int id);
	
	@Query("select vocab FROM BaiTapTuVung vocab WHERE vocab.tenbaituvung LIKE CONCAT('%',:search,'%')")
	List<BaiTapTuVung> searchVocab( @Param("search") String search);
}
