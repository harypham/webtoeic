package com.webtoeic.api.admin;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.webtoeic.entities.BaiGrammar;
import com.webtoeic.service.BaiGrammarService;

@RestController
@RequestMapping("/api/admin/grammar")
public class BaiGrammarApi {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private BaiGrammarService baigrammarService;

	@GetMapping("/loadGrammar")
	public List<String> showAllGrammar() {

		List<BaiGrammar> list = baigrammarService.getAllBaiGrammar();

		List<String> response = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
//			String json ="{"+"'baithithuid':"+"'"+list.get(i).getBaithithuid()+	"',"
//					+ "'anhbaithithu':'"+list.get(i).getAnhbaithithu()+			"',"
//					+ "'tenbaithithu':'"+list.get(i).getTenbaithithu()+			"'}";

			String json = "baithithuid:" + list.get(i).getBaigrammarid() + "," + "anhbaithithu:"
					+ list.get(i).getAnhbaigrammar() + "," + "tenbaithithu:" + list.get(i).getTenbaigrammar();

			response.add(json);
		}

		return response;

	}

	@RequestMapping(value = "/delete/{idBaiGrammar}")
	public String deleteById(@PathVariable("idBaiGrammar") int id) {
		baigrammarService.delete(id);
		return "success";
	}
	
	// get info Grammar ->edit Grammar
	@RequestMapping(value = "/infoGrammar/{idBaiGrammar}")
	public String infoGrammarById(@PathVariable("idBaiGrammar") int id) {
		BaiGrammar baiGrammar = baigrammarService.getBaiGrammar(id).get(0);
		
		String json = "name==" + baiGrammar.getTenbaigrammar() + "|" + "anhbaigrammar=="
				+ baiGrammar.getAnhbaigrammar() + "|" + "content==" + baiGrammar.getContentMarkDown();
		
		return json;
	}
	

	@PostMapping(value = "/save")
	@ResponseBody
	public List<String> addBaiGrammar(
			@RequestParam("file_image") MultipartFile file_image,
			@RequestParam("name") String name,
			@RequestParam("contentMarkdown") String contentMarkdown,
			@RequestParam("contentHtml") String contentHtml) {

		List<String> response = new ArrayList<String>();

		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		BaiGrammar baigrammar = new BaiGrammar();
		baigrammarService.save(baigrammar);

		try {	
			// save file upload to local folder
			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/grammar/" + "" + baigrammar.getBaigrammarid() + "."
					+ file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));
			baigrammar.setAnhbaigrammar(baigrammar.getBaigrammarid() + "." + file_image.getOriginalFilename());

			baigrammar.setTenbaigrammar(name);
			baigrammar.setContentMarkDown(contentMarkdown);
			baigrammar.setContentHTML(contentHtml);

			baigrammarService.save(baigrammar);

		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorAddGrammar:" + e);

		}

		return response;
	}
	
	
	@PostMapping(value = "/update")
	@ResponseBody
	public List<String> updateBaiGrammar(
			@RequestParam("idGrammar") int id,
			@RequestPart("file_image") MultipartFile file_image,
			@RequestParam("name") String name,
			@RequestParam("contentMarkdown") String contentMarkdown,
			@RequestParam("contentHtml") String contentHtml) {

		List<String> response = new ArrayList<String>();

		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		BaiGrammar baigrammar = baigrammarService.getBaiGrammar(id).get(0);
		baigrammarService.save(baigrammar);
		try {	
			// save file upload to local folder
			if(!file_image.isEmpty()) {
			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/grammar/" + "" + baigrammar.getBaigrammarid() + "."
					+ file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));
			baigrammar.setAnhbaigrammar(baigrammar.getBaigrammarid() + "." + file_image.getOriginalFilename());
			}
			
			baigrammar.setTenbaigrammar(name);
			baigrammar.setContentMarkDown(contentMarkdown);
			baigrammar.setContentHTML(contentHtml);

			baigrammarService.save(baigrammar);

		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorAddGrammar:" + e);

		}

		return response;
	}


}
