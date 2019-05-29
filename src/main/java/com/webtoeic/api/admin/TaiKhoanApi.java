package com.webtoeic.api.admin;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.webtoeic.dto.ResponseObject;
import com.webtoeic.dto.TaiKhoanDto;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.entities.VaiTro;
import com.webtoeic.service.NguoiDungService;

@RestController
@RequestMapping("/api/admin/tai-khoan")
public class TaiKhoanApi {

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("/all")
	public Page<NguoiDung> getNguoiDungByVaiTro(@RequestParam("vaiTro") int vaiTroValue, @RequestParam(defaultValue = "1") int page) {
		return nguoiDungService.findByVaiTro(page, VaiTro.findByAbbr(vaiTroValue));
	}

	@PostMapping("/save")
	public ResponseObject saveTaiKhoan(@RequestBody @Valid TaiKhoanDto dto, BindingResult result, Model model) {
		ResponseObject ro = new ResponseObject();

		if (nguoiDungService.findByEmail(dto.getEmail()) != null) {
			result.rejectValue("email", "error.email", "Email đã được đăng ký");
		}
		if (!dto.getConfirmPassword().equals(dto.getPassword())) {
			result.rejectValue("confirmPassword", "error.confirmPassword", "Nhắc lại mật khẩu không đúng");
		}

		if (result.hasErrors()) {
			setErrorsForResponseObject(result, ro);
		} else {
			ro.setStatus("success");
			NguoiDung nd = new NguoiDung();
			nd.setHoTen(dto.getHoTen());
			nd.setDiaChi(dto.getDiaChi());
			nd.setEmail(dto.getEmail());
			nd.setSoDienThoai(dto.getSdt());
			nd.setPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
			nd.setVaiTro(VaiTro.findByAbbr(dto.getVaiTro()));
			nguoiDungService.saveUser(nd);
		}
		return ro;
	}

	@DeleteMapping("/delete/{id}")
	public void deleteTaiKhoan(@PathVariable long id) {
		nguoiDungService.deleteById(id);
	}

	public void setErrorsForResponseObject(BindingResult result, ResponseObject object) {
		Map<String, String> errors = result.getFieldErrors().stream().collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage));
		object.setErrorMessages(errors);
		object.setStatus("fail");
		List<String> keys = new ArrayList<String>(errors.keySet());
		errors = null;
	}
}
