//package com.world.thread;
//
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//@Component
//public class TestThread {
//	
//	public static int sum = 0;
//	
//	@Scheduled(cron = "${jobs.cron}")
//	public void threadOne(){
//		sum++;
//		System.out.println("第" + sum + "次运行");
//	}
//
//}
