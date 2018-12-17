package com.sample.shop.admin.dao;

import java.util.List;

import com.sample.shop.model.prodVO;

public interface AdminMapper {
	
	public List<prodVO> prodListView();
	
	public void prodMod(prodVO vo);
	
	public prodVO prodModList(int p_no);

}
