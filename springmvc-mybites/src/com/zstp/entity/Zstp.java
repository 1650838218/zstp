package com.zstp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 * TODO 树节点实体类
 * @author 周俊林
 * @Date 2018-1-27 下午3:54:45
 */
@Entity
@Table(name = "zstp")
public class Zstp {

	private Integer id;// 主键id
	private String pId;// 父id
	private String type;// 类型 0：文件夹，1 笔记
	private String name;// 节点名称
	private String content;// 内容
	private Date creTime;// 创建时间
	private Date updateTime;// 更新时间

	
	/*主键生成策略
	 * jpa 生成策略  @GeneratedValue(strategy = GenerationType.IDENTITY) 
	 * hibernate 生成策略
	 * 		@GeneratedValue(generator = "xxx")    
	 *		@GenericGenerator(name = "xxx", strategy = "identity") 
	 * */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name = "id", length = 50)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "pId", length = 50)
	@Size(max = 50, message = "{zstp.pId.Size}")
	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	@Column(name = "name", length = 20)
	@NotNull(message = "{zstp.name.NotNull}")
	@Size(max = 20, message = "{zstp.name.Size}")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "cre_time")
	@JsonIgnore//将java bean转换成json时会忽略此属性
	public Date getCreTime() {
		return creTime;
	}

	public void setCreTime(Date creTime) {
		this.creTime = creTime;
	}

	@Column(name = "update_time")
	@JsonIgnore
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "type", length = 1)
	@NotNull(message = "{zstp.type.NotNull}")
	@Size(min = 1, max = 1, message = "{zstp.type.Size}")
	@JsonIgnore
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "content")
	@JsonIgnore
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
