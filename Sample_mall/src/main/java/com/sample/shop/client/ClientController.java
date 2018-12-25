package com.sample.shop.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.shop.model.UserVO;
import com.sample.shop.model.boardVO;
import com.sample.shop.model.cartVO;
import com.sample.shop.model.mainImgVO;
import com.sample.shop.model.prodVO;
import com.sample.shop.model.purchaseVO;

@Controller
@RequestMapping("client")
public class ClientController {
	
	@Autowired
	private ClientService service;
	
	@RequestMapping("list")
	public String list(Model m) {
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
	
	@RequestMapping("detail")
	public String detail(@RequestParam int p_no, Model m) {
		prodVO vo = service.getProdDetail(p_no);
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
		return "redirect:login";
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
	
	@RequestMapping("noticeAndEvents")
	public String noticeAndEvects(Model m) {
		List<boardVO> list = service.getBoardList();
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
	public String mypageGet(String id, Model m) {
		UserVO vo = service.userInfo(id);
		m.addAttribute("vo",vo);
		m.addAttribute("target","mypage");
		return "client/template";
	}
	
	@RequestMapping(value="mypage", method=RequestMethod.POST)
	public String mypagePost(UserVO vo) {
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
	
	@RequestMapping("addToCartAjax")
	public String addToCart(String u_id, int amount, int p_no) {
		System.out.println("uid : " + u_id + " amount : " + amount + " pno : " + p_no);
		service.cartInsert(p_no, u_id, amount);
		return "redirect:list";
	}
	
	@RequestMapping("goCart")
	public String goCart(Model m, String u_id) {
		List<cartVO> list = service.getCartList(u_id);
		m.addAttribute("list",list);
		m.addAttribute("target","cart");
		return "client/template";
	}
	
	@RequestMapping("wishListInsertAjax")
	public String wishListInsert(String u_id, int p_no) {
		service.wishInsert(u_id, p_no);
		return "redirect:wishList";
	}
	
	@RequestMapping("buyProd")
	public String buyProduct(int p_no, String u_id, String p_name, int amount, String p_price, Model m) {
		int u_no = service.getUserNo(u_id);
		UserVO vo = service.userInfo(u_id);
		m.addAttribute("uVo", vo);
		m.addAttribute("u_no",u_no);
		m.addAttribute("p_no",p_no);
		m.addAttribute("p_name",p_name);
		m.addAttribute("amount",amount);
		m.addAttribute("p_price", p_price);
		m.addAttribute("target","purchasePage");
		return "client/template";
	}
	
	@RequestMapping(value="purchaseComplete", method=RequestMethod.POST)
	public String buyProductPost(Model m,purchaseVO vo, String mainAddr, String subAddr ) {
		String b_address = mainAddr+ " "+ subAddr;
		vo.setB_address(b_address);
		service.buyProduct(vo);
		
		vo  = service.getPurchaseInfo(vo.getB_no(), vo.getB_u_no());
		m.addAttribute("vo", vo);
		m.addAttribute("target","purchaseComplete");
		return "client/template";
	}
	
	@RequestMapping("orderView")
	public String getPurchaseList(Model m, String u_id) {
		int u_no = service.getUserNo(u_id);
		List<purchaseVO> list = service.getPurchaseList(u_no);
		m.addAttribute("target", "orderList");
		m.addAttribute("list", list);
		m.addAttribute("u_no", u_no);
		return "client/template";
	}
	@RequestMapping("orderDetail")
	public String orderDetail(Model m,String b_no, int u_no) {
		purchaseVO vo = service.getPurchaseInfo(b_no, u_no);
		m.addAttribute("target","purchaseComplete");
		m.addAttribute("vo", vo);
		return "client/template";
	}

}
