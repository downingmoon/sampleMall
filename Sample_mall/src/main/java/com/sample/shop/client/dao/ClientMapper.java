
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
import com.sun.org.glassfish.gmbal.ParameterNames;

public interface ClientMapper {
	
	/*
	 * Public 
	 */
	public int getBoardPageCount();
	public int getUserNo(@Param("u_id")String u_id);
	
	
	/*
	 *  Product
	 */
	public List<prodVO> getProdListNew();
	public List<prodVO> detailTypeList(String type);
	public List<prodVO> getProdList();
	public List<prodVO> getMainTypeList(String mainType);
	public prodVO getProdDetail(int p_no);
	public List<prodVO> bestItemList();
	
	
	/*
	 *  Search
	 */
	public List<prodVO> detailSearch(@Param("searchKeyword")String searchKeyword, @Param("mainCategory")String mainCategory, @Param("subCategory")String subCategory);
	public List<prodVO> searchItems(String searchKeyword);
	
	
	/*
	 *  Image
	 */
	public List<mainImgVO> getMainImages();
	public List<prodVO> getDetailImage(int p_no);
	
	/*
	 *  Board
	 */
	public List<boardVO> getBoardList(@Param("page")int page, @Param("endpage")int endpage);
	public void boardWrite(boardVO vo);
	public boardVO boardDetail(int b_no);
	

	/*
	 *  User
	 */
	public void userJoin(UserVO vo);
	public UserVO userInfo(String u_id);
	public void userInfoUpdate(UserVO vo);
	public void userInfoUpdateWithPw(UserVO vo);
	public String idCheckAjax(String u_id);
	public String findId(@Param("u_name")String u_name, @Param("u_phone")String u_phone);
	public String findPwQnA(String u_id);
	public String pwAnswerChk(@Param("u_id")String u_id, @Param("answer")String answer);
	public void pwChange(@Param("u_pw")String u_pw, @Param("u_no")int u_no);
	public String getPasswordById(String u_id);
	
	
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
	public List<purchaseVO> getPurchaseInfo(@Param("b_no")String b_no, @Param("b_u_no")int b_u_no);
	public void doMinusStock(@Param("stock")int stock, @Param("p_no")int p_no);
	public void doAddSaleCount(@Param("amount")int amount, @Param("p_no")int p_no);
	public String getProductPrice(int p_no);
	public int getAmount(@Param("u_no") int u_no, @Param("p_no") int p_no);
	
	
	/*
	 *  OrderList
	 */
	public int getPnameCoutFromBuy(String b_no);
	public List<purchaseVO> getPurchaseList(int u_no);
	public List<purchaseVO> anonymousOrderDetail(String b_no);
	public String getPayTotal(String b_no);
	
	
	/*
	 * One to One Inquire
	 */
	public void otoInquireReg(inqVO vo);
	public List<inqVO> otoInquireList(int u_no);
	public inqVO otoDetail(@Param("i_no")int i_no, @Param("i_u_no")int i_u_no);
}
