package com.tyut.servlet;

public class OnlineCounter {
	private static long onlineCounter=0;
	
	public static void addCounter(){
		onlineCounter=onlineCounter+1;
	}
	
	public static void reduceCounter(){
		onlineCounter=onlineCounter-1;
	}
	
	public static long getCounter(){
		return onlineCounter;
	}
}
