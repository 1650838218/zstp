package com.zstp.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.zstp.entity.TreeNode;
import com.zstp.service.TreeNodeService;

/**
 * TODO 图谱Action
 * @author 周俊林
 * @Date 2018-1-5 03:34:35
 */
@Controller
@RequestMapping("/zstp")
public class ZstpAction {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private TreeNodeService treeNodeService;
	
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

	/**
	 * TODO 添加文件夹
	 * 在需要校验的pojo前边加@Validated，在需要校验的pojo后边添加BindingResult bindingResult接收校验出错信息  
	 * 注意：@Validatedh和BindingResult bindingResult是配对出现，并且在形参中出现的顺序是固定的(一前一后)  
	 * @author 周俊林
	 * @Date 2018-1-27 下午4:55:46
	 * @param treeNode
	 * @param response
	 * @param bindingResult
	 * @return
	 */
	@RequestMapping(value = "/saveNode", method = RequestMethod.POST)
	@ResponseBody
	public String saveNode(@Validated TreeNode treeNode, BindingResult bindingResult, HttpServletResponse response) {
		ObjectNode json = new JsonNodeFactory(false).objectNode();
		//获取校验错误信息  
        if(bindingResult.hasErrors()){  
        	List<ObjectError> listError = bindingResult.getAllErrors();
        	String error = "";
        	for (ObjectError objectError : listError) {
				error += objectError.getDefaultMessage() + "<br>";
			}
            json.put("error", error);
            json.put("success", false);
        } else {
        	try {
				treeNodeService.saveNode(treeNode);// 保存
				json.put("success", true);
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				json.put("error", "新建文件夹失败！");
				json.put("success", false);
			}
        }
        if (!json.findValue("success").asBoolean()) {
        	// 如果保存失败，则判断 是新建文件夹还是修改文件夹，如果是新建flag=add，如果是修改flag=update
        	if (StringUtils.isBlank(treeNode.getId())) {
        		json.put("flag", "add");
        	} else {
        		if (treeNodeService.isExist(treeNode.getId())) {
        			json.put("flag", "update");
        		} else {
        			json.put("flag", "add");
        		}
        	}
        }
        log.info(json.toString());
		return json.toString();
	}
}