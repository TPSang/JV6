package com.poly.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.entity.Category;
import com.poly.service.CategoryService;

@CrossOrigin("*")
@RestController
@RequestMapping("rest/categories")
public class CategoryRestController {
	@Autowired private CategoryService cateService;
	
	@GetMapping()
	public List<Category> findAll() {
		return cateService.findAll();
	}
}
