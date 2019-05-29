package com.webtoeic.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

import com.webtoeic.entities.CauHoiBaiTapDoc;

@Component
public class ExcelUtilDoc {
	
	public List<CauHoiBaiTapDoc> getListCauHoiFromFileExcel(InputStream excelFile) {

		try {
			List<CauHoiBaiTapDoc> listCauHoi = new ArrayList<>();
			Workbook workbook = new XSSFWorkbook(excelFile);

			Sheet datatypeSheet = workbook.getSheetAt(0);

			DataFormatter fmt = new DataFormatter();

			Iterator<Row> iterator = datatypeSheet.iterator();
			Row firstRow = iterator.next();
			Cell firstCell = firstRow.getCell(0);
			System.out.println(firstCell.getStringCellValue());


			while (iterator.hasNext()) {
				Row currentRow = iterator.next();
				CauHoiBaiTapDoc cauHoi = new CauHoiBaiTapDoc();
				cauHoi.setSoThuTu(fmt.formatCellValue(currentRow.getCell(0)));
				cauHoi.setCauHoi((fmt.formatCellValue(currentRow.getCell(1))));
				cauHoi.setDapAn_1(fmt.formatCellValue(currentRow.getCell(2)));
				cauHoi.setDapAn_2(fmt.formatCellValue(currentRow.getCell(3)));
				cauHoi.setDapAn_3(fmt.formatCellValue(currentRow.getCell(4)));
				cauHoi.setDapAn_4(fmt.formatCellValue(currentRow.getCell(5)));
				cauHoi.setDapAnDung(fmt.formatCellValue(currentRow.getCell(6)));
				cauHoi.setGiaiThich(fmt.formatCellValue(currentRow.getCell(7)));
				cauHoi.setParagraph(fmt.formatCellValue(currentRow.getCell(8)));

				System.out.println(cauHoi.toString());
				listCauHoi.add(cauHoi);
			}
			workbook.close();
			return listCauHoi;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
