package top.chenzhuofan.web.service.impl;

import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import top.chenzhuofan.web.bean.IndexPageUrlInfoBean;
import top.chenzhuofan.web.bean.ItNewsBean;
import top.chenzhuofan.web.bean.WebUrlBean;
import top.chenzhuofan.web.dal.entity.ItNews;
import top.chenzhuofan.web.dal.entity.WebCategory;
import top.chenzhuofan.web.dal.entity.WebUrl;
import top.chenzhuofan.web.dal.mapper.ItNewsMapper;
import top.chenzhuofan.web.dal.mapper.WebCategoryMapper;
import top.chenzhuofan.web.dal.mapper.WebUrlMapper;
import top.chenzhuofan.web.service.IndexPageService;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 功能说明：TODO
 *
 * @author fengqingyang
 * @return
 * @date [2019年04月05日上午15:14]
 */
@Slf4j
@Service
public class IndexPageServiceImpl implements IndexPageService {

    @Autowired private WebCategoryMapper webCategoryMapper;

    @Autowired private WebUrlMapper webUrlMapper;

    @Autowired private ItNewsMapper itNewsMapper;

    /**
     * 功能说明：获取首页信息
     *
     * @return <br>
     *     修改历史<br>
     *     [2019年04月05日 15:13:53 15:13] 创建方法by fengqingyang
     * @params
     */
    @Override
    public List<IndexPageUrlInfoBean> getIndexPageInfo() {
        List<WebCategory> webCategoryList = webCategoryMapper.getAll();
        if (CollectionUtils.isEmpty(webCategoryList)) {
            return null;
        }

        List<IndexPageUrlInfoBean> indexPageUrlInfoBeanList =
                webCategoryList.stream()
                        .map(
                                x -> {
                                    IndexPageUrlInfoBean indexPageUrlInfoBean =
                                            new IndexPageUrlInfoBean();
                                    indexPageUrlInfoBean.setGategoryName(x.getName());
                                    List<WebUrl> webUrlList =
                                            webUrlMapper.getListByCategoryId(x.getUuid());
                                    if (!CollectionUtils.isEmpty(webUrlList)) {
                                        List<WebUrlBean> webUrlBeanList =
                                                webUrlList.stream()
                                                        .map(
                                                                y -> {
                                                                    WebUrlBean webUrlBean =
                                                                            new WebUrlBean();
                                                                    webUrlBean.setTitle(
                                                                            y.getTitle());
                                                                    webUrlBean.setDescription(
                                                                            y.getDescription());
                                                                    webUrlBean.setIcoImage(
                                                                            y.getIcoImage());
                                                                    webUrlBean.setUrl(y.getUrl());
                                                                    return webUrlBean;
                                                                })
                                                        .collect(Collectors.toList());
                                        indexPageUrlInfoBean.setWebUrlBeanList(webUrlBeanList);
                                    }

                                    return indexPageUrlInfoBean;
                                })
                        .collect(Collectors.toList());

        return indexPageUrlInfoBeanList;
    }

    /**
     * 功能说明：根据urlKey获取模板地址
     *
     * @param urlKey
     * @return <br>
     *     修改历史<br>
     *     [2019年04月06日 21:35:16 21:35] 创建方法by fengqingyang
     * @params
     */
    @Override
    public String getUrlTemplate(String urlKey) {
        WebUrl webUrl = webUrlMapper.selectByUrl(urlKey);
        if (null != webUrl) {
            return webUrl.getTemplateUrl();
        }
        return null;
    }

    /**
     * 功能说明：获取新闻列表页
     *
     * @param pageSize
     * @param PageIndex
     * @return <br>
     *     修改历史<br>
     *     [2019年05月25日 16:10:36 16:10] 创建方法by fengqingyang
     * @params
     */
    @Override
    public List<ItNewsBean> getItNewsList(Integer pageSize, Integer PageIndex) {
        PageHelper.startPage(PageIndex, pageSize);
        List<ItNews> itNewsList = itNewsMapper.getAllItNews();
        if (null != itNewsList && itNewsList.size() > 0) {
            List<ItNewsBean> itNewsBeanList =
                    itNewsList.stream()
                            .map(
                                    x -> {
                                        ItNewsBean itNewsBean = new ItNewsBean();
                                        itNewsBean.setTitle(x.getTitle());
                                        itNewsBean.setUrl(x.getUrl());
                                        itNewsBean.setGmtCreate(
                                                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                                        .format(x.getGmtCreate()));
                                        return itNewsBean;
                                    })
                            .collect(Collectors.toList());
            return itNewsBeanList;
        }
        return null;
    }

    /**
     * 获取it新闻的总数
     *
     * @return
     */
    @Override
    public Integer getNewsCount() {
        return itNewsMapper.getNewsCount();
    }
}
