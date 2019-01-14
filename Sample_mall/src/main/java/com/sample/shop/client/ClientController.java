package com.sample.shop.client;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.shop.model.UserVO;
import com.sample.shop.model.boardVO;
import com.sample.shop.model.cartVO;
import com.sample.shop.model.inqVO;
import com.sample.shop.model.mainImgVO;
import com.sample.shop.model.prodVO;
import com.sample.shop.model.purchaseVO;
import com.sample.shop.model.wishVO;

@Controller
@RequestMapping("client")
public class ClientController {
	
	@Autowired
	private ClientService service;
	
	@RequestMapping("list")
	public String list(Model m, HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		//int u_no = service.getUserNo(username);
		int cnt = service.cartCount(username);
		HttpSession session = request.getSession(true);
		session.setAttribute("cnt", cnt);
		
		List<mainImgVO> imgList = service.getMainImages();
		List<prodVO> list = service.getProdList();
		m.addAttribute("list",list);
		m.addAttribute("mainImg",imgList);
		m.addAttribute("target","default/mainbody");
		return "client/template";
	}
	
	@RequestMapping("allCategories")
	public String allCategories(Model m) {
		List<prodVO> list = service.getProdList();
		System.out.println("list.size : " + list.size());
		m.addAttribute("list",list);
		m.addAttribute("target","allCategories");
		return "client/template";
	}
	
	@RequestMapping("detailTypeList")
	public String detailCategories(Model m, String type) {
		List<prodVO> list = service.detailTypeList(type);
		System.out.println("type : " + type);
		
		switch(type) {
			case "mtm" : type = "맨투맨/후드";
				break;
					
			case "slacks" : type = "슬랙스";
				break;
				
			case "jeans" : type = "청바지/면바지";
				break;
			
			case "coat" : type = "코트/점퍼";
				break;
				
			case "workingShoes" : type = "운동화";
				break;
					
			case "walker" : type = "워커/정장화";
				break;
				
			case "cap" : type = "모자";
				break;
				
			case "socks" : type = "양말";
				break;

			case "acc" : type = "악세서리";
				break;
		}
		m.addAttribute("type");
		m.addAttribute("list", list);
		m.addAttribute("target", "detailCategories");
		return "client/template";
	}
	
	@RequestMapping("detail")
	public String detail(@RequestParam int p_no, Model m, HttpServletResponse response) {
		prodVO vo = service.getProdDetail(p_no);
//		String rctItem = "";
//		rctItem += ", " + Integer.toString(p_no);
//		Cookie cookie = new Cookie("recentItems", rctItem);
//		cookie.setMaxAge(60*60*24); // 1년
//		response.addCookie(cookie);
		
		List<prodVO> detailImageList = service.getDetailImage(p_no);
		m.addAttribute("list", detailImageList);
		m.addAttribute("detail",vo);
		m.addAttribute("target","detail");
		return "client/template";
	}
	
