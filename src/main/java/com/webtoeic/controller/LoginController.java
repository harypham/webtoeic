package com.webtoeic.controller;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestRedirectFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.webtoeic.config.Registration;

@Controller
public class LoginController {

	private final InMemoryClientRegistrationRepository clientRegistrationRepository;

	public LoginController(InMemoryClientRegistrationRepository clientRegistrationRepository) {
		this.clientRegistrationRepository = clientRegistrationRepository;
	}

	@GetMapping("/signin")
	public String loginPage(Model model) {
		return "dangNhap";
	}
	
	@GetMapping("/login")
	public String loginPageForward(Model model) {
		return "redirect:/signin?accessDenied";
	}

}
