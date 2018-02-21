package com.zstp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.zstp.entity.Zstp;

/**
 * TODO dao接口定义
 * @author 周俊林
 * @Date 2018-1-27 下午5:46:46
 */
@Transactional
public interface ZstpRepository extends JpaRepository<Zstp, Integer>, JpaSpecificationExecutor<Zstp> {

	@Modifying
	@Query("delete from Zstp t where t.id like ?1%")
	public int deleteNode(String nodeId);

	public List<Zstp> findByType(String type);
}
