package com.zstp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.zstp.entity.TreeNode;

/**
 * TODO dao接口定义
 * @author 周俊林
 * @Date 2018-1-27 下午5:46:46
 */
@Transactional
public interface TreeNodeRepository extends JpaRepository<TreeNode, String> {

	@Modifying
	@Query("delete from TreeNode t where t.id like ?1%")
	public int deleteNode(String nodeId);
}
