package com.zstp.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * TODO 图谱Action
 * @author 周俊林
 * @Date 2018-1-5 03:34:35
 */
@Controller
public class ZstpAction {

	/**
	 * TODO 知识图谱的主页面
	 * @author 周俊林
	 * @Date 2018-1-13 下午05:20:28
	 * @return
	 */
	@RequestMapping(value = "/zstpView", method = RequestMethod.GET)
	public String zstpView() {
		return "zstp/zstp";
	}

}