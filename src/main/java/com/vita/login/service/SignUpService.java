package com.vita.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vita.login.mapper.LoginMapper;
import com.vita.oauth.domain.SignUpDTO;


import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SignUpService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    
	
	
    public void save( SignUpDTO dto) { //도메인 유저
    	
    	String bCryPasswd = bCryptPasswordEncoder.encode(dto.getPassword());
    	dto.setPassword(bCryPasswd);
    	//oauth로 로그인된 아이뒤가 있는지 체크
    	Boolean isExist = loginMapper.findOAuthEmail(dto);
    	if(Boolean.TRUE.equals(isExist)) {
    		//oauth로는 로그인되어있음 합해야함
    		loginMapper.UpdateSignup(dto);
    	}else {
    		System.out.println("아예 첫유저 로그인중");
    		//아예 첫유저
    		loginMapper.saveSignup(dto);
    		System.out.println("어디서안되노1");
    		Long userId = loginMapper.getMaxUserId();
    		System.out.println("어디서안되노2");
    		dto.setId(userId);
    		System.out.println("어디서안되노3");
    		loginMapper.saveDelivery(dto);
    		System.out.println("어디서안되노4");
    		
    	}
    			
    	
    
        //  dto 안에 있는 data 를 저장하고 
        //  저장된 id return
    }
   
}
