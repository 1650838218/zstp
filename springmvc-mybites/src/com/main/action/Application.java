package com.main.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO 程序入口类，首页
 * @author 周俊林
 * @Date 2018-1-11 下午08:57:23
 */
@Controller
public class Application {

	@RequestMapping(value = "/homepage")
	public String mainView() {
		return "index/index";
	}
}
