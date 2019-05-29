package com.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webtoeic.entities.BaiTapTuVung;
import com.webtoeic.entities.CommentTuVung;


@Repository
public interface CommentTuVungRepository  extends JpaRepository<CommentTuVung,Integer> {
	
	List<CommentTuVung> findByBaitaptuvung(BaiTapTuVung baitaptuvung);

}