	@RequestMapping("auth_fail")
	public String auth_fail(Model m) {
		m.addAttribute("target","login/auth_fail");
		return "client/template";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginGet(Model m) {
		m.addAttribute("target","login/login");
		return "client/template";
	}
	
	@RequestMapping("join")
	public String joinGet(Model m) {
		m.addAttribute("target", "login/join");
		return "client/template";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String joinPost(UserVO vo, Model m) {
		System.out.println("JOIN POST VO.NAME : " + vo.getU_name());
		service.userJoin(vo);
		return "redirect:list";
	}
	
	@RequestMapping("mainTypeList")
	public String clothesMenu(@RequestParam String mainType, Model m) {
		List<prodVO> list = service.getMainTypeList(mainType);
		m.addAttribute("category",mainType);
		m.addAttribute("list",list);
		m.addAttribute("target","mainTypeList");
		return "client/template";
	}
	
	@RequestMapping("searchItem")
	public String searchItem(String searchKeyword,Model m) {
		List<prodVO> list = service.searchItems(searchKeyword);
		m.addAttribute("word",searchKeyword);
		m.addAttribute("list",list);
		m.addAttribute("target", "searchPage");
		return "client/template";
	}
	//TODO : forgotPw 하세유
	
	@RequestMapping("forgotPw")
	public String forgotPw(Model m) {
		m.addAttribute("target", "forgotPw");
		return "client/template";
	}
	
	@RequestMapping(value="forgotPw", method=RequestMethod.POST)
	public String forgotPwPost(Model m, String u_id) {
		String q = service.findPwQnA(u_id);
		m.addAttribute("question", q);
		m.addAttribute("target","forgotPwSecond");
		m.addAttribute("u_id", u_id);
		return "client/template";
	}
	
	@RequestMapping("pwAnswerChkAjax")
	@ResponseBody
	public boolean pwAnswerChkAjax(String u_id, String answer) {
		boolean result = false;
		String name = service.pwAnswerChk(u_id, answer);
		if(name == null || name == "") {
			result = false;
		} else {
			result = true;
		}
		return result;
	}
	
	@RequestMapping("pwChange")
	public String pwChange(Model m, String u_id, String u_pw) {
		service.pwChange(u_id, u_pw);
		return "redirect:list";
	}
	
	@RequestMapping("findIdAjax")
	@ResponseBody
	public String findIdAjax(String u_name, String u_phone) {
		String result = service.findId(u_name, u_phone);
		return result;
	}
	
	@RequestMapping("noticeAndEvents")
	public String noticeAndEvects(Model m, @RequestParam(value="page", defaultValue="1")int page) {
		int listCount = 10; //   한 페이지에 출력할 글 갯수 ( block)
		int totalCount = service.getBoardPageCount(); // 총 게시물 갯수
		int totalPage = totalCount / listCount; // 총 페이지 갯수
		
		if(page == 0) {page = 1;} //page가 0일때 1로 바꿔서 출력
		if(totalCount % listCount > 0) {totalPage++;}
		if(totalPage < page) {page = totalPage;}// 총 페이지 수보다 높은 page가 들어왔을때 가장 큰 페이지로 변경
		
		int startPage = (page-1) * listCount +1; // 시작페이지
		int endPage = listCount * page; // 마지막페이지
		
		List<boardVO> list = service.getBoardList(startPage, endPage);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("list", list);
		m.addAttribute("target","notice");
		return "client/template";
	}
	
	@RequestMapping("boardWrite")
	public String boardWriteGet(Model m) {
		m.addAttribute("target","boardWrite");
		return "client/template";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public String boardWritePost(boardVO vo) {
		service.boardWrite(vo);
		return "redirect:noticeAndEvents";
	}
	
	@RequestMapping("boardDetail")
	public String boardDetailGet(int b_no, Model m) {
		boardVO vo = service.boardDetail(b_no);
		m.addAttribute("vo", vo);
		m.addAttribute("target", "boardDetail");
		return "client/template";
	}
	
	@RequestMapping("mypage")
	public String mypage(String id, Model m) {
		m.addAttribute("target", "mypage");
		m.addAttribute("u_id", id);
		return "client/template";
	}
	
	@RequestMapping("userInfo")
	public String userInfoGet(String id, Model m) {
		UserVO vo = service.userInfo(id);
		m.addAttribute("u_id",id);
		m.addAttribute("vo",vo);
		m.addAttribute("target","userInfo");
		return "client/template";
	}
	
	@RequestMapping(value="mypage", method=RequestMethod.POST)
	public String userInfoPost(UserVO vo) {
		service.userInfoUpdate(vo);
		return "redirect:mypage";
	}
	
	@RequestMapping("bestItems")
	public String bestItemView(Model m) {
		List<prodVO> list = service.bestItemList();
		m.addAttribute("list",list);
		m.addAttribute("target","bestItem");
		return "client/template";
	}
	
	@RequestMapping("wishExistChkAjax")
	@ResponseBody
	public int wishExistChkAjax(String u_id, int p_no) {
		int result = service.wishExistChk(p_no, u_id);
		return result;
	}
	
	@RequestMapping("addToCartAjax")
	@ResponseBody
	public void addToCart(String u_id, int amount, int p_no, HttpSession session) {
		System.out.println("uid : " + u_id + ", amount : " + amount + ", pno : " + p_no);
		int isExistProduct = service.isExist(p_no, u_id);
		if(isExistProduct != 0) {
			service.cartAmountUpdate(amount, u_id, p_no);
		} else {
			service.cartInsert(p_no, u_id, amount);
		}
		int c_count = service.cartCount(u_id);
		session.setAttribute("cnt", c_count);
	}
	
	@RequestMapping("goCart")
	public String goCart(Model m, String u_id, HttpSession session) {
		if(u_id != "anonymousUser") {
			List<cartVO> list = service.getCartList(u_id);
			m.addAttribute("list",list);
		}
		int c_count = service.cartCount(u_id);
		session.setAttribute("cnt", c_count);
		m.addAttribute("u_id", u_id);
		m.addAttribute("target","cart");
		return "client/template";
	}
	
	@RequestMapping("wishListInsertAjax")
	@ResponseBody
	public void wishListInsert(String u_id, int p_no) {
		service.wishInsert(u_id, p_no);
	}
	
	@RequestMapping("wishDeleteAjax")
	@ResponseBody
	public void wishDeleteAjax(int w_no, String u_id) {
		service.wishDelete(w_no, u_id);
	}
	
	@RequestMapping({"buyProd","buyProductsInCart"})
	public String buyProduct(HttpServletRequest request, int amount, String u_id, Model m, int[] p_no, String[] p_name, @RequestParam(value="c_no", defaultValue="-1")int[] c_no) {
		int u_no = service.getUserNo(u_id);
		UserVO uVo = service.userInfo(u_id);
		List<purchaseVO> prodList = new ArrayList<purchaseVO>();
			
		System.out.println("cno : " + c_no[0]);
		System.out.println("amount : " + amount);
			
		int beforePrice = 0;
		for(int i = 0; i < p_no.length; i++) {
			purchaseVO pVo = new purchaseVO();
			String p_price = service.getProductPrice(p_no[i]);
			if(c_no[0] != -1) {
				amount = service.getAmount(u_id, p_no[i]);	
			}
			pVo.setB_p_name(p_name[i]);
			pVo.setB_amount(amount);
			pVo.setB_p_price(p_price);
			pVo.setB_p_no(p_no[i]);
			prodList.add(pVo);
			beforePrice += service.priceAndDelcostAdd(p_price, amount);
		}
		String totalPrice = String.format("%,d", (beforePrice + 2500));
		m.addAttribute("u_id", u_id);
		m.addAttribute("c_no", c_no);
		m.addAttribute("uVo", uVo);
		m.addAttribute("u_no",u_no);
		m.addAttribute("prodList",prodList);
		m.addAttribute("totalPrice", totalPrice);
		m.addAttribute("target","purchasePage");
	
		return "client/template";
	}
	
	@RequestMapping(value="purchaseComplete", method=RequestMethod.POST)
	public String buyProductPost(Model m,purchaseVO vo, String mainAddr, String subAddr, String totalPrice, int b_u_no, 
			@RequestParam(value="c_no", defaultValue="-1")int[] c_no, String u_id) {
		
		String removeComma = totalPrice.replace(",", "");
		vo.setB_paytotal(Integer.parseInt(removeComma));
		
		String b_address = mainAddr+ " "+ subAddr;
		vo.setB_address(b_address);
		if(c_no[0] != -1) {
			service.cartDelete(c_no, u_id);
		}
		
		List<purchaseVO> list = service.buyProduct(vo, b_u_no);
		m.addAttribute("list", list);
		m.addAttribute("totalPrice", totalPrice);
		m.addAttribute("target","purchaseComplete");
		return "client/template";
	}
	
	@RequestMapping("nonMemberPurchase")
	public String nonMemberPurchase(Model m, int p_no, String p_name, String p_price, int amount) {
		
		List<purchaseVO> prodList = new ArrayList<purchaseVO>();
			
		purchaseVO pVo = new purchaseVO();
		pVo.setB_p_name(p_name);
		pVo.setB_amount(amount);
		pVo.setB_p_price(p_price);
		pVo.setB_p_no(p_no);
		prodList.add(pVo);
		m.addAttribute("prodList",prodList);
		
		//비회원은 구매자 정보도 모두 입력해야함.
		//멤버가 아닐땐 nonmemberpurchasepage 에서 모두 입력 후 submit시 purchaseVO에서  isMem에 SET 해줘야함
		int beforePrice = service.priceAndDelcostAdd(p_price, amount);
		String totalPrice = String.format("%,d", (beforePrice + 2500));
		m.addAttribute("totalPrice", totalPrice);
		m.addAttribute("p_no", p_no);
		m.addAttribute("p_name", p_name);
		m.addAttribute("p_price", p_price);
		m.addAttribute("amount", amount);
		m.addAttribute("target", "nonMemberPurchasePage");
		return "client/template";
	}
	
	@RequestMapping("nonMemberPurchaseComplete")
	public String nonMemberPurchaseComplete(Model m, purchaseVO vo, String mainAddr, String subAddr, String totalPrice) {
		int b_u_no = 999999999; // 비회원
		String removeComma = totalPrice.replace(",", "");
		vo.setB_paytotal(Integer.parseInt(removeComma));
		
		String b_address = mainAddr+ " "+ subAddr;
		vo.setB_address(b_address);
		
		List<purchaseVO> list = service.buyProduct(vo, b_u_no);
		list.get(0).setB_u_name("비회원");
		m.addAttribute("list", list);
		m.addAttribute("totalPrice", totalPrice);
		m.addAttribute("target","purchaseComplete");
		return "client/template";
	}
	
	@RequestMapping("orderView")
	public String getPurchaseList(Model m, String u_id) {
		if(u_id.equals("anonymousUser")) {
			m.addAttribute("target", "orderViewAnonyMous");
			return "client/template";
		}
		int u_no = service.getUserNo(u_id);
		List<purchaseVO> list = service.getPurchaseList(u_no);
		m.addAttribute("target", "orderList");
		m.addAttribute("list", list);
		m.addAttribute("u_no", u_no);
		return "client/template";
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("orderDetail")
	public String orderDetail(Model m,String b_no, @RequestParam(value="u_no", defaultValue="-1")int u_no) {
		List<purchaseVO> list;
		if(u_no == -1) {
			list = service.anonymousOrderDetail(b_no);
		} else {
			list = service.getPurchaseInfo(b_no, u_no);
		}
		String totalPrice = service.getPayTotal(b_no);
		m.addAttribute("target","purchaseComplete");
		m.addAttribute("totalPrice", totalPrice);
		m.addAttribute("list", list);
		return "client/template";
	}
	
	@RequestMapping("cartDeleteAjax")
	@ResponseBody
	public void cartDelete(int[] c_no, String u_id, HttpServletRequest request) {
		service.cartDelete(c_no, u_id);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		
		int cnt = service.cartCount(username);
		HttpSession session = request.getSession(true);
		session.setAttribute("cnt", cnt);
	}
	
	@RequestMapping("otoInquire")
	public String otoInquire(String u_id, Model m) {
		m.addAttribute("u_id", u_id);
		m.addAttribute("target", "oneToOneInquirePage");
		return "client/template";
	}
	
	@RequestMapping("otoInquireReg")
	public String otoInquireReg(String u_id, inqVO vo) {
		service.otoInquireReg(u_id, vo);
		return "redirect:list";
	}
	
	@RequestMapping("wishList")
	public String wishListView(String u_id, Model m) {
		System.out.println("wishListView 진입");
		System.out.println("uid : " + u_id);
		List<wishVO> list = service.wishListView(u_id);
		m.addAttribute("u_id", u_id);
		m.addAttribute("list", list);
		m.addAttribute("target", "wishListView");
		return "client/template";
	}
	
	@RequestMapping("otoInquireList")
	public String otoInquireListView(Model m, String u_id) {
		List<inqVO> list = service.otoInquireList(u_id);
		m.addAttribute("u_id",u_id);
		m.addAttribute("list", list);
		m.addAttribute("target", "otoInquireListView");
		return "client/template";
	}
	
	@RequestMapping("otoDetail")
	public String otoDetailView(Model m, int i_no, int i_u_no, String u_id) {
		inqVO vo = service.otoDetailView(i_no, i_u_no);
		m.addAttribute("u_id",u_id);
		m.addAttribute("vo", vo);
		m.addAttribute("target", "otoDetail");
		return "client/template";
	}
	
	@RequestMapping("detailSearch")
	public String detailSearch(Model m, String searchKeyword, String mainCategory, String subCategory) {
		List<prodVO> list = service.detailSearch(searchKeyword, mainCategory, subCategory);
		System.out.println("main : " + mainCategory);
		System.out.println("sub : "  + subCategory);
		m.addAttribute("target", "searchPage");
		m.addAttribute("word", searchKeyword);
		m.addAttribute("list", list);
		return "client/template";
	}
	
	@RequestMapping("idCheckAjax")
	@ResponseBody
	public boolean idCheckAjax(String u_id) {
		System.out.println("u_id : " + u_id);
		boolean result = false;
		String isExist = service.idCheckAjax(u_id);
		System.out.println("isExist : " + isExist);
		
		if(isExist == null || isExist == "") {
			result = true;
		} else if(isExist != "") {
			result = false;
		}
		return result;
	}

}


