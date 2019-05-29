package com.webtoeic.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;


import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webtoeic.entities.BaiTapTuVung;
import com.webtoeic.entities.NoiDungBaiTapTuVung;
import com.webtoeic.service.BaiTapTuVungService;
import com.webtoeic.service.NoiDungBaiTapTuVungService;

@Controller
@RequestMapping("/admin")
public class QuanLyVocabController {
	
	@Autowired
    private HttpServletRequest request;
	@Autowired
	BaiTapTuVungService baitaptuvungService;
	@Autowired
	NoiDungBaiTapTuVungService noidungbaitaptuvungService;
	
	 @RequestMapping("/vocab/saveVocab")
	    public String uploadingPost(
	    		@RequestParam("file_imageQuestion") MultipartFile[] file_imageQuestions
	    		,@RequestParam("file_listen") MultipartFile[] file_listens
	    		,@RequestParam("file_Excel") MultipartFile file_excel
	    		,@RequestParam("file_imageVocab") MultipartFile file_imageVocab
	    		,@ModelAttribute("baitaptuvung") BaiTapTuVung baitaptuvung, BindingResult result
	    		,RedirectAttributes redirectAttrs
	    		) throws IOException {
		 
		 
		 // save file to folder local
		 
		 String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		 
		 Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/"+file_excel.getOriginalFilename() + ".xlsx");
		 file_excel.transferTo(new File(pathExcel.toString()));
		 
		 Path path_file_imageVocab = Paths.get(rootDirectory + "/resources/file/images/vocab/"+file_imageVocab.getOriginalFilename());
		 file_imageVocab.transferTo(new File(path_file_imageVocab.toString()));
		 
		 
	        
		 for(MultipartFile file_imageQuestion : file_imageQuestions) {
			 Path pathImage = Paths.get(rootDirectory + "/resources/file/images/vocab/"+file_imageQuestion.getOriginalFilename());
			 file_imageQuestion.transferTo(new File(pathImage.toString()));
	        }
		 
		 for(MultipartFile file_listen : file_listens) {
	        
	   		 	Path pathAudio = Paths.get(rootDirectory + "/resources/file/audio/vocab/"+file_listen.getOriginalFilename());
	            file_listen.transferTo(new File(pathAudio.toString()));
	            
	        }
		 
		 //save to db baitaptuvung
		 baitaptuvung.setAnhbaituvung(file_imageVocab.getOriginalFilename());
		 baitaptuvungService.save(baitaptuvung);
		 
		 // save content from file excel to noi_dung_bai_tu_vung
		 
		
		 
		 try {
			 
		 List<NoiDungBaiTapTuVung> noidungbttuvungList = new ArrayList<NoiDungBaiTapTuVung>();
		    XSSFWorkbook workbook = new XSSFWorkbook(file_excel.getInputStream());
		    XSSFSheet worksheet = workbook.getSheetAt(0);

		    for(int i=0;i<worksheet.getPhysicalNumberOfRows() ;i++) {
		    	NoiDungBaiTapTuVung noidungbaitaptuvung = new NoiDungBaiTapTuVung();

		        XSSFRow row = worksheet.getRow(i);
		        
		        noidungbaitaptuvung.setNumber((int)row.getCell(0).getNumericCellValue());
		        noidungbaitaptuvung.setContent(row.getCell(1).getStringCellValue());
		        noidungbaitaptuvung.setTranscribe(row.getCell(2).getStringCellValue());
		        noidungbaitaptuvung.setImage(row.getCell(3).getStringCellValue());
		        noidungbaitaptuvung.setAudiomp3(row.getCell(4).getStringCellValue());
		        noidungbaitaptuvung.setMeaning(row.getCell(5).getStringCellValue());
		        noidungbaitaptuvung.setSentence(row.getCell(6).getStringCellValue());
		        noidungbaitaptuvung.setBaitaptuvung(baitaptuvung);

		        noidungbttuvungList.add(noidungbaitaptuvung);
		        noidungbaitaptuvungService.save(noidungbaitaptuvung);
		    }
		  
		 
		 }catch (Exception e) {
			System.out.println("Error: "+e);
			String error = "Có lỗi xảy ra, update or add again, id ="+baitaptuvung.getBaitaptuvungid();
			redirectAttrs.addFlashAttribute("error",error);
			redirectAttrs.addFlashAttribute("errorInfo",e);
		
			 return "redirect:/admin/vocab";
		} {
			 
		 }

		 return "redirect:/admin/vocab";
//		 return "admin/quanLyVocab";
	    }
	 
	 
//	 @RequestMapping(value="/editVocab/{id}")    
//	    public String edit(@PathVariable int id, Model model){    
//	        
//	        return "empeditform";    
//	    }    
	 
	 @RequestMapping(value="/deleteVocab/{id}")    
	    public String edit(@PathVariable Integer id, Model model){   
		 	
		
	        baitaptuvungService.delete(id);
	        return "redirect:/admin/vocab";
//	        return "admin/quanLyVocab";    
	    }    
	 

}
