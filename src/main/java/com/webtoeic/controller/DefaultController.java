package com.webtoeic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.service.NguoiDungService;

@ControllerAdvice
public class DefaultController {

	@Autowired
	private NguoiDungService nguoiDungService;

	@ModelAttribute
	public void load(Model model, @AuthenticationPrincipal Object user) {
		if (user != null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			NguoiDung nguoiDung;
			if (auth.getClass().isAssignableFrom(OAuth2AuthenticationToken.class)) {
				nguoiDung = new NguoiDung();
				String principal = auth.getPrincipal().toString();
				String[] part = principal.split(",");
				String name = part[2].split("=")[1];
				nguoiDung.setHoTen(name);
				nguoiDung.setLoginOauth2(true);
			} else {
				nguoiDung = nguoiDungService.findByEmail(auth.getName());
			}
			model.addAttribute("nguoiDung", nguoiDung );
		}

	}
}
