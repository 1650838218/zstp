package com.zstp.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.zstp.entity.Zstp;
import com.zstp.repository.ZstpRepository;

/**
 * TODO 文件夹树 服务实现类
 * @author 周俊林
 * @Date 2018-1-27 下午6:00:39
 */
@Service
public class ZstpServiceImpl implements ZstpService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ZstpRepository zstpRepository;
	
	/**
	 * TODO 新建文件夹
	 * @author 周俊林
	 * @Date 2018-1-27 下午6:10:28
	 * @param treeNode
	 * @return
	 */
	@Override
	public Zstp save(Zstp zstp) {
		zstp.setCreTime(new Date());
		zstp.setUpdateTime(new Date());
		return zstpRepository.saveAndFlush(zstp);
	}

	@Override
	public boolean isExist(Integer id) {
		try {
			Zstp treeNode = zstpRepository.findOne(id);
			
			if (treeNode == null || treeNode.getId() == null) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			return false;
		}
	}

	/**
	 * TODO 初始化zNodes
	 * @author 周俊林
	 * @Date 2018-1-29 下午4:28:24
	 * @return
	 */
	@Override
	public String initNodes() {
		try {
			List<Zstp> treeNodeList = zstpRepository.findByType("0");// 查询所有节点
			ObjectMapper mapper = new ObjectMapper();
			JsonNode jsonNode = mapper.readTree(mapper.writeValueAsString(treeNodeList));
			if (jsonNode.isArray()) {
				for (int i = 0; i < jsonNode.size(); i++) {
					if (jsonNode.get(i).get("id").asText().equals("1")) {// 根节点
						((ObjectNode)jsonNode.get(i)).put("open",true);
						((ObjectNode)jsonNode.get(i)).put("drag",false);
						break;
					} 
				}
			}
			log.info(jsonNode.toString());
			return jsonNode.toString();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@Override
	public boolean delete(String nodeId) {
		try {
			if (zstpRepository.deleteNode(nodeId) > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return false;
	}

	@Override
	public Page<Zstp> queryNotes(final String nodeId, int page, int limit) {
		Pageable pageable = new PageRequest(page, limit);
		return zstpRepository.findAll(new Specification<Zstp>() {
			@Override
			public Predicate toPredicate(Root<Zstp> root, CriteriaQuery<?> query,
					CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(nodeId)) {
					predicates.add(cb.equal(root.get("pId").as(String.class), nodeId));
				}
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		}, pageable);
	}
}
