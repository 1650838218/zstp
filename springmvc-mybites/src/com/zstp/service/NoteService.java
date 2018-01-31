package com.zstp.service;

import org.springframework.data.domain.Page;

import com.zstp.entity.Note;

/**
 * TODO 
 * @author 周俊林
 * @Date 2018-1-31 下午4:58:30
 */
public interface NoteService {

	/**
	 * TODO 根据文件夹id分页查询文件夹下的文件
	 * @author 周俊林
	 * @Date 2018-1-31 下午4:58:43
	 * @param nodeId
	 * @param page
	 * @param limit
	 * @return
	 */
	Page<Note> queryNotes(String nodeId, int page, int limit);

}
