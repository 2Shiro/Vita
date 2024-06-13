package com.vita.oauth.mapper;



import org.apache.ibatis.annotations.Mapper;

import com.vita.oauth.domain.UserVo;

@Mapper
public interface UserMapper {

	UserVo findByUsername(String oauth_name);

	void save(UserVo userVo);

	void updateOauth(UserVo userVo);

}
