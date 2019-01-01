package com.sample.shop.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sample.shop.admin.dao.AdminMapper;
import com.sample.shop.model.delVO;
import com.sample.shop.model.prodVO;
import com.sample.shop.model.salesVO;

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
	private String createFileName(String extName) {
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
			
			String fileName = createFileName(extName);
			byte[] data = p_prodImg.get(0).getBytes();
			FileOutputStream fos = new FileOutputStream(mainImgPath + "/" + fileName);
			fos.write(data);
			vo.setP_mainimg(fileName.substring(0, fileName.lastIndexOf(".")));
			System.out.println("vo.p_mainimg : " + vo.getP_mainimg());
			mapper.prodInsert(vo);

			for (int i = 0; i < p_prodImg.size(); i++) {
				fileName = createFileName(extName);
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

	
	// Prod Delete (service 하나에서 모두실행)
	public void prodDelete(int p_no) {
		mapper.cartForceDel(p_no);
		mapper.wishForceDel(p_no);
		//prodDelete는 젤 마지막에 실행해야함(foreign key, cascade 사용안함, Image삭제는 따로실행)
		mapper.prodDelete(p_no);
	}
	
	public void prodImgDelete(int p_no) {
		try {
			String contextPath = this.getClass().getClassLoader().getResource("").getPath();
			String fullPath = URLDecoder.decode(contextPath, "UTF-8");
			String pathArr[] = fullPath.split("WEB-INF/classes/");
			String targetPath = pathArr[0] + "resources/img/product/";
			
			File mainImg = new File(targetPath+ "mainImg/" + p_no);
			File detailImg = new File(targetPath +"detailImg/" + p_no);
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
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void mainImgDelete(int m_no) {
		//TODO : 삭제 service만 구현, mapper db삭제도 해야함
		try {
			String contextPath = this.getClass().getClassLoader().getResource("").getPath();
			System.out.println("context path : " + contextPath);
			String fullPath = URLDecoder.decode(contextPath, "UTF-8");
			System.out.println("fullpath : " + fullPath);
			String pathArr[] = fullPath.split("WEB-INF/classes/");
			System.out.println("pathArr : " + pathArr[0]);
			String targetPath = pathArr[0] + "resources/img/product/";
			System.out.println("targetpath : " + targetPath);
			
			
			File img = new File(targetPath+ "mainPageImage/" + m_no);
			
			if(img.exists()) {
				if(img.isDirectory()) {
					File[] mainImgFiles = img.listFiles();
					// Main Page Image Delete
					for(int i = 0; i < mainImgFiles.length; i++) {
						mainImgFiles[i].delete();
						System.out.println("Main Page Img delete : " + mainImgFiles[i].getName() + "delete complete");
					}
					img.delete();
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void prodImport(int p_no, int stock) {
		System.out.println("service. stock : " + stock);
		System.out.println(p_no);
		System.out.println("service. pno : " + p_no);
		mapper.prodImport(p_no, stock);
	}
	
	public void mainImageUpload(MultipartFile p_prodImg) {
		try {

			String originName = p_prodImg.getOriginalFilename();
			String extName = originName.substring(originName.lastIndexOf("."), originName.length());

			String contextPath = this.getClass().getClassLoader().getResource("").getPath();
			String fullPath = URLDecoder.decode(contextPath, "UTF-8");
			String pathArr[] = fullPath.split("WEB-INF/classes/");
			String targetPath = pathArr[0] + "resources/img/mainPageImage/";

			int m_no = mapper.getImageNo();
			System.out.println("m_no : " + m_no);
			String mainImgPath = targetPath + m_no;
			System.out.println("mainPageImage path : " + mainImgPath);
			

			File path = new File(mainImgPath);
			if (!path.exists()) {
				path.mkdirs();
			}
			
			String m_imgname = createFileName(extName);
			System.out.println("m_imgname : " + m_imgname);
			byte[] data = p_prodImg.getBytes();
			FileOutputStream fos = new FileOutputStream(mainImgPath + "/" + m_imgname);
			fos.write(data);
			mapper.mainImageUpload(m_no, m_imgname);
			
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 *  주문관리
	 */
	
	public List<salesVO> saleListView() {
		return mapper.saleListView();
	}
	
	public int saleCount() {
		return mapper.saleCount();
	}
	
	public void deliverComplete(String b_no) {
		//발송대기 목록에서 삭제
		mapper.deliverComplete(b_no);
		//배송테이블에 status update
		mapper.deliverStatusUpdate(b_no);
	}
	
	public List<delVO> deliverStatusView() {
		return mapper.deliverStatusView();
	}

}
