package com.zstp.service;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zstp.entity.TreeNode;
import com.zstp.repository.TreeNodeRepository;

/**
 * TODO 文件夹树 服务实现类
 * @author 周俊林
 * @Date 2018-1-27 下午6:00:39
 */
@Service
public class TreeNodeServiceImpl implements TreeNodeService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private TreeNodeRepository treeNodeRepository;
	
	/**
	 * TODO 新建文件夹
	 * @author 周俊林
	 * @Date 2018-1-27 下午6:10:28
	 * @param treeNode
	 * @return
	 */
	@Override
	public TreeNode saveNode(TreeNode treeNode) {
		treeNode.setCreTime(new Date());
		treeNode.setUpdateTime(new Date());
		return treeNodeRepository.saveAndFlush(treeNode);
	}

	@Override
	public boolean isExist(String id) {
		try {
			TreeNode treeNode = treeNodeRepository.findOne(id);
			if (treeNode == null || StringUtils.isBlank(treeNode.getId())) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			return false;
		}
	}

}
