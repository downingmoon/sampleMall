package com.sample.shop.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sample.shop.client.dao.ClientMapper;
import com.sample.shop.model.UserVO;
import com.sample.shop.model.prodVO;

@Service
public class ClientService {
	
	@Autowired
	private ClientMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder bpe;
	
	public List<prodVO> getProdList() {
		return mapper.getProdList();
	}
	
	public prodVO getProdDetail(int p_no) {
		return mapper.getProdDetail(p_no);
	}
	
	public void userJoin(UserVO vo) {
		String cryptoPw = bpe.encode(vo.getU_pw());
		vo.setU_pw(cryptoPw);
		System.out.println("cryptoPW : " + cryptoPw);
		mapper.userJoin(vo);
	}
	

}
