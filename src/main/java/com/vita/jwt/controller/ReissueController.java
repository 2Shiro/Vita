package com.vita.jwt.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vita.oauth.jwt.JWTUtil;

import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class ReissueController {

	private final JWTUtil jwtUtil;

    public ReissueController(JWTUtil jwtUtil) {

        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/reissue")
    public ResponseEntity<?> reissue(HttpServletRequest request, HttpServletResponse response) {
    	System.out.println("리이슈로 도착");

        //get refresh token
        String refresh = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {

            if (cookie.getName().equals("refresh")) {

                refresh = cookie.getValue();
            }
        }

        if (refresh == null) {

            //response status code
            return new ResponseEntity<>("refresh token null", HttpStatus.BAD_REQUEST);
        }

        //expired check
        try {
            jwtUtil.isExpired(refresh);
        } catch (ExpiredJwtException e) {

            //response status code
            return new ResponseEntity<>("refresh token expired", HttpStatus.BAD_REQUEST);
        }

        // 토큰이 refresh인지 확인 (발급시 페이로드에 명시)
        String category = jwtUtil.getCategory(refresh);

        if (!category.equals("refresh")) {

            //response status code
            return new ResponseEntity<>("invalid refresh token", HttpStatus.BAD_REQUEST);
        }

        String username = jwtUtil.getUserEmail(refresh);
        String role = jwtUtil.getRole(refresh);
        Long userId = jwtUtil.getUserId(refresh);
        String name = jwtUtil.getName(refresh);
        String oauth = jwtUtil.getOauth(refresh);
        System.out.println("밑에 까지 내려옴 reisue");
        //make new JWT
        String newAccess = jwtUtil.createJwt("access", username, role, 600000L, userId, name, oauth);

        //response
        response.setHeader("access", newAccess);

        return new ResponseEntity<>(HttpStatus.OK);
    }
}
