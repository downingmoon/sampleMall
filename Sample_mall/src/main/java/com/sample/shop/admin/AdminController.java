package com.sample.shop.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sample.shop.model.delVO;
import com.sample.shop.model.inqVO;
import com.sample.shop.model.prodVO;
import com.sample.shop.model.salesVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("adminPage")
	public String adminPage(Model m) {
		int otoCnt = service.getOtoCount();
		int delCnt = service.saleCount();
		m.addAttribute("otoCnt",otoCnt);
		m.addAttribute("delCnt", delCnt);
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
		int cnt = service.saleCount();
		m.addAttribute("cnt",cnt);
		m.addAttribute("target","saleMgr/saleManagement");
		m.addAttribute("subTitle","주문관리");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("custMgr")
	public String custMgr(Model m) {
		int cnt = service.getOtoCount();
		m.addAttribute("cnt", cnt);
		m.addAttribute("target","custMgr/custManagement");
		m.addAttribute("subTitle","고객관리");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("onLoadFn")
	public void saleAlert() {
		service.saleCount();
	}
	
	/*
	 * 상품관리
	 */
	
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
	
	/*
	 *  주문관리
	 */

	
	@RequestMapping("saleListView")
	public String saleListView(Model m) {
		List<salesVO> list = service.saleListView();
		m.addAttribute("list",list);
		m.addAttribute("subTitle","발송대기중인 상품 조회");
		m.addAttribute("target","saleMgr/saleListView");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("delComplAjax")
	public String delComplete(String b_no) {
		System.out.println("b_no : " + b_no);
		service.deliverComplete(b_no);
		return "redirect:saleListView";
	}
	
	@RequestMapping("deliverStatusView")
	public String deliverStatusView(Model m, @RequestParam(value="page", defaultValue="1")int page) {
		int listCount = 5; //   한 페이지에 출력할 글 갯수 ( block)
		int totalCount = service.getDeliverStatusPageCount(); // 총 게시물 갯수
		int totalPage = totalCount / listCount; // 총 페이지 갯수
		int startPage = (page-1) * listCount +1; // 시작페이지
		int endPage = listCount * page; // 마지막페이지
		
		if(page == 0) {page = 1;} //page가 0일때 1로 바꿔서 출력
		if(totalCount % listCount > 0) {totalPage++;}
		if(totalPage < page) {page = totalPage;}// 총 페이지 수보다 높은 page가 들어왔을때 가장 큰 페이지로 변경
		
		System.out.println("totalCount : " + totalCount);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		System.out.println("totalPage : " + totalPage);
		
		List<delVO> list = service.deliverStatusView(startPage, endPage);
		m.addAttribute("list", list);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("subTitle", "배송현황 조회");
		m.addAttribute("target", "saleMgr/deliverStatusView");
		return "admin/adminTemplate";
	}
	
	
	/*
	 *  고객관리
	 */
	
	@RequestMapping("otoListView")
	public String otoListView(Model m) {
		List<inqVO> list = service.otoListView();
		m.addAttribute("list",list);
		m.addAttribute("subTitle", "1:1문의 조회");
		m.addAttribute("target", "custMgr/otoListView");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("goOtoDetail")
	public String goOtoDetail(Model m, int i_no) {
		inqVO vo = service.goOtoDetail(i_no);
		m.addAttribute("vo", vo);
		m.addAttribute("target", "custMgr/otoDetail");
		return "admin/adminTemplate";
	}
	
	@RequestMapping("otoAnswerUpdate")
	public String otoAnswerUpdate(inqVO vo) { 
		service.otoAnswerUpdate(vo);
		return "redirect:otoListView";
	}
	
//	@RequestMapping("deleteOto")
//	public String deleteOto(int i_no) {
//		return "redirect:otoListView";
//	}
}
