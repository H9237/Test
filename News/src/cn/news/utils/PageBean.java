package cn.news.utils;

import java.util.List;

public class PageBean<T> {
	private int pageNum;
	private int pageSum;
	private int dataSum;
	private int pageSize;
	private List<T> list;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSum() {
		return dataSum % pageSize == 0 ? dataSum / pageSize : (dataSum
				/ pageSize + 1);
	}

	public void setPageSum(int pageSum) {
		this.pageSum = pageSum;
	}

	public int getDataSum() {
		return dataSum;
	}

	public void setDataSum(int dataSum) {
		this.dataSum = dataSum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
