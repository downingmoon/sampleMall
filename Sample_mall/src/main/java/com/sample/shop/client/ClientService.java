package com.sample.shop.client;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.sample.shop.model.wishVO;

@Service
public class ClientService {
	
	@Autowired
	private ClientMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder bpe;
	
	//paging
	public int getBoardPageCount() {
		return mapper.getBoardPageCount();
	}
	
	public List<prodVO> getProdListNew() {
		return mapper.getProdListNew();
	}
	
	public List<prodVO> detailTypeList(String type) {
		return mapper.detailTypeList(type);
	}
	
	public List<mainImgVO> getMainImages() {
		return mapper.getMainImages();
	}
	
	public List<prodVO> getProdList() {
		return mapper.getProdList();
	}
	
	public List<boardVO> getBoardList(int page, int endpage) {
		return mapper.getBoardList(page, endpage);
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
		System.out.println("vo.getpw : " + vo.getU_pw());
		if(vo.getU_pw() != "") {
			String cryptoPw = bpe.encode(vo.getU_pw());
			vo.setU_pw(cryptoPw);
			System.out.println("crypto pw : " + cryptoPw);
			System.out.println("new vo pw : " + vo.getU_pw());
			mapper.userInfoUpdateWithPw(vo);
		} else {
			mapper.userInfoUpdate(vo);
		}
		
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
	
	public int wishExistChk(int p_no, String u_id) {
		int u_no = mapper.getUserNo(u_id);
		return mapper.wishExistChk(u_no, p_no);
	}
	
	public void cartInsert(int p_no, String u_id, int amount) {
		mapper.cartInsert(p_no, u_id, amount);
	}
	
	public void cartDelete(int[] c_no, String u_id) {
		System.out.println("u_id : " + u_id);
		int u_no = mapper.getUserNo(u_id);
		for(int i = 0; i < c_no.length; i++) {
			mapper.cartDelete(c_no[i], u_no);
		}
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
			int u_no = mapper.getUserNo(u_id);
			return mapper.getCartList(u_no);
			
		} else {
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
	
	public String getProductPrice(int p_no) {
		return mapper.getProductPrice(p_no);
	}
	
	public int getAmount(String u_id, int p_no) {
		int u_no = mapper.getUserNo(u_id);
		return mapper.getAmount(u_no, p_no);
	}
	
	// product 가격 + 배송비 합계 출력용
	public int priceAndDelcostAdd(String p_price, int amount) {
		int beforePrice = 0;
		String removeSpace = p_price.replace(" ", "");
		String removeComma = removeSpace.replace(",", "");
		beforePrice += (Integer.parseInt(removeComma) * amount);
		
		return beforePrice;
	}
	
	public int getPoint(int price) {
		int point = 0;
		point = (int)(price * 0.01);
		System.out.println("point : " + point);
		return point;
	}
	
	public List<purchaseVO> buyProduct(purchaseVO vo, int u_no) {
		System.out.println("u_no : " + u_no);
		delVO dVo = new delVO();
		//주문번호 만들기
		int random = (int) (Math.random() * 100000) + 1;
		String date = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime());
		String b_no = "";
		if(u_no != 999999999) {
			b_no = date + "-"+ u_no + Integer.toString(random);
			mapper.pointInsert(vo.getB_savingpoint(), u_no);
		} else {
			b_no = "NM" + date + "-"+ Integer.toString(random);
		}
		//TODO : vo.get b savingpoint 해서 해당하는 유저한테 point + 시키기
		vo.setB_no(b_no); 
		
		dVo.setD_b_no(b_no);
		dVo.setD_u_no(u_no);
		dVo.setD_receive_name(vo.getB_receivername());
		dVo.setD_receive_address(vo.getB_address());
		dVo.setD_del_msg(vo.getD_del_msg());		
		
		for(int i = 0; i < vo.getpList().size(); i++) {
			vo.setB_p_no(vo.getpList().get(i).getB_p_no());
			vo.setB_p_name(vo.getpList().get(i).getB_p_name());
			vo.setB_amount(vo.getpList().get(i).getB_amount());
			mapper.buyProduct(vo);
			
			//배송 INSERT
			dVo.setD_p_no(vo.getB_p_no());
			mapper.insertToDelivery(dVo);
			mapper.doMinusStock(vo.getB_amount(), vo.getB_p_no());
			mapper.doAddSaleCount(vo.getB_amount(), vo.getB_p_no());
		}
		List<purchaseVO> list = mapper.getPurchaseInfo(b_no, u_no);
		return list;
	}
	
	//주문내역 (구매직후)
	public List<purchaseVO> getPurchaseInfo(String b_no, int b_u_no) {
		return mapper.getPurchaseInfo(b_no, b_u_no);
	}
	
	//주문내역(비회원)
	public List<purchaseVO> anonymousOrderDetail(String b_no) {
		return mapper.anonymousOrderDetail(b_no);
	}
	
	//주문내역 (header)
	public List<purchaseVO> getPurchaseList(int u_no) {
		List<purchaseVO> originList = mapper.getPurchaseList(u_no);
		List<purchaseVO> resultList = originList;
		System.out.println("list size : "+ resultList.size());
		for(int i = 0; i < originList.size(); i++) {
			System.out.println("i : " + i);
			for(int j = 0; j < originList.size(); j++) {
				System.out.println("for 바로밑 j : " + j);
				String originB_no = originList.get(i).getB_no();
				String resultB_no = resultList.get(j).getB_no();
				if(originList.size() > 1) {
					if(resultB_no.contains(originB_no) && resultB_no.contains(resultList.get(j+1).getB_no())) {
						resultList.remove(j);
						System.out.println(" j : " + j);
					}
				}
			}
			String resultB_no = resultList.get(i).getB_no();
			System.out.println("resultbno : " + resultB_no);
			int cnt = mapper.getPnameCoutFromBuy(resultB_no);
			resultList.get(i).setCnt(cnt);
		}
		return resultList;
	}
	
	//Header에 있는 주문조회시 사용
	public String getPayTotal(String b_no) {
		return mapper.getPayTotal(b_no);
	}
	
	//1:1 문의 글 등록
	public void otoInquireReg(String u_id, inqVO vo) {
		int u_no = mapper.getUserNo(u_id);
		vo.setI_u_no(u_no);
		mapper.otoInquireReg(vo);
	}
	
	//wishList 조회
	public List<wishVO> wishListView(String u_id) {
		int u_no = mapper.getUserNo(u_id);
		return mapper.wishListView(u_no);
	}
	
	//wishList 삭제
	public void wishDelete(int w_no, String u_id) {
		int u_no = mapper.getUserNo(u_id);
		mapper.wishDelete(w_no, u_no);
	}
	
	//1:1 문의 글 조회
	public List<inqVO> otoInquireList(String u_id) {
		int u_no = mapper.getUserNo(u_id);
		return mapper.otoInquireList(u_no);
	}
	
	//1:1 문의 상세조회
	public inqVO otoDetailView(int i_no, int i_u_no) {
		return mapper.otoDetail(i_no, i_u_no);
	}
	
	//상세 검색
	public List<prodVO> detailSearch(String searchKeyword, String mainCategory, String subCategory) {
		return mapper.detailSearch(searchKeyword, mainCategory, subCategory);
	}
	
	//아이디 중복체크
	public String idCheckAjax(String u_id) {
		return mapper.idCheckAjax(u_id);
	}
	
	//ID찾기
	public String findId(String u_name, String u_phone) {
		String result = mapper.findId(u_name, u_phone);
		if(result == null || result == "") {
			result = "-1";
		}
		return result;
	}
	
	//PW찾기 질문가져오기
	public String findPwQnA(String u_id) {
		return mapper.findPwQnA(u_id);
	}
	
	//아이디에 해당하는 pw찾기 답변이 맞는지
	public String pwAnswerChk(String u_id, String answer) {
		return mapper.pwAnswerChk(u_id, answer);
	}
	
	//PW Change
	public void pwChange(String u_id, String u_pw) {
		int u_no = mapper.getUserNo(u_id);
		String cryptoPw = bpe.encode(u_pw);
		mapper.pwChange(cryptoPw, u_no);
	}
	
	//Login시 아이디 비밀번호 조회
	public int loginCheck(String u_id, String u_pw) {
		System.out.println("service.u_id : " + u_id);
		int result = 0;
		String encodedPw = mapper.getPasswordById(u_id);
		if(bpe.matches(u_pw, encodedPw)) {
			result = 1;
		} else if(mapper.idCheckAjax(u_id) == null || mapper.idCheckAjax(u_id) == "") {
			result = 0;
		} else {
			result = -1;
		}
		return result;
	}

}
