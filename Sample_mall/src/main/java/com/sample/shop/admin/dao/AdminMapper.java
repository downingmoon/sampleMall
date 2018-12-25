package com.sample.shop.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sample.shop.model.prodVO;

public interface AdminMapper {
	
	public List<prodVO> prodListView();
	
	public void prodMod(prodVO vo);
	
	public prodVO prodModList(int p_no);
	
	public int getMaxProdNo();
	
	public void prodInsert(prodVO vo);
	
	public void prodImgInsert(prodVO vo);
	
	public void prodDelete(int p_no);
	
	public void prodImgDelete(int p_no);
	
	public void prodImport(@Param("p_no")int p_no,@Param("stock")int stock);
	
	public void mainImageUpload(@Param("m_no")int m_no, @Param("m_imgname")String m_imgname);
	
	public int getImageNo();

}
