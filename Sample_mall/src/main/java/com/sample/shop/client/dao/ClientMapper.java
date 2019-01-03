
package com.sample.shop.client.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sample.shop.model.UserVO;
import com.sample.shop.model.boardVO;
import com.sample.shop.model.cartVO;
import com.sample.shop.model.delVO;
import com.sample.shop.model.inqVO;
import com.sample.shop.model.mainImgVO;
import com.sample.shop.model.prodVO;
import com.sample.shop.model.purchaseVO;
import com.sample.shop.model.wishVO;

public interface ClientMapper {
	
	/*
	 * Public 
	 */
	public int getUserNo(@Param("u_id")String u_id);
	
	
	/*
	 *  Product
	 */
	public List<prodVO> getProdListNew();
	public List<prodVO> detailTypeList(String type);
	public List<prodVO> getProdList();
	public List<prodVO> getMainTypeList(String mainType);
	public List<prodVO> searchItems(String searchKeyword);
	public prodVO getProdDetail(int p_no);
	public List<prodVO> bestItemList();
	
	/*
	 *  Image
	 */
	public List<mainImgVO> getMainImages();
	public List<prodVO> getDetailImage(int p_no);
	
	/*
	 *  Board
	 */
	public List<boardVO> getBoardList();
	public void boardWrite(boardVO vo);
	public boardVO boardDetail(int b_no);
	

	/*
	 *  User
	 */
	public void userJoin(UserVO vo);
	public UserVO userInfo(String u_id);
	public void userInfoUpdate(UserVO vo);
	
	
	/*
	 *  Cart
	 */
	public void cartAmountUpdate(@Param("amount")int amount, @Param("u_no")int u_no, @Param("p_no")int p_no);
	public void cartInsert(@Param("p_no")int p_no, @Param("u_id")String u_id, @Param("amount")int amount);
	public void cartDelete(@Param("c_no")int c_no, @Param("u_no")int u_no);
	public int cartCount(int u_no);
	public List<cartVO> getCartList(@Param("u_no") int u_no);
	
	
	/*
	 * Wish List
	 */
	public int wishExistChk(@Param("u_no")int u_no, @Param("p_no")int p_no);
	public List<wishVO> wishListView(int u_no);
	public void wishInsert(@Param("u_id")String u_id, @Param("p_no")int p_no);
	public void wishDelete(@Param("w_no")int w_no, @Param("u_no")int u_no);
	public Integer isExist(@Param("p_no")int p_no, @Param("u_no")int u_no);
	
	
	/*
	 * Buy Product
	 */
	public void buyProduct(purchaseVO vo);
	public void insertToDelivery(delVO vo);
	public purchaseVO getPurchaseInfo(@Param("b_no")String b_no, @Param("b_u_no")int b_u_no);
	public List<purchaseVO> getPurchaseList(int u_no);
	public void doMinusStock(@Param("stock")int stock, @Param("p_no")int p_no);
	public void doAddSaleCount(@Param("amount")int amount, @Param("p_no")int p_no);
	
	
	/*
	 * One to One Inquire
	 */
	public void otoInquireReg(inqVO vo);
	public List<inqVO> otoInquireList(int u_no);
}
