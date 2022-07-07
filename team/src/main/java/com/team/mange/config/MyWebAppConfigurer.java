package com.team.mange.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MyWebAppConfigurer  implements WebMvcConfigurer {

//    /**
//     * 资源映射路径
//     */
//    @Value("${upload.filePath}")
//    private String filePath;
//
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/file/**").addResourceLocations("file:"+filePath);
//    }


}
