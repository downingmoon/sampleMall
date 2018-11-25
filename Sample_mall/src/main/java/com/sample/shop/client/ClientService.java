package com.sample.shop.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.shop.client.dao.ClientMapper;
import com.sample.shop.model.prodVO;

@Service
public class ClientService {
	
	@Autowired
	private ClientMapper mapper;
	
	public List<prodVO> getProdList() {
		return mapper.getProdList();
	}
	

}
