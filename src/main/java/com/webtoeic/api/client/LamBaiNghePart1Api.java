//package com.webtoeic.api.client;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.webtoeic.entities.CauHoiBaiTapNghe;
//import com.webtoeic.service.BaiTapNgheService;
//import com.webtoeic.service.CauHoiBaitapNgheService;
//
//@RestController
//@RequestMapping("/api/client/bai-nghe/")
//public class LamBaiNghePart1Api {
//
//	@Autowired
//	private BaiTapNgheService baiTapNgheService;
//
//	@Autowired
//	private CauHoiBaitapNgheService cauHoiService;
//
//	@GetMapping("/baiNgheId={baiNgheId}")
//	public ResponseEntity<Page<CauHoiBaiTapNghe>> getListCauHoiByBaiTapNgheId(
//			@RequestParam(defaultValue = "1") int page, @PathVariable long baiNgheId) {
//		return new ResponseEntity<>(cauHoiService.findListCauHoiByBaiTapId(page, 2, baiNgheId), HttpStatus.OK);
//	}
//}
