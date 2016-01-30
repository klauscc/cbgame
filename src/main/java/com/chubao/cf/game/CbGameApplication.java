package com.chubao.cf.game;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CbGameApplication {

	public static void main(String[] args) {
		SpringApplication.run(CbGameApplication.class, args);
	}
}
//public class CbGameApplication extends SpringBootServletInitializer {
//
//	@Override
//	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//		return application.sources(CbGameApplication.class); }
//	public static void main(String[] args) throws Exception { SpringApplication.run(CbGameApplication.class, args);
//	}
//}
