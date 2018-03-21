package com.pro.kkst.utils;

public class ow_onwerUtil {

	
	public String isOne(String result) {
		
		if(result.substring(0,1).equals("0")) {
			result=result.substring(1,2);
		}else if(result.substring(0,1)!="0")
		{
			return result;
		}
		
		
		
		return result;
	}
	
}
