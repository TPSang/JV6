package com.poly.controller.rest;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Account;
import com.poly.service.AccountService;

@CrossOrigin("*")
@RestController
@RequestMapping("rest")
public class AccountRestController {
	@Autowired private AccountService accountService;
	
	@GetMapping("accounts")
	public List<Account>getAccounts(@RequestParam("admin")Optional <Boolean>admin){
		if(admin.orElse(false)) {
			return accountService.getAdministrators();
		}
		return accountService.findAll();
	}
	
	@PostMapping("accountsManage")
	public Account create(@RequestBody Account account) {
		return accountService.create(account);
	}
	
	@PutMapping("accounts/{id}")
	public Account update(@RequestBody Account account,@PathVariable("id")String username) {
		return accountService.update(account);
	}
}
