package com.sample.shop.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.shop.client.dao.ClientMapper;

@Service
public class AdminService {
	
	@Autowired
	private ClientMapper mapper;

}
