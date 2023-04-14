package com.poly.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.service.OrderService;
import com.fasterxml.jackson.core.type.TypeReference;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired private OrderDAO dao;
	@Autowired private OrderDetailDAO ddao;
	@Override
	public Order create(JsonNode orderData) {
		ObjectMapper mapper = new ObjectMapper();
		
		Order order = mapper.convertValue(orderData, Order.class);
		dao.save(order);
		
		TypeReference<List<OrderDetail>> type = new TypeReference<>() {};
		List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type)
				.stream().peek(d->d.setOrder(order)).collect(Collectors.toList());
		ddao.saveAll(details);
		
		return order;
	}
	@Override
	public Order findById(Long id) {
		return dao.findById(id).get();
	}
	
	@Override
	public List<Order> findByUsername(String username) {
		return dao.findByUsername(username);
	}
	/* Summary section */
	
	@Override
	public Long getToDayOrder() {
		return dao.getTodayOrder();
	}
	@Override
	public Long totalOrder() {
		return dao.count();
	}
	@Override
	public List<Object[]> getRevenueLast7Days() {
		return dao.getRevenueLast7Days();
	}
	
}
