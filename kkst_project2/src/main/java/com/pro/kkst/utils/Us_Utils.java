package com.pro.kkst.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Us_Utils {

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
	
	
	
	
}
