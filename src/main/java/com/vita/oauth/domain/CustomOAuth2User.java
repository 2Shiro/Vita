package com.vita.oauth.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class CustomOAuth2User implements OAuth2User {

    private final UserVo userVo;

    public CustomOAuth2User(UserVo userVo) {

        this.userVo = userVo;
        System.out.println("CustomOAuth2User 생성자 - userVo: " + userVo);
    
    }

    @Override
    public Map<String, Object> getAttributes() {

        return null;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection<GrantedAuthority> collection = new ArrayList<>();

        collection.add(new GrantedAuthority() {

            @Override
            public String getAuthority() {

                return userVo.getRole();
            }
        });

        return collection;
    }

    @Override
    public String getName() {

        return userVo.getName();
    }

    public String getOAuthEmail() {

        return userVo.getOauth_email(); // 프로바이드네임으로 할지 고민중
    }
    public Long getUserId() {
    	return userVo.getId();
    }
}
