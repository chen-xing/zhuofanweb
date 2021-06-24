package top.chenzhuofan.web.response;

import lombok.Data;
import top.chenzhuofan.web.bean.ItNewsBean;

import java.util.List;

/**
 * 功能说明：
 *
 * @author fengqingyang
 * @return
 * @date [2019年10月26日上午14:10]
 */
@Data
public class GetNewsInfoResponse {
    private Integer total;
    private List<ItNewsBean> itNewsBeanList;
}
