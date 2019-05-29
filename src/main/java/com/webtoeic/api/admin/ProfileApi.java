package com.webtoeic.api.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webtoeic.dto.PasswordDTO;
import com.webtoeic.dto.ResponseObject;
import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.NguoiDungService;

@RestController
@RequestMapping("/api/admin/profile")
public class ProfileApi {

	@Autowired
	private NguoiDungService nguoiDungService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/{id}")
	public NguoiDung getNguoiDungById(@PathVariable long id) {
		NguoiDung nd = nguoiDungService.findById(id);
		return nd;
	}

	@PostMapping("/doiMatKhau")
	public ResponseObject changePass(@RequestBody @Valid PasswordDTO dto, BindingResult result, HttpServletRequest request) {
		NguoiDung currentUser = getSessionUser(request);
		ResponseObject ro = new ResponseObject();
		if (!passwordEncoder.matches(dto.getOldPassword(), currentUser.getPassword())) {
			result.rejectValue("oldPassword", "error.oldPassword", "Mật khẩu cũ không đúng");
		}
		if (!dto.getNewPassword().equals(dto.getConfirmNewPassword())) {
			result.rejectValue("confirmNewPassword", "error.confirmNewPassword", "Nhắc lại mật khẩu mới không đúng");
		}
		if (result.hasErrors()) {
			Map<String, String> errors = new HashMap<>();
			List<FieldError> errorsList = result.getFieldErrors();
			for (FieldError error : errorsList) {
				errors.put(error.getField(), error.getDefaultMessage());
			}
			ro.setErrorMessages(errors);
			ro.setStatus("fail");
			errors = null;
		} else {
			nguoiDungService.changePass(currentUser, dto.getNewPassword());
			ro.setStatus("success");
		}
		return ro;
	}

	public NguoiDung getSessionUser(HttpServletRequest request) {
		return (NguoiDung) request.getSession().getAttribute("loggedInUser");
	}
}
