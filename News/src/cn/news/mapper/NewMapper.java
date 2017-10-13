package cn.news.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.news.pojo.New;
import cn.news.vo.QueryVo;

public interface NewMapper {

	int getCount();

	List<New> getNews(@Param("pageNum") int pageNum,
			@Param("pageSize") int pageSize);

	List<New> getNewsById(QueryVo vo);

	int getCountById(QueryVo vo);

	New getNewById(Long id);

	void updateNew(New new1);

	void delNewById(Long id);

}