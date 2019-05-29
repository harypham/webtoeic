package com.webtoeic.service;

import java.util.List;

import com.webtoeic.entities.BaiThiThu;
import com.webtoeic.entities.CauHoiBaiThiThu;

public interface CauHoiBaiThiThuService {
	 void  save(CauHoiBaiThiThu cauhoibaithithu);
	 
	 List<CauHoiBaiThiThu> getListCauHoi(BaiThiThu baithithu);
}
