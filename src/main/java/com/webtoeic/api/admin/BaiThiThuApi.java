package com.webtoeic.api.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import com.webtoeic.entities.BaiThiThu;
import com.webtoeic.entities.CauHoiBaiThiThu;
import com.webtoeic.service.BaiThiThuService;
import com.webtoeic.service.CauHoiBaiThiThuService;

@RestController
@RequestMapping("/api/admin/exam")
public class BaiThiThuApi {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	public BaiThiThuService baithithuService;

	@Autowired
	public CauHoiBaiThiThuService cauhoibaithithuService;

	@GetMapping("/loadExam")
	public List<String> showAllExam() {

		List<BaiThiThu> list = baithithuService.getAllBaiThiThu();

		List<String> response = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			String json = "baithithuid:" + list.get(i).getBaithithuid() + "," + "anhbaithithu:"
					+ list.get(i).getAnhbaithithu() + "," + "tenbaithithu:" + list.get(i).getTenbaithithu();

			response.add(json);
		}

		return response;

	}

	@RequestMapping(value = "/delete/{idBaiThiThu}")
	public String deleteById(@PathVariable("idBaiThiThu") int id) {
		baithithuService.delete(id);
		return "success";
	}

	@PostMapping(value = "/save", consumes = "multipart/form-data")
	@ResponseBody
	public List<String> addBaiThiThu(@RequestParam("file_excel") MultipartFile file_excel,
			@RequestParam("file_image") MultipartFile file_image, @RequestParam("name") String name,
			@RequestParam("file_image_question") MultipartFile[] file_image_question,
			@RequestParam("file_listening") MultipartFile[] file_listening) {
		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		BaiThiThu baithithu = new BaiThiThu();
		baithithuService.save(baithithu);

		// System.out.println("id="+baithithu.getBaithithuid());
		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/" + "exam." + baithithu.getBaithithuid()
					+ "." + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));

			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/exam/" + "" + baithithu.getBaithithuid()
					+ "." + file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));

			for (MultipartFile single_image : file_image_question) {
				Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/exam/" + ""
						+ baithithu.getBaithithuid() + "." + single_image.getOriginalFilename());
				single_image.transferTo(new File(pathImageQuestion.toString()));
			}

			for (MultipartFile single_listening : file_listening) {
				Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/exam/" + ""
						+ baithithu.getBaithithuid() + "." + single_listening.getOriginalFilename());
				single_listening.transferTo(new File(pathListening.toString()));
			}

			baithithu.setTenbaithithu(name);
			baithithu.setAnhbaithithu(baithithu.getBaithithuid() + "." + file_image.getOriginalFilename());
			baithithuService.save(baithithu);

			// save data from file excel

			BaiThiThuApi btt = new BaiThiThuApi();
			List<CauHoiBaiThiThu> listCauHoiFull = btt.getListFromExcel(pathExcel.toString(), baithithu);

			for (int i = 0; i < listCauHoiFull.size(); i++) {
				cauhoibaithithuService.save(listCauHoiFull.get(i));
			}

		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("ErrorReadFileExcel:" + e);

		}

		return response;
	}

	@PostMapping(value = "/update")
	@ResponseBody
	public List<String> updateBaiGrammar(@RequestParam("idExam") int id, @RequestParam("name") String name,
			@RequestParam("file_image") MultipartFile file_image,
			@RequestParam("file_image_question") MultipartFile[] file_image_question,
			@RequestParam("file_listening") MultipartFile[] file_listening,
			@RequestParam("file_excel") MultipartFile file_excel) {

		List<String> response = new ArrayList<String>();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		BaiThiThu baithithu = baithithuService.getBaiThiThu(id).get(0);
		try {
			// save file upload to local folder
			Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/" + "exam." + baithithu.getBaithithuid()
					+ "." + file_excel.getOriginalFilename());
			file_excel.transferTo(new File(pathExcel.toString()));

			Path pathImage = Paths.get(rootDirectory + "/resources/file/images/exam/" + "" + baithithu.getBaithithuid()
					+ "." + file_image.getOriginalFilename());
			file_image.transferTo(new File(pathImage.toString()));

			for (MultipartFile single_image : file_image_question) {
				Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/exam/" + ""
						+ baithithu.getBaithithuid() + "." + single_image.getOriginalFilename());
				single_image.transferTo(new File(pathImageQuestion.toString()));
			}

			for (MultipartFile single_listening : file_listening) {
				Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/exam/" + ""
						+ baithithu.getBaithithuid() + "." + single_listening.getOriginalFilename());
				single_listening.transferTo(new File(pathListening.toString()));
			}

			baithithu.setTenbaithithu(name);
			baithithu.setAnhbaithithu(baithithu.getBaithithuid() + "." + file_image.getOriginalFilename());
			baithithuService.save(baithithu);

			BaiThiThuApi btt = new BaiThiThuApi();
			List<CauHoiBaiThiThu> listCauHoiFull = btt.getListFromExcel(pathExcel.toString(), baithithu);

			for (int i = 0; i < listCauHoiFull.size(); i++) {
				cauhoibaithithuService.save(listCauHoiFull.get(i));
			}

		} catch (Exception e) {
			response.add(e.toString());
			System.out.println("errorUpdate:" + e);
		}

		return response;
	}

	// get info Exam ->edit Exam
	@RequestMapping(value = "/infoExam/{idBaiThiThu}")
	public String infoGrammarById(@PathVariable("idBaiThiThu") int id) {
		BaiThiThu baiexam = baithithuService.getBaiThiThu(id).get(0);
		return baiexam.getTenbaithithu();
	}

	public List<CauHoiBaiThiThu> getListFromExcel(String path_file_excel, BaiThiThu baithithu) {
		List<CauHoiBaiThiThu> list = new ArrayList<>();

		try {
			FileInputStream excelFile = new FileInputStream(new File(path_file_excel));
			XSSFWorkbook workbook = new XSSFWorkbook(excelFile);
			XSSFSheet worksheet = workbook.getSheetAt(0);
			for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
				CauHoiBaiThiThu cauhoiexam = new CauHoiBaiThiThu();

				XSSFRow row = worksheet.getRow(i);

				if (row.getCell(0) != null)
					cauhoiexam.setNumber((int) row.getCell(0).getNumericCellValue());

				if (row.getCell(1) != null)
					cauhoiexam.setImage(
							baithithu.getBaithithuid() + "." + row.getCell(1).getStringCellValue().toString());

				if (row.getCell(2) != null)
					cauhoiexam.setAudiomp3(
							baithithu.getBaithithuid() + "." + row.getCell(2).getStringCellValue().toString());

				if (row.getCell(3) != null)
					cauhoiexam.setParagraph(row.getCell(3).getStringCellValue().toString());
				if (row.getCell(4) != null)
					cauhoiexam.setQuestion(row.getCell(4).getStringCellValue().toString());

				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_STRING)
					cauhoiexam.setOption1(row.getCell(5).getStringCellValue().toString());
				if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_NUMERIC)
					cauhoiexam.setOption1(String.valueOf(row.getCell(5).getNumericCellValue()));

				if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_STRING)
					cauhoiexam.setOption2(row.getCell(6).getStringCellValue().toString());
				if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_NUMERIC)
					cauhoiexam.setOption2(String.valueOf(row.getCell(6).getNumericCellValue()));

				if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_STRING)
					cauhoiexam.setOption3(row.getCell(7).getStringCellValue().toString());
				if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_NUMERIC)
					cauhoiexam.setOption3(String.valueOf(row.getCell(7).getNumericCellValue()));

				if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_STRING)
					cauhoiexam.setOption4(row.getCell(8).getStringCellValue().toString());
				if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_NUMERIC)
					cauhoiexam.setOption4(String.valueOf(row.getCell(8).getNumericCellValue()));
				if (row.getCell(9) != null)
					cauhoiexam.setCorrectanswer(row.getCell(9).getStringCellValue().toString());
				cauhoiexam.setBaithithu(baithithu);
				list.add(cauhoiexam);

			}
		} catch (Exception e) {
			System.out.println("errorhere:" + e);
		}

		return list;

	}

}
