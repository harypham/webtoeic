package com.webtoeic.controller.client;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webtoeic.entities.BaiThiThu;
import com.webtoeic.entities.CauHoiBaiThiThu;
import com.webtoeic.entities.KetQuaBaiTest;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.BaiThiThuService;
import com.webtoeic.service.CauHoiBaiThiThuService;
import com.webtoeic.service.KetQuaBaiTestService;
import com.webtoeic.service.NguoiDungService;
@Controller
public class BaiFullTestController {
	@Autowired
	BaiThiThuService baithithuService;
	
	
	@Autowired
	CauHoiBaiThiThuService cauhoibaithithuService;
	
	@Autowired
	KetQuaBaiTestService ketquabaitestService;
	
	@Autowired
	private NguoiDungService nguoiDungService;
	
	@ModelAttribute("loggedInUser")
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
	
	@GetMapping("/listExam")
	public String getListExam(@RequestParam(defaultValue = "1") int page, Model model) {
	
		// default value lấy từ kết quả đầu tiên
		
		try {
		
				Page<BaiThiThu> list = baithithuService.getBaiThiThu(page-1, 4);
				
				int totalPage = list.getTotalPages();
				
				List<Integer> pagelist = new ArrayList<Integer>();
				
				//Lap ra danh sach cac trang
				if(page==1 || page ==2 )
				{
					for(int i = 2; i <=3 && i<=totalPage; i++)
					{
						pagelist.add(i);
					}
				}else if(page == totalPage)
				{
					for(int i = totalPage; i >= totalPage - 2 && i> 1; i--)
					{
						pagelist.add(i);
					}
					Collections.sort(pagelist);
				}else
				{
					for(int i = page; i <= page + 1 && i<= totalPage; i++)
					{
						pagelist.add(i);
					}
					for(int i = page-1; i >= page - 1 && i> 1; i--)
					{
						pagelist.add(i);
					}
					Collections.sort(pagelist);
				}
				model.addAttribute("pageList",pagelist);
				model.addAttribute("totalPage",totalPage);
				model.addAttribute("listData",list.getContent());
				model.addAttribute("currentPage",page);

		
		return "client/listExam";
		
		}catch(Exception e) {
			System.out.println("error:"+e);
			return "client/error";
		}
	}
	
	@GetMapping("/doExam")
	public String DetailListening(Model model,@RequestParam("idExam") int id) {
		
		try {
				List<CauHoiBaiThiThu> list = cauhoibaithithuService.getListCauHoi(baithithuService.getBaiThiThu(id).get(0));
				model.addAttribute("listQuestion",list);
				return "client/fullTestListen";
				
		}catch(Exception e) {
			System.out.println("error:"+e);
			return "client/error";
		}
		
		
		
	}
	
	
	
	@RequestMapping(value="/saveResultUser/{examId}/{correctListening}/{correctReading}",method=RequestMethod.POST)
	public String showResultUser(Model model,@PathVariable("correctListening") int correctListening,
											@PathVariable("correctReading") int correctReading,
											@PathVariable("examId") int examId) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung currentUser = nguoiDungService.findByEmail(auth.getName());
		
	 	Date time = new Date();
		KetQuaBaiTest ketquabaitest = new KetQuaBaiTest();
		ketquabaitest.setNgaythi(time);
		ketquabaitest.setBaithithu(baithithuService.getBaiThiThu(examId).get(0));
		ketquabaitest.setCorrectlisten(correctListening);
		ketquabaitest.setCorrectreading(correctReading);
		ketquabaitest.setSocaudung(correctListening+correctReading);
		ketquabaitest.setSocausai(100-correctListening-correctReading);
		ketquabaitest.setNguoidung(currentUser);
		
		ketquabaitestService.save(ketquabaitest);
		model.addAttribute("correctListening",correctListening);
		model.addAttribute("correctReading",correctReading);
		model.addAttribute("total",correctReading+ correctListening);
		
		
		return "client/resultTestUser";
	}
}
