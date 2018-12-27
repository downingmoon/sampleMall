package com.sample.shop.client;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sample.shop.client.dao.ClientMapper;
import com.sample.shop.model.UserVO;
import com.sample.shop.model.boardVO;
import com.sample.shop.model.cartVO;
import com.sample.shop.model.mainImgVO;
import com.sample.shop.model.prodVO;
import com.sample.shop.model.purchaseVO;

@Service
public class ClientService {
	
	@Autowired
	private ClientMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder bpe;
	
	public List<prodVO> getProdListNew() {
		return mapper.getProdListNew();
	}
	
	public List<mainImgVO> getMainImages() {
		return mapper.getMainImages();
	}
	
	public List<prodVO> getProdList() {
		return mapper.getProdList();
	}
	
	public List<boardVO> getBoardList() {
		return mapper.getBoardList();
	}
	
	public void boardWrite(boardVO vo) {
		mapper.boardWrite(vo);
	}
	
	public boardVO boardDetail(int b_no) {
		return mapper.boardDetail(b_no);
	}
	
	public prodVO getProdDetail(int p_no) {
		return mapper.getProdDetail(p_no);
	}
	
	public List<prodVO> getDetailImage(int p_no) {
		return mapper.getDetailImage(p_no);
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
	
	//User Id로 User Number 구해오는것.
	public int getUserNo(String u_id) {
		return mapper.getUserNo(u_id);
	}
	
	public UserVO userInfo(String u_id) {
		return mapper.userInfo(u_id);
	}
	
	public void userInfoUpdate(UserVO vo) {
		mapper.userInfoUpdate(vo);
	}
	
	public void cartInsert(int p_no, String u_id, int amount) {
		mapper.cartInsert(p_no, u_id, amount);
	}
	
	public void cartDelete(int c_no, String u_id) {
		System.out.println("c_no : " + c_no);
		System.out.println("u_id : " + u_id);
		int u_no = mapper.getUserNo(u_id);
		mapper.cartDelete(c_no, u_no);
	}
	
	public int cartCount(String u_id) {
		int u_no = mapper.getUserNo(u_id);
		return mapper.cartCount(u_no);
	}
	
	public List<cartVO> getCartList(String u_id) {
		return mapper.getCartList(u_id);
	}
	
	public List<prodVO> bestItemList() {
		List<prodVO> list = mapper.bestItemList();
		System.out.println("bestItem list size : " + list.size());
		return mapper.bestItemList();
	}
	
	public void wishInsert(String u_id, int p_no) {
		mapper.wishInsert(u_id, p_no);
	}
	
	// ----------물건구매----------
	public void buyProduct(purchaseVO vo) {
		System.out.println("bpno : " + vo.getB_p_no());
		System.out.println("bpname : " + vo.getB_p_name());
		System.out.println("buno : " + vo.getB_u_no());
		System.out.println("bpamount : " + vo.getB_amount());
		System.out.println("b_rec name : " + vo.getB_receivername());
		System.out.println("b_rec phone : " + vo.getB_receiverphone());
		String date = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
		System.out.println("day + pno + uno : "+ date + vo.getB_p_no() + vo.getB_u_no());
		String b_no = date + Integer.toString(vo.getB_p_no()) + Integer.toString(vo.getB_u_no());
		vo.setB_no(b_no);
		mapper.buyProduct(vo);
		mapper.doMinusStock(vo.getB_amount(), vo.getB_p_no());
	}
	
	//주문내역 (구매직후)
	public purchaseVO getPurchaseInfo(String b_no, int b_u_no) {
		return mapper.getPurchaseInfo(b_no, b_u_no);
	}
	
	//주문내역 (header)
	public List<purchaseVO> getPurchaseList(int u_no) {
		return mapper.getPurchaseList(u_no);
	}

}
