package com.vita.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/board/**")
                .addResourceLocations("file:src/main/resources/static/board/")
                .setCachePeriod(0);  // 캐시를 사용하지 않도록 설정
    }
}
