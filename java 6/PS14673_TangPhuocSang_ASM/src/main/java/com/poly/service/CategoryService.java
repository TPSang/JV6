package com.poly.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poly.entity.Category;

@Service
public interface CategoryService {

	List<Category> findAll();

}
