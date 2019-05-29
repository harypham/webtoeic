package com.webtoeic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.NguoiDungService;

@SpringBootApplication
@ControllerAdvice
public class WebToeicApplication {

	@Autowired
	private NguoiDungService nguoiDungService;

	public static void main(String[] args) {
		SpringApplication.run(WebToeicApplication.class, args);
	}

	@ModelAttribute("loggedInUser")
	public NguoiDung loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return nguoiDungService.findByEmail(auth.getName());
	}

}
