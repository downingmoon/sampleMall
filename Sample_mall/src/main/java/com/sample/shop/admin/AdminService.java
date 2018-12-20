package com.sample.shop.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
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
	/*
	 * ---------- Image Upload ----------
	 */

	// File Naming
	private String createFileName(prodVO vo, String extName) {
		System.out.println("----create file name method ----");
		String fileName = "";
		UUID uuid = UUID.randomUUID();
		fileName += uuid;
		fileName += extName;
		System.out.println("createFileName.fileName : " + fileName);
		return fileName;
	}

	// Insert Image & Product
	public void prodInsert(prodVO vo, List<MultipartFile> p_prodImg) {
		System.out.println("----prodInsertService----");

		// Main Image
		try {

			String originName = p_prodImg.get(0).getOriginalFilename();
			String extName = originName.substring(originName.lastIndexOf("."), originName.length());

			String contextPath = this.getClass().getClassLoader().getResource("").getPath();
			String fullPath = URLDecoder.decode(contextPath, "UTF-8");
			String pathArr[] = fullPath.split("WEB-INF/classes/");
			String targetPath = pathArr[0] + "resources/img/product/";

			String mainImgPath = targetPath + "mainImg/" + vo.getP_no();
			String detailImgPath = targetPath + "detailImg/" + vo.getP_no();
			System.out.println("mainImg path : " + mainImgPath);
			System.out.println("detailImg path : " + detailImgPath);

			File path = new File(mainImgPath);
			if (!path.exists()) {
				path.mkdirs();
			}
			File thumbPath = new File(detailImgPath);
			if (!thumbPath.exists()) {
				thumbPath.mkdirs();
			}
			
			String fileName = createFileName(vo, extName);
			byte[] data = p_prodImg.get(0).getBytes();
			FileOutputStream fos = new FileOutputStream(mainImgPath + "/" + fileName);
			fos.write(data);
			vo.setP_mainimg(fileName.substring(0, fileName.lastIndexOf(".")));
			System.out.println("vo.p_mainimg : " + vo.getP_mainimg());
			mapper.prodInsert(vo);

			for (int i = 0; i < p_prodImg.size(); i++) {
				fileName = createFileName(vo, extName);
				data = p_prodImg.get(i).getBytes();
				fos = new FileOutputStream(detailImgPath + "/" + fileName);
				fos.write(data);
				vo.setP_detailimg(fileName.substring(0, fileName.lastIndexOf(".")));
				System.out.println("vo.p_detailimg : " + vo.getP_detailimg());
				mapper.prodImgInsert(vo);
			}
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}

	public int getMaxProdNo() {
		return mapper.getMaxProdNo();
	}
	
	/*
	 * ----------Prod Insert End----------
	 */

	public void prodDelete(int p_no) {
		mapper.prodDelete(p_no);
	}
	
	public void prodImgDelete(int p_no) {
		File mainImg = new File("D:\\dev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0"
				+ "\\wtpwebapps\\Sample_mall\\resources\\img\\product\\mainImg\\" + p_no);
		File detailImg = new File("D:\\dev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0"
				+ "\\wtpwebapps\\Sample_mall\\resources\\img\\product\\detailImg\\" + p_no);
		if(mainImg.exists() && detailImg.exists()) {
			if(mainImg.isDirectory() && detailImg.isDirectory()) {
				File[] mainImgFiles = mainImg.listFiles();
				// Main Image Delete
				for(int i = 0; i < mainImgFiles.length; i++) {
					mainImgFiles[i].delete();
					System.out.println("Main Img delete : " + mainImgFiles[i].getName() + "delete complete");
				}
				mainImg.delete();
				// Detail Image Delete
				File[] detailImgFiles = detailImg.listFiles();
				for(int i = 0; i < detailImgFiles.length; i++) {
					detailImgFiles[i].delete();
					System.out.println("Detail Img delete : " + detailImgFiles[i].getName() + "delete complete");
				}
				detailImg.delete();
				
			}
		}
		
		mapper.prodImgDelete(p_no);
	}
	
	public void prodImport(int p_no, int stock) {
		System.out.println("service. stock : " + stock);
		System.out.println(p_no);

		mapper.prodImport(p_no, stock);
	}

}
