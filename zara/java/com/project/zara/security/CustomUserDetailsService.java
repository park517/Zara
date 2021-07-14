package com.project.zara.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.project.zara.mapper.MemberMapper;
import com.project.zara.model.MemberVO;
import com.project.zara.security.domain.MembersMember;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + userName);

		// userName means userid
		MemberVO vo = memberMapper.getMember(userName);

		log.warn("queried by member mapper: " + vo);
		
    	return vo == null ? null : new MembersMember(vo);

	} 

}
