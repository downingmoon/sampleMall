package com.sample.shop.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	

}
