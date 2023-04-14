package com.poly.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Role;
import com.poly.service.RoleService;

@CrossOrigin("*")
@RestController
@RequestMapping("rest/roles")
public class RoleRestController {
	@Autowired private RoleService roleService;
	
	@GetMapping
	public List<Role>getAll(){
		return roleService.findAll();
	}
}
