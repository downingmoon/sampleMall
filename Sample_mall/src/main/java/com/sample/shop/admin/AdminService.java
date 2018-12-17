package com.sample.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.shop.admin.dao.AdminMapper;
import com.sample.shop.model.prodVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public List<prodVO> prodListView() {
		return mapper.prodListView();
	}
	
	public void prodMod(prodVO vo) {
		mapper.prodMod(vo);
	}
	
	public prodVO prodModList(int p_no) {
		return mapper.prodModList(p_no);
	}

}
