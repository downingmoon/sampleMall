package com.sample.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.shop.client.ClientService;
import com.sample.shop.model.prodVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ClientService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model m) {
		List<prodVO> list = service.getProdList();
		System.out.println("list.size : " + list.size());
		m.addAttribute("list",list);
		m.addAttribute("target","mainbody");
		return "redirect:client/list";
	}

}
