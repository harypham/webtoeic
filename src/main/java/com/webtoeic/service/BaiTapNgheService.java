package com.webtoeic.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.jdo.annotations.Transactional;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;
import com.webtoeic.entities.BaiTapNghe;
import com.webtoeic.entities.CauHoiBaiTapNghe;
import com.webtoeic.entities.QBaiTapNghe;
import com.webtoeic.repository.BaiTapNgheRepository;
import com.webtoeic.util.ExcelUtil;

@Service
public class BaiTapNgheService {

	@Autowired
	private BaiTapNgheRepository baiTapNgheRepo;

	@Autowired
	private CauHoiBaitapNgheService cauHoiService;

	@Autowired
	private ExcelUtil excelUtil;

	public List<BaiTapNghe> findAll(){
		return baiTapNgheRepo.findAll();
	}
	public Page<BaiTapNghe> findAllListBaiTapNgheByPartAndDoKho(int page, int size, int part, int doKho) {
		return baiTapNgheRepo.findByPartAndDoKho(part, doKho, PageRequest.of(page-1, size));
	}

	public Page<BaiTapNghe> findAllListBaiTapNgheByPartAndDoKhoAdmin(int page, int size, String part, String doKho) {
		BooleanBuilder builder = new BooleanBuilder();

		if (!part.equals("")) {
			builder.and(QBaiTapNghe.baiTapNghe.part.eq(Integer.parseInt(part)));
		}
		
		if (!doKho.equals("")) {
			builder.and(QBaiTapNghe.baiTapNghe.doKho.eq(Integer.parseInt(doKho)));
		}
		
		return baiTapNgheRepo.findAll(builder, PageRequest.of(page - 1, size));
	}
	
	public Optional<BaiTapNghe> findBaiTapNgheById(long id) {
		return baiTapNgheRepo.findById(id);
	}

	@Transactional
	public BaiTapNghe saveBaiTapNghe(BaiTapNghe baiTapNghe, HttpServletRequest request) {
		List<CauHoiBaiTapNghe> listCauHoi = new ArrayList<>();
		BaiTapNghe currentBaiNghe = baiTapNgheRepo.save(baiTapNghe);
		try {
			for (CauHoiBaiTapNghe cauHoi : excelUtil
					.getListCauHoiFromFileExcel(baiTapNghe.getFileExcelCauHoi().getInputStream())) {
				cauHoi.setBaiTapNghe(currentBaiNghe);
				listCauHoi.add(cauHoiService.saveCauHoiBaiTapNghe(cauHoi, request));
			}
//			currentBaiNghe.setDanhSachCauHoi(listCau);
			return currentBaiNghe;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void deleteBaiTapNghe(long id) {
		baiTapNgheRepo.deleteById(id);
	}
}
