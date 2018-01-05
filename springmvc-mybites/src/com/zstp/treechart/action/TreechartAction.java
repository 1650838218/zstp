package com.zstp.treechart.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * TODO 图谱Action
 * @author 周俊林
 * @Date 2018-1-5 03:34:35
 */
@Controller
@RequestMapping("/zstp/treechart")
public class TreechartAction {

	@RequestMapping(value = "/tt", method = RequestMethod.GET)
	@ResponseBody
	public String test() {
		return "恭喜你成功了";
	}
}