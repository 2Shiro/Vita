package com.vita.jwt.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.vita.oauth.domain.UserVo;

public class CustomUserDetails implements UserDetails {

    private final UserVo UserVo;

    public CustomUserDetails(UserVo UserVo) {

        this.UserVo = UserVo;
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection<GrantedAuthority> collection = new ArrayList<>();

        collection.add(new GrantedAuthority() {

            @Override
            public String getAuthority() {

                return UserVo.getRole();
            }
        });

        return collection;
    }

    @Override
    public String getPassword() {

        return UserVo.getPassword();
    }

    @Override
    public String getUsername() {

        return UserVo.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {

        return true;
    }

    @Override
    public boolean isAccountNonLocked() {

        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {

        return true;
    }

    @Override
    public boolean isEnabled() {

        return true;
    }
    public Long getId() {

        return UserVo.getId();
    }
    public String getName() {

        return UserVo.getName();
    }
    public String getOauth() {
    	return UserVo.getOauth();
    }
}