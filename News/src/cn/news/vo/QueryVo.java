package cn.news.vo;

import java.util.Date;

import cn.news.utils.PageBean;

public class QueryVo {
	private Long id;

	private String title;

	private Date create;

	private PageBean pageBean;

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreate() {
		return create;
	}

	public void setCreate(Date create) {
		this.create = create;
	}

	@Override
	public String toString() {
		return "QueryVo [id=" + id + ", title=" + title + ", create=" + create
				+ "]";
	}

}
