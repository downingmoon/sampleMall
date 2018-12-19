package com.sample.shop.client.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sample.shop.model.UserVO;
import com.sample.shop.model.prodVO;

public interface ClientMapper {

	public List<prodVO> getProdList();
	
	public prodVO getProdDetail(int p_no);

	public void userJoin(UserVO vo);
	
	public List<prodVO> getMainTypeList(String mainType);
	
	public List<prodVO> searchItems(String searchKeyword);
	
	public UserVO userInfo(String u_id);
	
	public void cartInsert(@Param("p_no")int p_no, @Param("u_no")int u_no);
	
	public List<prodVO> bestItemList();
}
