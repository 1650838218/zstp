package com.zstp.service;

import java.util.ArrayList;
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

import com.zstp.entity.Note;
import com.zstp.repository.NoteRepository;

@Service
public class NoteServiceImpl implements NoteService {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private NoteRepository noteRepository;

	@Override
	public Page<Note> queryNotes(final String nodeId, int page, int limit) {
		Pageable pageable = new PageRequest(page, limit);
		return noteRepository.findAll(new Specification<Note>() {
			@Override
			public Predicate toPredicate(Root<Note> root, CriteriaQuery<?> query,
					CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				if (StringUtils.isNotBlank(nodeId)) {
					predicates.add(cb.equal(root.get("nodeId").as(String.class), nodeId));
				}
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		}, pageable);
	}
}
