package top.chenzhuofan.web.bean;

import lombok.Data;

import java.util.List;

/**
 * 功能说明：TODO
 *
 * @author fengqingyang
 * @return
 * @date [2019年04月05日上午15:10]
 */
@Data
public class IndexPageUrlInfoBean {
    private String gategoryName;
    private List<WebUrlBean> webUrlBeanList;
}
