package com.sample.shop.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
		mapper.userJoin(vo);
	}
	
	public List<prodVO> getMainTypeList(String mainType) {
		return mapper.getMainTypeList(mainType);
	}
	
	public List<prodVO> searchItems(String searchKeyword) {
		return mapper.searchItems(searchKeyword);
	}
	
	public UserVO userInfo(String u_id) {
		return mapper.userInfo(u_id);
	}
	
	public void cartInsert(String u_id, int p_no) {
		System.out.println("service p_no : " + p_no);
		//UserVO vo = mapper.userInfo(u_id);
		int u_no = 3;
		System.out.println("service u_no : " + u_no);
		
		mapper.cartInsert(3, u_no);
	}
	
	public List<prodVO> bestItemList() {
		List<prodVO> list = mapper.bestItemList();
		System.out.println("bestItem list size : " + list.size());
		return mapper.bestItemList();
	}
	

}
