package com.sample.shop.client.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sample.shop.model.UserVO;
import com.sample.shop.model.boardVO;
import com.sample.shop.model.cartVO;
import com.sample.shop.model.prodVO;

public interface ClientMapper {

	public List<prodVO> getProdList();
	
	public List<boardVO> getBoardList();
	
	public void boardWrite(boardVO vo);
	
	public boardVO boardDetail(int b_no);
	
	public prodVO getProdDetail(int p_no);

	public void userJoin(UserVO vo);
	
	public List<prodVO> getMainTypeList(String mainType);
	
	public List<prodVO> searchItems(String searchKeyword);
	
	public UserVO userInfo(String u_id);
	
	public void cartInsert(@Param("p_no")int p_no, @Param("u_id")String u_id, @Param("amount")int amount);
	
	public List<cartVO> getCartList(@Param("u_id") String u_id);
	
	public List<prodVO> bestItemList();
	
	public void userInfoUpdate(UserVO vo);
}
