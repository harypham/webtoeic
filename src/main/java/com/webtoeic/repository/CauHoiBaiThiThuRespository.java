package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.BaiThiThu;
import com.webtoeic.entities.CauHoiBaiThiThu;
@Repository
public interface CauHoiBaiThiThuRespository extends JpaRepository<CauHoiBaiThiThu,Integer>{
	
	List<CauHoiBaiThiThu> findByBaithithu(BaiThiThu baithithu);

}
