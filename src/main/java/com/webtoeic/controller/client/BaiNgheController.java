package com.webtoeic.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webtoeic.entities.BaiTapNghe;
import com.webtoeic.service.BaiTapNgheService;

@Controller
@RequestMapping("/listening")
public class BaiNgheController {

	@Autowired
	private BaiTapNgheService baiTapNgheService;

	@GetMapping("/part-{partNumber}/{id}")
	public String baiNghePart1(@PathVariable long id, @PathVariable int partNumber, Model model) {
		BaiTapNghe baiTapNghe = baiTapNgheService.findBaiTapNgheById(id).get();
		model.addAttribute("baiTapNghe", baiTapNghe);
		return "client/baiTapNghe/baiTapNghePart" + partNumber;
	}

	@GetMapping("")
	public String getAllBaiNgheBy(Model model) {
		model.addAttribute("listBaiNghe", baiTapNgheService.findAll());
		return "client/baiTapNghe/danhSachBaiNghe";
	}
}
