package com.zstp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 * TODO 笔记 
 * @author 周俊林
 * @Date 2018-1-31 下午4:08:24
 */
@Entity
@Table(name = "zstp_note")
public class Note {

	private int id;
	private String nodeId;
	private String title;
	private String content;
	private Date creTime;
	private Date updateTime;
	
	/*主键生成策略
	 * jpa 生成策略  @GeneratedValue(strategy = GenerationType.IDENTITY) 
	 * hibernate 生成策略
	 * 		@GeneratedValue(generator = "xxx")    
	 *		@GenericGenerator(name = "xxx", strategy = "identity") 
	 * */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@NotNull(message = "{zstp.Note.id.NotNull}")
	@Column(name = "id", length = 50)
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	@NotNull(message = "{zstp.Note.nodeId.NotNull}")
	@Column(name = "nodeId", length = 50)
	public String getNodeId() {
		return nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	@NotNull(message = "{zstp.Note.title.NotNull}")
	@Column(name = "title", length = 100)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name = "cre_time")
	public Date getCreTime() {
		return creTime;
	}
	public void setCreTime(Date creTime) {
		this.creTime = creTime;
	}
	
	@Column(name = "update_time")
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
