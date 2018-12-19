package com.sample.shop.model;

public class prodVO {

	private int p_no;
	private String p_name;
	private String p_info;
	private String p_price;
	private int p_ismain;
	private String p_maintype;
	private String p_detailtype;
	private int p_viewcnt;
	private int p_salecnt;
	private int stock;
	private String p_mainimg;
	private String p_detailimg;

	public String getP_detailimg() {
		return p_detailimg;
	}

	public void setP_detailimg(String p_detailimg) {
		this.p_detailimg = p_detailimg;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getP_mainimg() {
		return p_mainimg;
	}

	public void setP_mainimg(String p_mainimg) {
		this.p_mainimg = p_mainimg;
	}

	public String getP_maintype() {
		return p_maintype;
	}

	public void setP_maintype(String p_maintype) {
		this.p_maintype = p_maintype;
	}

	public String getP_detailtype() {
		return p_detailtype;
	}

	public void setP_detailtype(String p_detailtype) {
		this.p_detailtype = p_detailtype;
	}

	public int getP_viewcnt() {
		return p_viewcnt;
	}

	public void setP_viewcnt(int p_viewcnt) {
		this.p_viewcnt = p_viewcnt;
	}

	public int getP_salecnt() {
		return p_salecnt;
	}

	public void setP_salecnt(int p_salecnt) {
		this.p_salecnt = p_salecnt;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public int getP_ismain() {
		return p_ismain;
	}

	public void setP_ismain(int p_ismain) {
		this.p_ismain = p_ismain;
	}

}
