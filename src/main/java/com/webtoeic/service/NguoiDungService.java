package com.webtoeic.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.webtoeic.entities.NguoiDung;
import com.webtoeic.entities.VaiTro;
import com.webtoeic.repository.NguoiDungRepository;

@Service
@Transactional
public class NguoiDungService {

	@Autowired
	private NguoiDungRepository nguoiDungRepo;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public NguoiDung findByEmail(String email) {
		return nguoiDungRepo.findByEmail(email);
	}

	public NguoiDung findByConfirmationToken(String confirmationToken) {
		return null;
	}

	public NguoiDung saveUser(NguoiDung nd) {
		nd.setPassword(bCryptPasswordEncoder.encode(nd.getPassword()));
		return nguoiDungRepo.save(nd);
	}

	public NguoiDung findById(long id) {
		NguoiDung nd = nguoiDungRepo.findById(id).get();
		return nd;
	}

	public NguoiDung updateUser(NguoiDung nd) {
		return nguoiDungRepo.save(nd);
	}

	public void changePass(NguoiDung nd, String newPass) {
		nd.setPassword(bCryptPasswordEncoder.encode(newPass));
		nguoiDungRepo.save(nd);
	}

	public Page<NguoiDung> findByVaiTro(int page, VaiTro vaiTro) {
		return nguoiDungRepo.findByVaiTro(vaiTro, PageRequest.of(page - 1, 6));
	}

	public void deleteById(long id) {
		nguoiDungRepo.deleteById(id);
	}
}
