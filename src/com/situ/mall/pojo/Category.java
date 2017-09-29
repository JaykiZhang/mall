package com.situ.mall.pojo;

import java.util.Date;

public class Category {
	private int id;
	private int parentId;
	private String name;
	private int status;
	private int sortOrder;
	private Date createTime;
	private Date updateTime;

	public Category() {
		super();
	}

	public Category(int id, int parentId, String name, int status, int sortOrder, Date createTime, Date updateTime) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.status = status;
		this.sortOrder = sortOrder;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getsortOrder() {
		return sortOrder;
	}

	public void setsortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", parentId=" + parentId + ", name=" + name + ", status=" + status
				+ ", sortOrder=" + sortOrder + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}

}
