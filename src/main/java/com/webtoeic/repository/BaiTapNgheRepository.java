package com.webtoeic.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import com.webtoeic.entities.BaiTapNghe;
import com.webtoeic.entities.PartToeic;

public interface BaiTapNgheRepository extends JpaRepository<BaiTapNghe, Long>, QuerydslPredicateExecutor<BaiTapNghe> {

	Page<BaiTapNghe> findByPartAndDoKho(int part, int doKho, Pageable pageable);
}
