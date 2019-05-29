package com.webtoeic.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import javax.jdo.annotations.Transactional;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.CauHoiBaiTapNghe;
import com.webtoeic.repository.CauHoiBaiTapNgheRepository;

@Service
public class CauHoiBaitapNgheService {

	@Autowired
	private CauHoiBaiTapNgheRepository cauHoiRepo;

	public Page<CauHoiBaiTapNghe> findListCauHoiByBaiTapId(int page, int size, long baiTapNgheId) {
		return cauHoiRepo.findByBaiTapNgheId(baiTapNgheId, PageRequest.of(page - 1, size));
	}
	
	public List<CauHoiBaiTapNghe> findListCauHoiByBaiTapId(long baiTapNgheId) {
		return cauHoiRepo.findByBaiTapNgheId(baiTapNgheId);
	}

	public Optional<CauHoiBaiTapNghe> findCauHoiById(long id) {
		return cauHoiRepo.findById(id);
	}

	@Transactional
	public CauHoiBaiTapNghe saveCauHoiBaiTapNghe(CauHoiBaiTapNghe cauHoiBaiTapNghe, HttpServletRequest request)
			throws IOException {
		CauHoiBaiTapNghe ch = cauHoiRepo.save(cauHoiBaiTapNghe);
		if (ch.getPhotoData() != null) {
			String rootDirectory = request.getSession().getServletContext().getRealPath("/");
			Path path = Paths.get(rootDirectory + "/resources/file/images/cauHoiBaiNgheId=" + ch.getId() + ".png");
			Files.write(path, cauHoiBaiTapNghe.getPhotoData());
		}
		return cauHoiRepo.save(cauHoiBaiTapNghe);
	}

	public void deleteCauHoiBaiTapNghe(long id) {
		cauHoiRepo.deleteById(id);
	}
}
