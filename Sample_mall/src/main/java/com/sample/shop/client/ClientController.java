package com.sample.shop.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.shop.model.UserVO;
import com.sample.shop.model.prodVO;

@Controller
@RequestMapping("client")
public class ClientController {
	
	@Autowired
	private ClientService service;
	
	@RequestMapping("list")
	public String list(Model m) {
		List<prodVO> list = service.getProdList();
		System.out.println("list.size : " + list.size());
		m.addAttribute("list",list);
		m.addAttribute("target","mainbody");
		return "client/mainTemplate";
	}
	
	@RequestMapping("detail")
	public String detail(@RequestParam int p_no, Model m) {
		prodVO vo = service.getProdDetail(p_no);
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
		m.addAttribute("target","notice");
		return "client/template";
	}
	
	@RequestMapping("mypage")
	public String mypageGet(String id, Model m) {
		UserVO vo = service.userInfo(id);
		m.addAttribute("vo",vo);
		m.addAttribute("target","mypageBefore");
		return "client/template";
	}
	
	@RequestMapping(value="mypage", method=RequestMethod.POST)
	public String mypagePost(String id, Model m) {
		UserVO vo = service.userInfo(id);
		m.addAttribute("vo",vo);
		m.addAttribute("target","mypage");
		return "client/template";
	}
	
	@RequestMapping("goCart")
	public String cartInsert(@RequestParam String u_id, @RequestParam int p_no, Model m) {
		System.out.println("controller p_no : " + p_no);
		service.cartInsert(u_id, p_no);
		m.addAttribute("target", "cart");
		return "client/template";
	}

}
