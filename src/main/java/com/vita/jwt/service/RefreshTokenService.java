package com.vita.jwt.service;



import java.time.Instant;

import org.springframework.stereotype.Service;

import com.vita.oauth.domain.RefreshDTO;
import com.vita.oauth.mapper.RefreshMapper;

@Service
public class RefreshTokenService {

	private final RefreshMapper refreshMapper;
	public RefreshTokenService(RefreshMapper refreshMapper) {
		this.refreshMapper = refreshMapper;
	}
	
	
	public Boolean existsByRefresh(String refresh) {
		return refreshMapper.existsByRefresh(refresh);
	}
	public void deleteByRefresh(String refresh) {
		 refreshMapper.deleteByRefresh(refresh);
	}
	
	
	public void invalidateOldTokens(Long id) {
		refreshMapper.invalidateOldTokens(id);
	}
	public void saveRefrechToken(RefreshDTO refreshDTO) {
		refreshMapper.save(refreshDTO);
		
	}
	public RefreshDTO findByToken(String token) {
        return refreshMapper.findByToken(token);
    }
	
	 public void saveNewToken(String username, String refreshToken, Long userId) {
	 RefreshDTO token = new RefreshDTO(); token.setUsername(username);
	  token.setRefresh(refreshToken); token.setId(userId);
	  token.setExpiration(Instant.now().plusMillis(86400000L).toString()); // 1일
	  token.setValid(true); // 유효성 플래그 설정 refreshMapper.saveNewToken(token); 
	 
	 }
	
	
}
