package com.chubao.cf.game;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class CbGameApplication {

	public static void main(String[] args) {
		SpringApplication.run(CbGameApplication.class, args);
	}
}
