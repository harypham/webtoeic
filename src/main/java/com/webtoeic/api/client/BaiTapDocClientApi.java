package com.webtoeic.api.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webtoeic.entities.BaiTapDoc;
import com.webtoeic.entities.CauHoiBaiTapDoc;
import com.webtoeic.service.BaiTapDocService;
import com.webtoeic.service.CauHoiBaiTapDocService;

@RestController
@RequestMapping("api/client/bai-doc")
public class BaiTapDocClientApi {
	
	@Autowired
	private BaiTapDocService baiDocService;
	
	@Autowired
	private CauHoiBaiTapDocService cauHoiService;

	@GetMapping("/baiDocId={baiDocId}")
	public ResponseEntity<Page<CauHoiBaiTapDoc>> getListCauHoiByBaiTapDocId(
			@RequestParam(defaultValue = "1") int page, @PathVariable long baiDocId) {
		return new ResponseEntity<>(cauHoiService.findListCauHoiByBaiTapId(page, 10, baiDocId), HttpStatus.OK);
	}
	
	@GetMapping("/all")
	public ResponseEntity<Page<BaiTapDoc>> findAllByPartToeic(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = true) int part, @RequestParam(required = true) int doKho) {
		return new ResponseEntity<>(baiDocService.findAllListBaiTapDocByPartAndDoKho(page, 10, part, doKho),
				HttpStatus.OK);
	}

}
