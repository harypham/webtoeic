package com.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.KetQuaBaiTest;

@Repository
public interface KetQuaBaiTestRepository extends JpaRepository<KetQuaBaiTest,Integer> {
	
}
