package com.poly.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.entity.Order;


@Service
public interface OrderService {
	Order create(JsonNode orderData);

	Order findById(Long id);

	List<Order> findByUsername(String username);

	Long getToDayOrder();

	Long totalOrder();

	List<Object[]> getRevenueLast7Days();
}
