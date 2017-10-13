package cn.news.biz;

import cn.news.pojo.New;
import cn.news.utils.PageBean;
import cn.news.vo.QueryVo;

public interface NewBiz {

	PageBean<New> getNews(int pageNum, int pageSize);

	PageBean<New> getNewsById(int pageNum, int pageSize, QueryVo vo);

	New getNewById(Long id);

	void updateNew(New new1);

	void delNewById(Long id);

}
