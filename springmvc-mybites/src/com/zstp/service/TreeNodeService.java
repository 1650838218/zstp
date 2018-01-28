package com.zstp.service;

import com.zstp.entity.TreeNode;

/**
 * TODO 文件夹树 服务接口
 * @author 周俊林
 * @Date 2018-1-27 下午5:57:04
 */
public interface TreeNodeService {

	/**
	 * TODO 新建文件夹
	 * @author 周俊林
	 * @Date 2018-1-27 下午5:59:16
	 * @return
	 */
	public TreeNode saveNode(TreeNode treeNode);

	/**
	 * TODO 根据id判断该文件夹在数据库中是否存在
	 * @author 周俊林
	 * @Date 2018-1-28 下午1:51:51
	 * @param id
	 * @return
	 */
	public boolean isExist(String id);
}
