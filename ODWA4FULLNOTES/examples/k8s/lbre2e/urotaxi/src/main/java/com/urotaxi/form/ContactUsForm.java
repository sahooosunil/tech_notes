package com.urotaxi.form;

import java.io.Serializable;

public class ContactUsForm implements Serializable {
	private static final long serialVersionUID = -3713460335833934092L;
	protected int sno;
	protected String name;
	protected String mobileNo;
	protected String message;

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
