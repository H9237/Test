package cn.news.pojo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class New {
	private Long id;

	private String sort;

	private String title;

	private Integer origin;

	@JSONField(format = "yyyy-MM-dd")
	private Date creates;

	private String host;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort == null ? null : sort.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public Integer getOrigin() {
		return origin;
	}

	public void setOrigin(Integer origin) {
		this.origin = origin;
	}

	public Date getCreate() {
		return creates;
	}

	public void setCreate(Date creates) {
		this.creates = creates;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host == null ? null : host.trim();
	}
}