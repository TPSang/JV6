package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.CategoryDAO;
import com.poly.entity.Category;
import com.poly.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired private CategoryDAO cateDao;

	@Override
	public List<Category> findAll() {
		return cateDao.findAll();
	}
}
