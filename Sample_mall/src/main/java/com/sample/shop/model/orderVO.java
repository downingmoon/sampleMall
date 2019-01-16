package com.sample.shop.model;

import java.util.List;

public class orderVO {

	private String b_no;
	private int b_u_no;
	private int b_p_no;
	private String b_p_price;
	private String b_u_name;
	private String b_p_name;
	private int b_amount;
	private String b_paytype;
	private String b_regdate;
	private int b_paytotal;
	private String b_address;
	private int b_savingpoint;
	private String b_receivername;
	private String b_receiverphone;
	private String d_del_msg;
	private int cnt;
	private String totalPrice;
	private String usePoint;

	public String getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(String usePoint) {
		this.usePoint = usePoint;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	private List<purchaseVO> pList;

	public List<purchaseVO> getpList() {
		return pList;
	}

	public void setpList(List<purchaseVO> pList) {
		this.pList = pList;
	}

	public String getB_p_price() {
		return b_p_price;
	}

	public void setB_p_price(String b_p_price) {
		this.b_p_price = b_p_price;
	}

	public String getD_del_msg() {
		return d_del_msg;
	}

	public void setD_del_msg(String d_del_msg) {
		this.d_del_msg = d_del_msg;
	}

	public String getB_u_name() {
		return b_u_name;
	}

	public void setB_u_name(String b_u_name) {
		this.b_u_name = b_u_name;
	}

	public String getB_receivername() {
		return b_receivername;
	}

	public void setB_receivername(String b_receivername) {
		this.b_receivername = b_receivername;
	}

	public String getB_receiverphone() {
		return b_receiverphone;
	}

	public void setB_receiverphone(String b_receiverphone) {
		this.b_receiverphone = b_receiverphone;
	}

	public String getB_no() {
		return b_no;
	}

	public void setB_no(String b_no) {
		this.b_no = b_no;
	}

	public int getB_u_no() {
		return b_u_no;
	}

	public void setB_u_no(int b_u_no) {
		this.b_u_no = b_u_no;
	}

	public int getB_p_no() {
		return b_p_no;
	}

	public void setB_p_no(int b_p_no) {
		this.b_p_no = b_p_no;
	}

	public String getB_p_name() {
		return b_p_name;
	}

	public void setB_p_name(String b_p_name) {
		this.b_p_name = b_p_name;
	}

	public int getB_amount() {
		return b_amount;
	}

	public void setB_amount(int b_amount) {
		this.b_amount = b_amount;
	}

	public String getB_paytype() {
		return b_paytype;
	}

	public void setB_paytype(String b_paytype) {
		this.b_paytype = b_paytype;
	}

	public String getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_paytotal() {
		return b_paytotal;
	}

	public void setB_paytotal(int b_paytotal) {
		this.b_paytotal = b_paytotal;
	}

	public String getB_address() {
		return b_address;
	}

	public void setB_address(String b_address) {
		this.b_address = b_address;
	}

	public int getB_savingpoint() {
		return b_savingpoint;
	}

	public void setB_savingpoint(int b_savingpoint) {
		this.b_savingpoint = b_savingpoint;
	}

}
