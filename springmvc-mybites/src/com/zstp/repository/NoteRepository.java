package com.zstp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.zstp.entity.Note;

/**
 * TODO 
 * 继承 JpaSpecificationExecutor 可以实现动态分页查询
 * @author 周俊林
 * @Date 2018-1-31 下午5:14:06
 */
public interface NoteRepository extends JpaRepository<Note, String>, JpaSpecificationExecutor<Note> {

}
