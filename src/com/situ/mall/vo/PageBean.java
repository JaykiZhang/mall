package com.situ.mall.vo;

import java.io.Serializable;
import java.util.List;

public class PageBean<T> implements Serializable {
	// 当前页
	private Integer pageIndex;
	// 当前页显示的总条数
	private Integer pageSize;
	// 总条数
	private Integer totalCount;
	// 总页数
	private Integer totalPage;
	// 当前页要显示的数据
	private List<T> list ;
	
	public PageBean() {
		super();
	}

	public PageBean(Integer pageIndex, Integer pageSize, Integer totalCount, Integer totalPage, List<T> list) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.list = list;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "PageBean [pageIndex=" + pageIndex + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", list=" + list + "]";
	}

}
