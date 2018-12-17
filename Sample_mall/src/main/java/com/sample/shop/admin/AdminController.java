package com.sample.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.shop.model.prodVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("adminPage")
	public String adminPage(Model m) {
		m.addAttribute("target","adminMainPage");
		m.addAttribute("subTitle","홈");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("prodMgr")
	public String prodMgr(Model m) {
		m.addAttribute("target","prodMgr/prodManagement");
		m.addAttribute("subTitle","상품관리");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("saleMgr")
	public String saleMgr(Model m) {
		m.addAttribute("target","saleMgr/saleManagement");
		m.addAttribute("subTitle","주문관리");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("custMgr")
	public String custMgr(Model m) {
		m.addAttribute("target","custMgr/custManagement");
		m.addAttribute("subTitle","고객관리");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("prodListView")
	public String prodListView(Model m) {
		List<prodVO> list = service.prodListView();
		m.addAttribute("list", list);
		m.addAttribute("target","prodMgr/admProdView");
		m.addAttribute("subTitle","등록상품 조회");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("admProdDetail")
	public String admProdDetail(Model m) {
		m.addAttribute("target","prodMgr/admProdDetail");
		m.addAttribute("subTitle","상품상세조회");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("prodMod")
	public String prodModGet(Model m, int p_no) {
		prodVO vo = service.prodModList(p_no);
		m.addAttribute("vo",vo);
		m.addAttribute("target","prodMgr/admProdMod");
		m.addAttribute("subTitle","상품정보수정");
		return "admin/adminTemplate";
	}
	
	@RequestMapping(value="prodMod", method=RequestMethod.POST)
	public String prodModPost(prodVO vo) {
		service.prodMod(vo);
		return "redirect:prodListView";
	}
	
	@RequestMapping("prodInsert")
	public String prodInsertGet(Model m) {
		m.addAttribute("target","prodMgr/admProdInsert");
		m.addAttribute("subTitle","상품등록");
		return "admin/adminTemplate";
	}
	
	

}
