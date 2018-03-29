package com.pro.kkst.dtos;

public class ResInfoDto {

	private String name;
	private int menu_seq;
	private int price;
	private int photo_seq;
	private String origin;
	private String change;
	private String cate;
	private String base;
	private String cook;
	private String spicy;
	private String temp;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMenu_seq() {
		return menu_seq;
	}
	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPhoto_seq() {
		return photo_seq;
	}
	public void setPhoto_seq(int photo_seq) {
		this.photo_seq = photo_seq;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	public String getCook() {
		return cook;
	}
	public void setCook(String cook) {
		this.cook = cook;
	}
	public String getSpicy() {
		return spicy;
	}
	public void setSpicy(String spicy) {
		this.spicy = spicy;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	@Override
	public String toString() {
		return "ResInfoDto [name=" + name + ", menu_seq=" + menu_seq + ", price=" + price + ", photo_seq=" + photo_seq
				+ ", origin=" + origin + ", change=" + change + ", cate=" + cate + ", base=" + base + ", cook=" + cook
				+ ", spicy=" + spicy + ", temp=" + temp + "]";
	}
	public ResInfoDto(String name, int menu_seq, int price, int photo_seq, String origin, String change, String cate,
			String base, String cook, String spicy, String temp) {
		super();
		this.name = name;
		this.menu_seq = menu_seq;
		this.price = price;
		this.photo_seq = photo_seq;
		this.origin = origin;
		this.change = change;
		this.cate = cate;
		this.base = base;
		this.cook = cook;
		this.spicy = spicy;
		this.temp = temp;
	}
	
	public ResInfoDto() {
		// TODO Auto-generated constructor stub
	}
	
}
