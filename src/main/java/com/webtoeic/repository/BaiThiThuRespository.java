package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.BaiThiThu;
@Repository
public interface BaiThiThuRespository extends JpaRepository<BaiThiThu,Integer>{
	List<BaiThiThu> findByBaithithuid(int id);

}
