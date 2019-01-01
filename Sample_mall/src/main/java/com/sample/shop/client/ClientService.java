package com.sample.shop.client;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sample.shop.client.dao.ClientMapper;
import com.sample.shop.model.UserVO;
import com.sample.shop.model.boardVO;
import com.sample.shop.model.cartVO;
import com.sample.shop.model.delVO;
import com.sample.shop.model.inqVO;
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
	
	public int isExist(int p_no, String u_id) {
		int u_no = mapper.getUserNo(u_id);
		Integer isExist = mapper.isExist(p_no, u_no);
		if(isExist == null) {
			isExist = 0;
		}
		return isExist;
	}
	
	public void cartAmountUpdate(int amount, String u_id, int p_no) {
		int u_no = mapper.getUserNo(u_id);
		mapper.cartAmountUpdate(amount, u_no, p_no);
	}
	
	public void cartInsert(int p_no, String u_id, int amount) {
		mapper.cartInsert(p_no, u_id, amount);
	}
	
	public void cartDelete(int c_no, String u_id) {
		System.out.println("c_no : " + c_no);
		System.out.println("u_id : " + u_id);
		int u_no = mapper.getUserNo(u_id);
		System.out.println("u_no : " + u_no);
		mapper.cartDelete(c_no, u_no);
	}
	
	public int cartCount(String u_id) {
		int u_no = 0;
		if(u_id != null && u_id != "anonymousUser") {
		u_no = mapper.getUserNo(u_id);
		return mapper.cartCount(u_no);
		}
		return u_no;
	}
	
	public List<cartVO> getCartList(String u_id) {
		System.out.println("u_id:" + u_id);
		if(u_id != "anonymousUser") {
			System.out.println("if 진입");
			int u_no = mapper.getUserNo(u_id);
			return mapper.getCartList(u_no);
			
		} else {
			System.out.println("else 진입");
			return null;
		}
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
	
	// product 가격 + 배송비 합계 출력용
	public String priceAndDelcostAdd(String p_price, int amount) {
		System.out.println("p_price : " + p_price);
		String removeSpace = p_price.replace(" ", "");
		String removeComma = removeSpace.replace(",", "");
		System.out.println("rem comma : " + removeComma);
		int beforePrice = (Integer.parseInt(removeComma) * amount) + 2500;
		String afterPrice = String.format("%,d", beforePrice);
		return afterPrice;
	}
	
	public void buyProduct(purchaseVO vo, delVO dVo) {
		System.out.println("bpno : " + vo.getB_p_no());
		System.out.println("bpname : " + vo.getB_p_name());
		System.out.println("buno : " + vo.getB_u_no());
		System.out.println("bpamount : " + vo.getB_amount());
		System.out.println("b_rec name : " + vo.getB_receivername());
		System.out.println("b_rec phone : " + vo.getB_receiverphone());
		System.out.println("b_del_msg : " + vo.getD_del_msg());
		System.out.println("paytype  : " + vo.getB_paytype());
		System.out.println("paytotal : " + vo.getB_paytotal());
		//주문번호 만들기
		int random = (int) (Math.random() * 10000) + 1;
		String date = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
		System.out.println("day + pno + uno : "+ date + vo.getB_p_no() + vo.getB_u_no());
		String b_no = date + Integer.toString(vo.getB_p_no())+"-"+ Integer.toString(vo.getB_u_no())
						   + Integer.toString(random);
		vo.setB_no(b_no);
		mapper.buyProduct(vo);
		
		//배송테이블에 INSERT
		dVo.setD_b_no(vo.getB_no());
		dVo.setD_p_no(vo.getB_p_no());
		dVo.setD_u_no(vo.getB_u_no());
		dVo.setD_receive_name(vo.getB_receivername());
		dVo.setD_receive_address(vo.getB_address());
		dVo.setD_del_msg(vo.getD_del_msg());
		mapper.insertToDelivery(dVo);
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
	
	//1:1 문의 글 등록
	public void otoInquireReg(String u_id, inqVO vo) {
		int u_no = mapper.getUserNo(u_id);
		vo.setI_u_no(u_no);
		mapper.otoInquireReg(vo);
	}

}
