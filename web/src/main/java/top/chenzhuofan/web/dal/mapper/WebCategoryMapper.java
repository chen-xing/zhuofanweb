package top.chenzhuofan.web.dal.mapper;

import top.chenzhuofan.web.dal.entity.WebCategory;

import java.util.List;

public interface WebCategoryMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WebCategory record);

    int insertSelective(WebCategory record);

    WebCategory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(WebCategory record);

    int updateByPrimaryKey(WebCategory record);

    List<WebCategory> getAll();
}
