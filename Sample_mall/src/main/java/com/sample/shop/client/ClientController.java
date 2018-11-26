package com.sample.shop.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("login")
	public String login() {
		return "client/login/login";
	}
	
	@RequestMapping("goCart")
	public String goCart(@RequestParam int p_no, Model m) {
		prodVO vo = service.getProdDetail(p_no);
		m.addAttribute("detail",vo);
		m.addAttribute("target","detail");
		return "client/template";
	}

}
