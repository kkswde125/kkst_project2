package com.pro.kkst.utils;

public class Us_Utils {
	private String arrowNbsp;
	
	public int randomBox(int aryLength) {
		
		int rs=0;//결과인덱스
		double basicBY = 0.0;
		Double[] basicXX= new Double[aryLength];//그릇
		double percent=Math.random();
		basicBY = ((double)1/aryLength);//기본배율
		
		for (int i = 0; i < aryLength; i++) {
			basicXX[i]=basicBY;
		}
		
		for (int i = 1; i < basicXX.length; i++) {
			basicXX[i] = basicXX[i-1]+basicXX[i];
		}
		
		for (int i = 0; i < basicXX.length; i++) {
			if (percent<basicXX[i]) {
				rs=i;
				break;
			} else {
				rs=i;
			}
		}//뽑기
		return rs;
	}
	
	public String getArrowNbsp() {
		return arrowNbsp;
	}
	public void setArrowNbsp(String depth) {
		String nbsp="";
		int depthInt=Integer.parseInt(depth);
		for (int i = 0; i < depthInt; i++) {
			nbsp+= "&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		
		this.arrowNbsp = (depthInt>0?nbsp+"<img src='resources/upload/arrow.png' alt='답글'>&nbsp;":"");
	}
	
	public String[] makingStars(String stars0, String stars1, String stars2, 
			String stars3, String stars4, String stars5, String stars6, String stars7, String stars8, String stars9) {
		String[] stars = null;
		int count =0;
		if (stars0==null) {
			return null;
		}else if(stars1==null){
			stars= new String[1];
		}else if(stars2==null){
			stars= new String[2];
		}else if(stars3==null){
			stars= new String[3];
		}else if(stars4==null){
			stars= new String[4];
		}else if(stars5==null){
			stars= new String[5];
		}else if(stars6==null){
			stars= new String[6];
		}else if(stars7==null){
			stars= new String[7];
		}else if(stars8==null){
			stars= new String[8];
		}else if(stars9==null){
			stars= new String[9];
		}else {
			stars= new String[10];
		}
		String[] ready = {stars0,stars1,stars2,stars3,stars4,stars5,stars6,stars7,stars8,stars9};
		for (int i = 0; i < stars.length; i++) {
			stars[i]=ready[i];
		}
		return stars;
	}
	
}
	
