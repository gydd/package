package com.yhao.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestDs {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
		System.out.println(ac.getBean("ds"));
	}
}
