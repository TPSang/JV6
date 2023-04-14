package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.Account;

@Repository
public interface AccountDAO extends JpaRepository<Account, String>{
	
	@Query("Select Distinct ar.account From Authority ar where ar.role.id IN ('DIRE','STAF')")
	List<Account> getAdministrators();

	@Query(value="Select a.Username, a.Fullname, a.email, a.photo, "
			+ "sum(odt.price * odt.quantity) as totalPayment "
			+ "From Accounts a inner join orders o on a.Username = o.Username "
			+ "inner join OrderDetails odt on o.Id = odt.OrderId "
			+ "Group by a.Username, a.Fullname, a.email, a.photo "
			+ "order by totalPayment desc",nativeQuery = true)
	List<Object[]> top10Customer();
}
