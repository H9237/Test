package cn.news.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.news.biz.NewBiz;
import cn.news.pojo.New;
import cn.news.utils.PageBean;
import cn.news.vo.QueryVo;

@Controller
public class NewsController {
	@Resource(name = "newBiz")
	private NewBiz newBiz;

	@ResponseBody
	@RequestMapping("/getNews/{pageNum}")
	public PageBean<New> getNews(@PathVariable("pageNum") int pageNum) {
		int pageSize = 3;
		PageBean<New> pageBean = newBiz.getNews(pageNum, pageSize);
		System.out.println(pageBean.getList().size());
		return pageBean;
	}

	@ResponseBody
	@RequestMapping("/getNewsById/{pageNum}")
	public PageBean<New> getNewsById(@PathVariable("pageNum") int pageNum,
			HttpServletRequest request, Date create) {
		int pageSize = 3;
		long id = 0;
		if (request.getParameter("id") != "") {
			id = Long.parseLong(request.getParameter("id"));
		}
		String title = request.getParameter("title");
		QueryVo vo = new QueryVo();
		vo.setId(id);
		vo.setTitle(title);
		vo.setCreate(create);
		PageBean<New> pageBean = newBiz.getNewsById(pageNum, pageSize, vo);
		return pageBean;
	}

	@RequestMapping("getNewById/{id}")
	public String getNewById(@PathVariable("id") Long id,
			HttpServletRequest request) {
		New new1 = newBiz.getNewById(id);
		request.setAttribute("n", new1);
		return "/WEB-INF/jsp/update";
	}

	@RequestMapping("updateNew")
	public String updateNew(New new1) {
		newBiz.updateNew(new1);
		return "index";
	}

	@RequestMapping("delNewById/{id}")
	public String delNewById(@PathVariable("id") Long id) {
		newBiz.delNewById(id);
		return "index";
	}
}
