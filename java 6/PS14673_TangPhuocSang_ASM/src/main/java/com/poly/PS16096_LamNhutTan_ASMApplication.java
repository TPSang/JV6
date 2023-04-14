package com.poly;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PS16096_LamNhutTan_ASMApplication {

	public static void main(String[] args) {
		SpringApplication.run(PS16096_LamNhutTan_ASMApplication.class, args);
		Runtime rt = Runtime.getRuntime();
	      try {
	    	  rt.exec("cmd /c start chrome.exe http://localhost:8080/product/list");
	      } catch (IOException e) {
	          e.printStackTrace();
	      }
	}

}
