package com.vita.jwt.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.vita.login.mapper.LoginMapper;
import com.vita.oauth.domain.UserVo;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final LoginMapper loginMapper;

    public CustomUserDetailsService(LoginMapper loginMapper) {

        this.loginMapper = loginMapper;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
				
				//DB에서 조회
        UserVo userVo = loginMapper.findByUsername(email);
        userVo.setOauth("common");

        if (userVo != null) {
						
						//UserDetails에 담아서 return하면 AutneticationManager가 검증 함
            return new CustomUserDetails(userVo);
        }

       
        return null;
    }
}
