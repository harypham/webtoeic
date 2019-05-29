package com.webtoeic.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webtoeic.entities.BaiTapDoc;
import com.webtoeic.service.BaiTapDocService;

@Controller
@RequestMapping("/reading")
public class BaiDocController {
	
	@Autowired
	private BaiTapDocService baiTapDocService;

	@GetMapping("/part-{partNumber}/{id}")
	public String baiDocPart(@PathVariable long id, @PathVariable int partNumber, Model model) {
		BaiTapDoc baiTapDoc = baiTapDocService.findBaiTapDocById(id).get();
		model.addAttribute("baiTapDoc", baiTapDoc);
		return "client/baiTapDoc/baiTapDocPart" + partNumber;
	}

	@GetMapping("")
	public String getAllBaiDocBy(Model model) {
		return "client/baiTapDoc/danhSachBaiDoc";
	}

}
