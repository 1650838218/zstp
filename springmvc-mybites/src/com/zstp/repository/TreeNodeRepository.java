package com.zstp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zstp.entity.TreeNode;

/**
 * TODO dao接口定义
 * @author 周俊林
 * @Date 2018-1-27 下午5:46:46
 */
public interface TreeNodeRepository extends JpaRepository<TreeNode, String> {

}
