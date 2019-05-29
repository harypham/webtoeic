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
import org.springframework.web.bind.annotation.ResponseBody;

import com.webtoeic.entities.BaiGrammar;
import com.webtoeic.entities.CommentGrammar;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.BaiGrammarService;
import com.webtoeic.service.CommentGrammarService;
import com.webtoeic.service.NguoiDungService;

@Controller
public class GrammarController {
	@Autowired
	BaiGrammarService baigrammarService;

	@Autowired
	CommentGrammarService commentgrammarService;

	@Autowired
	private NguoiDungService nguoiDungService;

	@ModelAttribute("loggedInUser")
	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}

	@GetMapping("/listGrammar")
	public String getPage(@RequestParam(defaultValue = "1") int page, Model model) {

//		List<BaiGrammar> list = baigrammarService.getAllBaiGrammar();
//
//		model.addAttribute("listData", list);

		// default value lấy từ kết quả đầu tiên

		Page<BaiGrammar> list = baigrammarService.getBaiGrammar(page - 1, 4);

		int totalPage = list.getTotalPages();

		List<Integer> pagelist = new ArrayList<Integer>();

		// Lap ra danh sach cac trang
		if (page == 1 || page == 2) {
			for (int i = 2; i <= 3 && i <= totalPage; i++) {
				pagelist.add(i);
			}
		} else if (page == totalPage) {
			for (int i = totalPage; i >= totalPage - 2 && i > 1; i--) {
				pagelist.add(i);
			}
			Collections.sort(pagelist);
		} else {
			for (int i = page; i <= page + 1 && i <= totalPage; i++) {
				pagelist.add(i);
			}
			for (int i = page - 1; i >= page - 1 && i > 1; i--) {
				pagelist.add(i);
			}
			Collections.sort(pagelist);
		}
		model.addAttribute("pageList", pagelist);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("listData", list.getContent());
		model.addAttribute("currentPage", page);

		return "client/listGrammar";

	}

	@GetMapping("/detailGram")
	public String DetalVocab(@RequestParam int idGram, Model model) {

		BaiGrammar baigrammar = baigrammarService.getBaiGrammar(idGram).get(0);

		List<CommentGrammar> listCmt = commentgrammarService.findByBaiGrammar(baigrammar);

		model.addAttribute("listcomment", listCmt);

		model.addAttribute("countCmt", listCmt.size());
		model.addAttribute("baigrammar", baigrammar);
		model.addAttribute("idBaiGrammar", baigrammar.getBaigrammarid());

		return "client/detailGrammar";

	}

	@RequestMapping(value = "/grammar/ajaxCmtGram/{contentComment}/{baiGrammarId}", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getAjax(@PathVariable("contentComment") String contentComment,
			@PathVariable("baiGrammarId") int id) {

		List<String> response = new ArrayList<String>();

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		NguoiDung currentUser = nguoiDungService.findByEmail(auth.getName());

		BaiGrammar baigrammar = baigrammarService.getBaiGrammar(id).get(0);
		Date time = new Date();

		// save comment
		CommentGrammar cmt = new CommentGrammar();
		cmt.setBaigrammar(baigrammar);
		cmt.setNguoidung(currentUser);
		cmt.setNgaycomment(time);
		cmt.setCmtgrammarcontent(contentComment);
		commentgrammarService.save(cmt);

		response.add(cmt.toString());
		return response;

	}

	@RequestMapping(value = "/searchGrammar/{search}", method = RequestMethod.POST)
	public String searchVocab(Model model, @PathVariable("search") String search,
			@RequestParam(defaultValue = "1") int page) {
 
		if (search.equals("all"))
		
		{
			Page<BaiGrammar> list = baigrammarService.getBaiGrammar(page - 1, 4);
			int totalPage = list.getTotalPages();
			
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("listData", list.getContent());
			model.addAttribute("currentPage", page);
	
			List<Integer> pagelist = new ArrayList<Integer>();
	
			// Lap ra danh sach cac trang
			if (page == 1 || page == 2) {
				for (int i = 2; i <= 3 && i <= totalPage; i++) {
					pagelist.add(i);
				}
			} else if (page == totalPage) {
				for (int i = totalPage; i >= totalPage - 2 && i > 1; i--) {
					pagelist.add(i);
				}
				Collections.sort(pagelist);
			} else {
				for (int i = page; i <= page + 1 && i <= totalPage; i++) {
					pagelist.add(i);
				}
				for (int i = page - 1; i >= page - 1 && i > 1; i--) {
					pagelist.add(i);
				}
				Collections.sort(pagelist);
			}
			
			model.addAttribute("pageList", pagelist);
			model.addAttribute("search",search);
		
		}

		else
		{
			List<BaiGrammar> list = baigrammarService.searchListBaiGrammar(search);
			model.addAttribute("listData", list);
			model.addAttribute("search",search);
		}
		

		return "client/resultSearchGrammar";
	}

}
