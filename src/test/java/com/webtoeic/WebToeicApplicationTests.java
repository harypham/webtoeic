package com.webtoeic;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

import com.webtoeic.entities.BaiTapNghe;
import com.webtoeic.entities.CauHoiBaiTapNghe;
import com.webtoeic.repository.BaiTapNgheRepository;
import com.webtoeic.repository.NguoiDungRepository;
import com.webtoeic.util.ExcelUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WebToeicApplicationTests {

	@Autowired
	NguoiDungRepository nguoIDungRepo;
	
	@Autowired
	BaiTapNgheRepository repo;

	@Autowired
	ExcelUtil excelUtil;

	@Test
	public void contextLoads() {
	}

	@Test
	public void tesReadExcel() throws FileNotFoundException {
		Page<BaiTapNghe> page = repo.findByPartAndDoKho(1, 1, PageRequest.of(0,2));
		System.out.println(page.getNumberOfElements());
	}

}
