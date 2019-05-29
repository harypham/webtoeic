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
import com.webtoeic.entities.BaiTapDoc;
import com.webtoeic.entities.CauHoiBaiTapDoc;
import com.webtoeic.entities.QBaiTapDoc;
import com.webtoeic.repository.BaiTapDocRepository;
import com.webtoeic.util.ExcelUtilDoc;

@Service
public class BaiTapDocService {
	
	@Autowired
	private BaiTapDocRepository baiTapDocRepo;
	
	@Autowired
	private CauHoiBaiTapDocService cauHoiService;
	
	@Autowired
	private ExcelUtilDoc excelUtilDoc;
	
	
	public Page<BaiTapDoc> findAllListBaiTapDocByPartAndDoKho(int page, int size, int part, int doKho) {
		return baiTapDocRepo.findByPartAndDoKho(part, doKho, PageRequest.of(page-1, size));
	};
	
	public Page<BaiTapDoc> findAllListBaiTapDocByPartAndDoKhoAdmin(int page, int size, String part, String doKho) {
		BooleanBuilder builder = new BooleanBuilder();

		if (!part.equals("")) {
			builder.and(QBaiTapDoc.baiTapDoc.part.eq(Integer.parseInt(part)));
		}
		
		if (!doKho.equals("")) {
			builder.and(QBaiTapDoc.baiTapDoc.doKho.eq(Integer.parseInt(doKho)));
		}
		
		return baiTapDocRepo.findAll(builder, PageRequest.of(page - 1, size));
	}

	public Optional<BaiTapDoc> findBaiTapDocById(long id) {
		return baiTapDocRepo.findById(id);
	}
	
	@Transactional
	public BaiTapDoc saveBaiTapDoc(BaiTapDoc baiTapDoc, HttpServletRequest request) {
		List<CauHoiBaiTapDoc> listCauHoi = new ArrayList<>();
		BaiTapDoc currentBaiDoc = baiTapDocRepo.save(baiTapDoc);
		try {
			for (CauHoiBaiTapDoc cauHoi : excelUtilDoc
					.getListCauHoiFromFileExcel(baiTapDoc.getFileExcelCauHoi().getInputStream())) {
				cauHoi.setBaiTapDoc(currentBaiDoc);
				listCauHoi.add(cauHoiService.saveCauHoiBaiTapDoc(cauHoi, request));
			}
//			currentBaiDoc.setDanhSachCauHoi(listCau);
			return currentBaiDoc;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public void deleteBaiTapDoc(long id) {
		baiTapDocRepo.deleteById(id);
	}

}
