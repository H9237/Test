package cn.news.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.news.biz.NewBiz;
import cn.news.mapper.NewMapper;
import cn.news.pojo.New;
import cn.news.utils.PageBean;
import cn.news.vo.QueryVo;

@Service(value = "newBiz")
public class NewBizImpl implements NewBiz {
	@Autowired
	private NewMapper newMapper;

	@Override
	public PageBean<New> getNews(int pageNum, int pageSize) {
		PageBean<New> pageBean = new PageBean<New>();
		List<New> list = newMapper.getNews((pageNum - 1) * pageSize, pageSize);
		int dataSum = newMapper.getCount();
		pageBean.setList(list);
		pageBean.setDataSum(dataSum);
		pageBean.setPageNum(pageNum);
		pageBean.setPageSize(pageSize);
		return pageBean;
	}

	@Override
	public PageBean<New> getNewsById(int pageNum, int pageSize, QueryVo vo) {
		PageBean<New> pageBean = new PageBean<New>();
		pageBean.setPageNum((pageNum - 1) * pageSize);
		pageBean.setPageSize(pageSize);
		vo.setPageBean(pageBean);
		List<New> list = newMapper.getNewsById(vo);
		int dataSum = newMapper.getCountById(vo);
		pageBean.setList(list);
		pageBean.setDataSum(dataSum);
		pageBean.setPageNum(pageNum);
		return pageBean;
	}

	@Override
	public New getNewById(Long id) {

		return newMapper.getNewById(id);
	}

	@Override
	public void updateNew(New new1) {

		newMapper.updateNew(new1);
	}

	@Override
	public void delNewById(Long id) {
		newMapper.delNewById(id);
	}
}
