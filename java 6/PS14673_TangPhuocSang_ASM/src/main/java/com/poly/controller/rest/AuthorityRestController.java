package com.poly.controller.rest;

import java.io.File;
import java.util.List;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.poly.entity.Account;
import com.poly.entity.Authority;
import com.poly.service.AccountService;
import com.poly.service.AuthorityService;
import com.poly.service.UploadService;

@CrossOrigin("*")
@RestController
@RequestMapping("rest")
public class AuthorityRestController {
	@Autowired private AuthorityService authService;
	
	@GetMapping("authorities")
	public List<Authority> findAll(@RequestParam("admin")Optional <Boolean> admin){
		if(admin.orElse(false)) {
			return authService.findAuthoritiesOfAdministrators();
		}
		return authService.findAll();
	}
	
	@GetMapping("authoritiesOne")
	public List<Authority> getOneByRole(@RequestParam("username")String username){
		return authService.getOneByRole(username);
	}
	
	
	@PostMapping("authorities")
	public Authority post(@RequestBody Authority auth) {
		return authService.create(auth);
	}
	
	@DeleteMapping("authorities/{id}")
	public void delete(@PathVariable("id") Integer id) {
		authService.delete(id);
	}
	
	@DeleteMapping("authoritiesOne/{username}")
	public void deleteByUsername(@PathVariable("username") String username) {
		System.out.println("username del: "+username);
		authService.deleteByUsername(username);
	}
	
}
 