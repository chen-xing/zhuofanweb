package top.chenzhuofan.web.dal.mapper;

import top.chenzhuofan.web.dal.entity.WebUrl;

import java.util.List;

public interface WebUrlMapper {
    int deleteByPrimaryKey(Long id);

    int insert(WebUrl record);

    int insertSelective(WebUrl record);

    WebUrl selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(WebUrl record);

    int updateByPrimaryKey(WebUrl record);

    List<WebUrl> getListByCategoryId(String categoryUuid);

    WebUrl selectByUrl(String url);
}
