package top.chenzhuofan.web.service;

import top.chenzhuofan.web.bean.IndexPageUrlInfoBean;
import top.chenzhuofan.web.bean.ItNewsBean;

import java.util.List;

/**
 * 功能说明：TODO
 *
 * @author fengqingyang
 * @return
 * @date [2019年04月05日上午15:12]
 */
public interface IndexPageService {
    /**
     * 功能说明：获取首页信息
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年04月05日 15:13:53 15:13] 创建方法by fengqingyang
     */
    List<IndexPageUrlInfoBean> getIndexPageInfo();

    /**
     * 功能说明：根据urlKey获取模板地址
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年04月06日 21:35:16 21:35] 创建方法by fengqingyang
     */
    String getUrlTemplate(String urlKey);

    /**
     * 功能说明：获取新闻列表页
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年05月25日 16:10:36 16:10] 创建方法by fengqingyang
     */
    List<ItNewsBean> getItNewsList(Integer pageSize, Integer PageIndex);

    /**
     * 获取it新闻的总数
     *
     * @return
     */
    Integer getNewsCount();
}
