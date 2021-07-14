package com.project.zara.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.project.zara.model.MemberVO;

import lombok.Getter;

@Getter

public class MembersMember extends User {
	private static final long serialVersionUID = 4L;

	private MemberVO memberVO;

	public MembersMember(int member_no,String mem_name, String password, Collection<? extends GrantedAuthority> authorities) {
		super(mem_name, password, authorities);
	}

	public MembersMember(MemberVO vo) {

		super(vo.getMem_id(), vo.getMem_password(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.memberVO = vo;
	}
}
