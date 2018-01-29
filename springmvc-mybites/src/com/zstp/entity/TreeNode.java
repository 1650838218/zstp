package com.zstp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "zstp_folder")
public class TreeNode {

	private String id;// 主键id
	private String pId;// 父id
	private String name;// 节点名称
	private Date creTime;// 创建时间
	private Date updateTime;// 更新时间

	@Id
	@Column(name = "id", length = 50)
	@NotNull(message = "{zstp.TreeNode.id.NotNull}")
	@Size(min = 4, max = 50, message = "{zstp.TreeNode.id.Size}")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "pId", length = 50)
	@NotNull(message = "{zstp.TreeNode.pId.NotNull}")
	@Size(min = 2, max = 50, message = "{zstp.TreeNode.pId.Size}")
	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	@Column(name = "name", length = 20)
	@NotNull(message = "{zstp.TreeNode.name.NotNull}")
	@Size(max = 20, message = "{zstp.TreeNode.name.Size}")
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
}
