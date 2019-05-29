package com.webtoeic.api.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.webtoeic.entities.BaiTapDoc;
import com.webtoeic.service.BaiTapDocService;

@RestController
@RequestMapping("/api/admin/bai-doc")
public class BaiTapDocApi {
	
	@Autowired
	private BaiTapDocService baiDocService;
	
	@GetMapping("/all")
	public ResponseEntity<Page<BaiTapDoc>> findAllByPartAndDoKho(@RequestParam(defaultValue ="1") int page,
			@RequestParam(defaultValue="") String part, @RequestParam(defaultValue="") String doKho ){
		return new ResponseEntity<>(baiDocService.findAllListBaiTapDocByPartAndDoKhoAdmin(page, 2, part, doKho), HttpStatus.OK);
	}

	@GetMapping("/{id}")
	public ResponseEntity<BaiTapDoc> findById(@PathVariable long id) {
		Optional<BaiTapDoc> bn = baiDocService.findBaiTapDocById(id);
		return bn.isPresent() ? new ResponseEntity<>(bn.get(), HttpStatus.OK): new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}

	@PostMapping(value = "/save")
	public ResponseEntity<?> saveBaiDoc(@ModelAttribute BaiTapDoc baiDocInfor, HttpServletRequest request) {
		try {
			System.out.println(baiDocInfor.toString());
			BaiTapDoc baiDoc = baiDocService.saveBaiTapDoc(baiDocInfor, request);
			saveFileForBaiDoc(baiDoc, request);
			return new ResponseEntity<>(HttpStatus.CREATED);
		} catch (IllegalStateException | IOException e) {
			System.out.println("vao day");
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteById(@PathVariable long id) {
		baiDocService.deleteBaiTapDoc(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	// lưu ảnh của bài đọc vào thư mục
	private void saveFileForBaiDoc(BaiTapDoc bn, HttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartFile fileImage = bn.getPhotoBaiDoc();
		MultipartFile fileExcel = bn.getFileExcelCauHoi();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		Path pathImage = Paths.get(rootDirectory + "/resources/file/images/baiDocId=" + bn.getId() + ".png");
		Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/baiDocId=" + bn.getId() + ".xlsx");
		fileImage.transferTo(new File(pathImage.toString()));
		fileExcel.transferTo(new File(pathExcel.toString()));

	}


}
