package com.sample.shop.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sample.shop.admin.dao.AdminMapper;
import com.sample.shop.model.prodVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public List<prodVO> prodListView() {
		return mapper.prodListView();
	}
	
	public void prodMod(prodVO vo) {
		mapper.prodMod(vo);
	}
	
	public prodVO prodModList(int p_no) {
		return mapper.prodModList(p_no);
	}
	
	public void prodInsert(prodVO vo, List<MultipartFile> p_prodImg) {
		String contextPath = this.getClass().getClassLoader().getResource("").getPath();
		try {
			String fullPath = URLDecoder.decode(contextPath,"UTF-8");
			System.out.println(fullPath);
			String pathArr[] = fullPath.split("WEB-INF/classes/");
			String imgPath = pathArr[0] + "resources/img/";
			System.out.println("targetPath : " + imgPath);
			
			String mainImgPath = imgPath + "";
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}

}
