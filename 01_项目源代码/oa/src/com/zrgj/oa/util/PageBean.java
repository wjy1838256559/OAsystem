package com.zrgj.oa.util;

import java.util.List;

/**
 * @author song
 * 
 *         功能:封装页面分页信息
 * 
 *         日期：2016-11-17
 */
public class PageBean {

	private int pageIndex;
	private int pageSize;

	private List recordList;
	private int count;

	private int countPage;
	private int beginPageIndex;
	private int endPageIndex;

	public PageBean(int pageIndex, int pageSize, List recordList, int count) {
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.recordList = recordList;
		this.count = count;

		this.countPage = (count + pageSize - 1) / pageSize;

		if (countPage <= pageSize) {
			endPageIndex = countPage;
			beginPageIndex = 1;
		} else {
			beginPageIndex = pageIndex - 2;
			endPageIndex = pageIndex + 2;
			if (beginPageIndex < 1) {
				beginPageIndex = 1;
				endPageIndex = 5;
			}
			if (endPageIndex > countPage) {
				endPageIndex = countPage;
				beginPageIndex = countPage - 5 + 1;
			}
		}

	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List getRecordList() {
		return recordList;
	}

	public void setRecordList(List recordList) {
		this.recordList = recordList;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(int beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public int getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

}
