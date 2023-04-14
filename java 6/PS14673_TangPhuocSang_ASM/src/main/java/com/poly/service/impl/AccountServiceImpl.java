package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired private AccountDAO accDao;

	@Override
	public Account findById(String username) {
		return accDao.findById(username).get();
	}

	@Override
	public List<Account> getAdministrators() {
		return accDao.getAdministrators();
	}

	@Override
	public List<Account> findAll() {
		return accDao.findAll();
	}

	@Override
	public Account create(Account account) {
		return accDao.save(account);
	}

	@Override
	public Account update(Account account) {
		return accDao.save(account);
	}
	/*Summary*/

	@Override
	public Long getTotalAccount() {
		return accDao.count();
	}

	@Override
	public List<Object[]> top10Customer() {
		return accDao.top10Customer();
	}

	
}
