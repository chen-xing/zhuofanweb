package top.chenzhuofan.web.dal.mapper;

import top.chenzhuofan.web.dal.entity.ItNews;

import java.util.List;

public interface ItNewsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ItNews record);

    int insertSelective(ItNews record);

    ItNews selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ItNews record);

    int updateByPrimaryKey(ItNews record);

    List<ItNews> getAllItNews();

    Integer getNewsCount();
}
