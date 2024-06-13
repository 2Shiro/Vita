package com.vita.oauth.service;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.vita.oauth.domain.CustomOAuth2User;
import com.vita.oauth.domain.GoogleResponse;
import com.vita.oauth.domain.NaverResponse;
import com.vita.oauth.domain.OAuth2Response;
import com.vita.oauth.domain.UserDTO;
import com.vita.oauth.domain.UserVo;
import com.vita.oauth.mapper.UserMapper;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
	 private final UserMapper userMapper;

	    public CustomOAuth2UserService(UserMapper userMapper) {

	        this.userMapper = userMapper;
	    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);

        System.out.println(oAuth2User);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        OAuth2Response oAuth2Response = null;
        if (registrationId.equals("naver")) {

            oAuth2Response = new NaverResponse(oAuth2User.getAttributes());
        }
        else if (registrationId.equals("google")) {

            oAuth2Response = new GoogleResponse(oAuth2User.getAttributes());
        }
        else {

            return null;
        }

        //String oauth_name = oAuth2Response.getProvider()+" "+oAuth2Response.getProviderId();
      //제공자 (Ex. naver, google, ...)
        String getProvider = oAuth2Response.getProvider();
        //제공자에서 발급해주는 아이디(번호)
        String getProviderId = oAuth2Response.getProviderId();
        //이메일
        String getEmail = oAuth2Response.getEmail();
        //사용자 실명 (설정한 이름)
        String getName = oAuth2Response.getName();
        
        System.out.println("여기까지는 되나?");
        UserVo userVo = userMapper.findByUsername(getEmail);
        System.out.println("메퍼에서 에러인가");
        if (userVo == null) {
        	//일반로그인 + oauth 로그인 둘다 없는거임

           UserVo userEntity = new UserVo();
           System.out.println("널이다라고 정상으로 오나?");
           userEntity.setOauth_provider(getProvider);
           //userEntity.setEmail(getEmail);
           userEntity.setName(getName);
           userEntity.setOauth_email(getEmail);
           
           
           
            userMapper.save(userEntity);
            
            // 저장된 사용자 정보를 다시 조회
            userVo = userMapper.findByUsername(getEmail); // 유저아이뒤 가지고오기 위해서
            userVo.setOauth("oauth");
            System.out.println("null이 아닐때 userVo : " + userVo);
            return new CustomOAuth2User(userVo);
        }
        else {
        	//oauth이거나 일반로그인 이거나 둘중에 하나가 있거나 둘다 만들어진게 있는거임
        	//일반로그인이면 update를 해주고
        	if(userVo.getPassword() != null) {
        		System.out.println("일반로그인이 있는거임");
        		userVo.setOauth_provider(getProvider);
        		userVo.setOauth_email(getEmail);
        	    userMapper.updateOauth(userVo);
        		
        	}
        	//oauth회원이면 update를 할 필요가 없음
        	
        	   System.out.println("유저아뒤 oauth로 있을떄 이메일이 일로오나?");
        	userVo.setOauth("oauth");
            return new CustomOAuth2User(userVo);
        }
    }
  }

