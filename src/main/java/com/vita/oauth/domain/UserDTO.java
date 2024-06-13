package com.vita.oauth.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class UserDTO {

    private String role;
    private String name;
    private String username;
    private Long userId;
}
