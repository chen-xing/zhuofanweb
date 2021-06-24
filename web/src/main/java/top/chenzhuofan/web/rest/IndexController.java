package top.chenzhuofan.web.rest;

import com.alibaba.druid.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import top.chenzhuofan.web.bean.IndexPageUrlInfoBean;
import top.chenzhuofan.web.bean.ItNewsBean;
import top.chenzhuofan.web.service.IndexPageService;
import top.chenzhuofan.web.util.aop.MethodMonitor;

import java.util.List;

/**
 * 功能说明：TODO
 *
 * @author fengqingyang
 * @return
 * @date [2019年04月05日上午15:36]
 */
@Controller
@Slf4j
public class IndexController {
    @Autowired private IndexPageService indexPageService;

    @RequestMapping("/")
    @MethodMonitor
    public String home(Model model) {
        List<IndexPageUrlInfoBean> indexPageUrlInfoBeanList = indexPageService.getIndexPageInfo();
        model.addAttribute("pageInfo", indexPageUrlInfoBeanList);
        return "index";
    }

    @RequestMapping("/v2")
    @MethodMonitor
    public String homeV2(Model model) {
        List<IndexPageUrlInfoBean> indexPageUrlInfoBeanList = indexPageService.getIndexPageInfo();
        model.addAttribute("pageInfo", indexPageUrlInfoBeanList);
        return "index_v2";
    }

    @RequestMapping("/{urlKey}")
    @MethodMonitor
    public String gotoUrl(@PathVariable("urlKey") String urlKey, Model model) {
        String templateUrl = indexPageService.getUrlTemplate("/" + urlKey);
        if (StringUtils.isEmpty(templateUrl)) {
            return "index";
        }
        return templateUrl;
    }

    /**
     * 功能说明：新闻列表页
     *
     * @params
     * @return <br>
     *     修改历史<br>
     *     [2019年05月25日 16:01:42 16:01] 创建方法by fengqingyang
     */
    @RequestMapping("/news/{pageIndex}")
    @MethodMonitor
    public String gotoUrl(@PathVariable("pageIndex") Integer pageIndex, Model model) {
        if (null == pageIndex) {
            pageIndex = 1;
        }
        List<ItNewsBean> itNewsBeanList = indexPageService.getItNewsList(30, pageIndex);
        model.addAttribute("newsInfo", itNewsBeanList);
        return "news/newsInfo";
    }
}
