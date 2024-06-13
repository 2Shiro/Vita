package com.vita.oauth.jwt;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;

@Component
public class JWTUtil {

    private SecretKey secretKey;

    public JWTUtil(@Value("${spring.jwt.secret}")String secret) {


        secretKey = new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8),Jwts.SIG.HS256.key().build().getAlgorithm());
        System.out.println("secretKey" +secretKey);
    }

    public String getUserEmail(String token) {

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("userEmail", String.class);
    }
    public String getName(String token) {

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("name", String.class);
    }

    public String getRole(String token) {

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("role", String.class);
    }
    
    public String getCategory(String token) {
    	return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("category", String.class);
    }

    public Boolean isExpired(String token) {

        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().getExpiration().before(new Date());
    }
    public Long getUserId(String token) {
        return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("userId", Long.class);
    }
    public String createJwt(String category, String userEmail, String role, Long expiredMs, Long userId, String name) {
    	

    	String jwt = Jwts.builder()
    			.claim("category", category)
    			 .claim("userEmail", userEmail)
    			 .claim("role", role)
    			 .claim("userId", userId)
    			 .claim("name", name)
    			 .issuedAt(new Date(System.currentTimeMillis()))
    			 .expiration(new Date(System.currentTimeMillis() + expiredMs))
    			 .signWith(secretKey)
    			 .compact();

    
    	    return jwt.trim();
//        return Jwts.builder()
//        		.claim("category", category)
//                .claim("username", username)
//                .claim("role", role)
//                .claim("userId", userId)
//                .issuedAt(new Date(System.currentTimeMillis()))
//                .expiration(new Date(System.currentTimeMillis() + expiredMs))
//                .signWith(secretKey)
//                .compact();
    }
    
}