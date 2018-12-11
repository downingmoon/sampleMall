package com.sample.shop.client.dao;

import java.util.List;

import com.sample.shop.model.UserVO;
import com.sample.shop.model.prodVO;

public interface ClientMapper {

	public List<prodVO> getProdList();
	
	public prodVO getProdDetail(int p_no);

	public void userJoin(UserVO vo);
	
	public List<prodVO> getMainTypeList(String mainType);
}
