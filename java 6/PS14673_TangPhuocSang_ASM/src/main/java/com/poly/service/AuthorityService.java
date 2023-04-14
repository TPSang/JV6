package com.poly.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.poly.entity.Account;
import com.poly.entity.Authority;


@Service
public interface AuthorityService {
	List<Authority> findAuthoritiesOfAdministrators();

	List<Authority> findAll();

	Authority create(Authority auth);

	void delete(Integer id);

	List<Authority> getOneByRole(String username);

	void deleteByUsername(String username);

	Long getTotalCustomer();

}
