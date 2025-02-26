package com.vita.jwt.service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

public class CookieUtil {
	public static void createCookie(HttpServletResponse response, String name, String value, int maxAge, boolean isHttpOnly) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setSecure(true);
        cookie.setPath("/");
        if (isHttpOnly) {
            cookie.setHttpOnly(true);
        }

        // SameSite 속성을 수동으로 설정 strick도 고려해볼것 CSRF보안처리도 할것
        String cookieHeader = String.format("%s=%s; Max-Age=%d; Path=/; Secure; %s; SameSite=Lax", 
                                             name, value, maxAge, isHttpOnly ? "HttpOnly" : "");
        response.addHeader("Set-Cookie", cookieHeader);
    }
}
