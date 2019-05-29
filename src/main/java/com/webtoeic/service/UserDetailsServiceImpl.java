package com.webtoeic.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.entities.VaiTro;
import com.webtoeic.repository.NguoiDungRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private NguoiDungRepository repo;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		NguoiDung nguoiDung = repo.findByEmail(username);
		if (nguoiDung == null) {
			throw new UsernameNotFoundException("User with email " + username + " was not be found");
		}

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		VaiTro vaiTro = nguoiDung.getVaiTro();
		grantedAuthorities.add(new SimpleGrantedAuthority(vaiTro.name()));
		return new User(username, nguoiDung.getPassword(), grantedAuthorities);
	}
}
