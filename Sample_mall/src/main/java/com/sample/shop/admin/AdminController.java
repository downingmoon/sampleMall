package com.sample.shop.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		int maxP_no = service.getMaxProdNo();
		m.addAttribute("target","prodMgr/admProdInsert");
		m.addAttribute("subTitle","상품등록");
		m.addAttribute("p_no", maxP_no);
		return "admin/adminTemplate";
	}
	
	@RequestMapping(value="prodInsert", method=RequestMethod.POST)
	public String prodInsertPost(prodVO vo, Model m, List<MultipartFile> p_prodImg) {
		service.prodInsert(vo, p_prodImg);
		return "redirect:prodListView";
	}
	
	@RequestMapping("prodImport")
	public String prodImportGet(Model m) {
		List<prodVO> list = service.prodListView();
		m.addAttribute("list",list);
		m.addAttribute("target","prodMgr/admProdImport");
		m.addAttribute("subTitle","상품입고");
		return "admin/adminTemplate";
	}
	
	@RequestMapping(value="prodImport", method=RequestMethod.POST)
	public String prodImportPost(int p_no, int stock, HttpServletResponse response) {
		System.out.println("controller. stock : " + stock);
		System.out.println("controller. pno : " + p_no);
		service.prodImport(p_no, stock);
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.println("<script>alert('입고가 완료되었습니다. '); location.href='prodListView';</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:prodListView";
	}
	
	@RequestMapping("admProdDelete")
	public String prodDelete(int p_no) {
		service.prodImgDelete(p_no);
		service.prodDelete(p_no);
		return "redirect:prodListView";
	}
	
	@RequestMapping("mainImageUpload")
	public String mainImageUploadGet(Model m) {
		m.addAttribute("target","prodMgr/admMainImageUpload");
		m.addAttribute("subTitle","메인이미지 등록");
		return "admin/adminTemplate";
	}
	
	@RequestMapping(value="mainImageUpload", method=RequestMethod.POST)
	public String mainImageUploadPost(MultipartFile p_prodImg) {
		service.mainImageUpload(p_prodImg);
		return "redirect:prodMgr";
	}
	
	

}
